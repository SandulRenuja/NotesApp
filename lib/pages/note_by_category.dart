import 'package:flutter/material.dart';
import 'package:note/models/note_model.dart';
import 'package:note/services/note_service.dart';
import 'package:note/utils/constant.dart';
import 'package:note/utils/router.dart';
import 'package:note/utils/text_style.dart';
import 'package:note/widgets/note_category_card.dart';

class NoteByCategory extends StatefulWidget {
  final String category;
  const NoteByCategory({
    super.key, 
    required this.category});

  @override
  State<NoteByCategory> createState() => _NoteByCategoryState();
}

class _NoteByCategoryState extends State<NoteByCategory> {

  final NoteService noteService =NoteService();
  List<Note>noteList = [];
  @override
  void initState() {
    super.initState();
    _loadNoteBycategory();
  }

  //load all notes by category 
  Future <void> _loadNoteBycategory() async{
    noteList = await noteService.getNoteByCategoryName(widget.category);
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       automaticallyImplyLeading: false,
       leading: IconButton(
        onPressed: () {
          // go to the notes page
          AppRouter.router.push("/notes");
        },
         icon: Icon(Icons.arrow_back,
        ),
      ),
    ),

    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.kDefaultPadding,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              widget.category,
              style: AppTextStyles.appTitle,
            ),
            SizedBox(
              height: 30,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppConstants.kDefaultPadding,
                mainAxisSpacing: AppConstants.kDefaultPadding,
                childAspectRatio: 7/11,
                ), 
                itemCount: noteList.length,
                itemBuilder: (context, index) {
                  return NoteCategoryCard(
                    notetitle:noteList[index].title, 
                    noteContent: noteList[index].content, 
                    removeNote: ()async {
                      
                    }, 
                    editNote: ()async {
                      
                    },
                  );
                },
              ),
          ],
        ),  
        ),
    ),
      
    );
  }
}