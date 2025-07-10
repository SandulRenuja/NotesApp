import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note/models/note_model.dart';
import 'package:note/models/todo_model.dart';
import 'package:note/utils/router.dart';
import 'package:note/utils/theme_data.dart';

void main() async{

  //initialize hive
  await Hive.initFlutter();

  //register the adapter
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(TodoAdapter());

  // open hive boxes
  await Hive.openBox('notes');
  await Hive.openBox('todos');

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "NoteSphere",
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.darkTheme.copyWith(
        textTheme:GoogleFonts.dmSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routerConfig: AppRouter.router,
    );
  }
}