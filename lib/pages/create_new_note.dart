import 'package:flutter/material.dart';
import 'package:note/services/note_service.dart';
import 'package:note/utils/constant.dart';
import 'package:note/utils/text_style.dart';

class CreateNotePage extends StatefulWidget {
  final bool  isNewCategory;
  const CreateNotePage({
    super.key, 
    required this.isNewCategory
  });

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  List<String> categories =[];
  final NoteService noteService = NoteService();
  Future _loadCategory()async{

    categories = await noteService.getAllCategories();
    setState(() {
      
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCategory();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Note",
        style: AppTextStyles.appSubTitle,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: AppConstants.kDefaultPadding/2),
              child: Form(
                child: Column(
                  children: [

                    //drop Down
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonFormField(
                        items: categories.map((String category) {
                          return DropdownMenuItem<String>(
                            child: Text(
                              category,
                            style: AppTextStyles.appButton,
                            ),
                          );
                        }).toList(),
                        onChanged: (value){}),
                    ),
                  ],
                ),),
            ),
          ],
        ),
      ),
    );
  }
}