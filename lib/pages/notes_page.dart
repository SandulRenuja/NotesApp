import 'package:flutter/material.dart';
import 'package:note/models/note_model.dart';
import 'package:note/services/note_service.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/constant.dart';
import 'package:note/utils/router.dart';
import 'package:note/utils/text_style.dart';
import 'package:note/widgets/bottom_sheet.dart';
import 'package:note/widgets/notes_card.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final NoteService noteService =NoteService();
  List<Note> allNotes = [];
  Map<String, List<Note>> notesWithCategory = {};

   @override
  void initState() {
    super.initState();
    _checkIfUserIsNew();
  }

  void _checkIfUserIsNew() async {
    // Check if the notes box is empty
    final bool isNewUser = await noteService.isNewUser();
    if (isNewUser) {
      // If the user is new, create the initial notes
      await noteService.createInitialNotes();
    }
    // Load the notes
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final List<Note> loadedNotes = await noteService.loadNotes();

    final Map<String, List<Note>> notesCategoryies =
        noteService.getNotesByCategoryMap(loadedNotes);

    setState(() {
      allNotes = loadedNotes;
      notesWithCategory = notesCategoryies;
    });
  }

  //openbotton sheet
  void openBottonSheet(){
    showModalBottomSheet(
      barrierColor: Colors.black.withOpacity(0.7),
      context: context, 
      builder: (context) {
        return categoryInputBottomSheet(
          oneNote: () { 
           Navigator.pop(context);
           AppRouter.router.push("/create-nnote" ,extra: false);
           }, 
          oneNewCategory: () {
            Navigator.pop(context);
            AppRouter.router.push("/create-nnote" , extra: true);
            },
        );
      },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            AppRouter.router.go(
              "/",
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openBottonSheet,
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
            side: BorderSide(
              color: AppColors.kWhiteColor,
              width: 2,
            )),
        backgroundColor: AppColors.kFabColor,
        child: Icon(
          Icons.add,
          color: AppColors.kWhiteColor,
          size: 30,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(
          AppConstants.kDefaultPadding
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Notes',
              style: AppTextStyles.appTitle,
            ),
            const SizedBox(height: 30),
            allNotes.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Center(
                      child: Text(
                        "No notes available , click on the + button to add a new note",
                        style: TextStyle(
                          color: AppColors.kWhiteColor.withOpacity(0.7),
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                         SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: AppConstants.kDefaultPadding,
                      mainAxisSpacing: AppConstants.kDefaultPadding,
                      childAspectRatio: 6 / 4,
                    ),
                    itemCount: notesWithCategory.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          //go to the notes by category page
                          AppRouter.router.push(
                            "/category",
                            extra: notesWithCategory.keys.elementAt(index),
                        );
                        },
                        child: NotesCard(
                          noteCategory: notesWithCategory.keys.elementAt(index),
                          noOfNotes:
                              notesWithCategory.values.elementAt(index).length,
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}