import 'package:flutter/material.dart';
import 'package:note/utils/constant.dart';
import 'package:note/utils/router.dart';
import 'package:note/utils/text_style.dart';
import 'package:note/widgets/notes_todo_card.dart';
import 'package:note/widgets/progress_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NoteSphere",
        style: AppTextStyles.appTitle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: AppConstants.kDefaultPadding,
            ),
            ProgressCard(
              CompletedTasks: 3, 
              totalTasks: 5,
            ),
            SizedBox(
              height: AppConstants.kDefaultPadding * 1.5,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    //go to the notes page
                    AppRouter.router.push("/notes");
                  },
                  child: NotesTodoCard(
                    title: "Notes", 
                    description: "3 Notes", 
                    icon: Icons.bookmark_add_outlined,
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    AppRouter.router.push("/todos");
                  },
                  child: NotesTodoCard(
                    title: "To-Do-List", 
                    description: "4 Tasks", 
                    icon: Icons.today_outlined,
                  ),
                ),
              ],
            ),

             SizedBox(
              height: AppConstants.kDefaultPadding * 1.5,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Progress",
                  style: AppTextStyles.appSubTitle,  
                ),

                Text(
                  "See All",
                  style: AppTextStyles.appButton,  
                ),
              ],
            ),

          ],
        ),
        ),
    );
  }  
}