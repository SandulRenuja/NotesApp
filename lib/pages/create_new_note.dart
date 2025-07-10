import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note/services/note_service.dart';
import 'package:note/utils/colors.dart';
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
                   widget.isNewCategory 
                   ? Container(
                     decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        style: TextStyle(
                        color: AppColors.kWhiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: "New Category",
                        hintStyle: TextStyle(
                          color: AppColors.kWhiteColor.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                           fontFamily: GoogleFonts.dmSans().fontFamily,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: AppColors.kWhiteColor.withOpacity(0.1),
                          width: 2
                        ),
                        
                      ),
                     focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColors.kWhiteColor.withOpacity(0.1),
                              width: 1,
                            ),
                          ),
                    ), 
                   )
                   )
                   :  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonFormField(
                        style: TextStyle(
                          color: AppColors.kWhiteColor,
                          fontFamily: GoogleFonts.dmSans().fontFamily,
                          fontWeight: FontWeight.w500,fontSize: 20,
                        ),
                        isExpanded: false,
                        hint: Text("category"),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColors.kWhiteColor.withOpacity(0.1),
                              width: 2
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: AppColors.kWhiteColor.withOpacity(0.1),
                              width: 1,
                            ),
                          ),
                        ),
                        items: categories.map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(
                              category,
                            style: AppTextStyles.appButton,
                            ),
                          );
                        }).toList(),
                        onChanged: (value){}),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    //title field
                    TextFormField(
                      maxLines: 2,
                      style: TextStyle(
                        color: AppColors.kWhiteColor,
                        fontSize: 30,
                      ),
                      decoration: InputDecoration(
                        hintText: "Note Content",
                        hintStyle: TextStyle(
                          color: AppColors.kWhiteColor.withOpacity(0.5),
                          fontSize: 35,
                        ),
                        border: InputBorder.none,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    //content
                    TextFormField(
                      maxLines: 12,
                      style: TextStyle(
                        color: AppColors.kWhiteColor,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        hintText: "Note Title",
                        hintStyle: TextStyle(
                          color: AppColors.kWhiteColor.withOpacity(0.5),
                          fontSize: 20,
                        ),
                        border: InputBorder.none,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Divider(
                      color: AppColors.kWhiteColor.withOpacity(0.2),
                      thickness: 1,
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(AppColors.kFabColor),
                          ),
                          onPressed: (){}, 
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Save Note",
                            style: AppTextStyles.appButton,
                            ),
                            ),),
                      ],
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