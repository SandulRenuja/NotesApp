import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note/pages/create_new_note.dart';
import 'package:note/pages/home_page.dart';
import 'package:note/pages/note_by_category.dart';
import 'package:note/pages/notes_page.dart';
import 'package:note/pages/to_do_page.dart';

class AppRouter{
  static final router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    debugLogDiagnostics: true,
    initialLocation: "/",
    routes: [
      //homepage
      GoRoute(
        name: "home",
        path: "/",
        builder: (context, state) {
          return HomePage();
        },
      ),

      //notes page
      GoRoute(
        name: "notes",
        path: "/notes",
        builder: (context, state) {
          return NotesPage();
        },
      ),

      //todo page
      GoRoute(
        name: "todos",
        path: "/todos",
        builder: (context, state) {
          return ToDoPage();
        },
      ),

      //notes by category 
      GoRoute(
        name: "category",
        path: "/category",
        builder: (context, state) {
          final String category = state.extra as String;
          return NoteByCategory(
            category: category);
        },
      ),

      //create new note
      GoRoute(
        name: "create new",
        path: "/create-nnote",
        builder: (context, state) {
          final isNewCategoryPage = state.extra as bool;

          return CreateNotePage(
            isNewCategory: isNewCategoryPage,
          );
        },
        
      ),

      //
    ],
  );
}