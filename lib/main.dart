import 'package:flutter/material.dart';
import 'package:to_do_application/config/app_theme.dart';
import 'package:to_do_application/src/routes.dart';
import 'package:to_do_application/src/screens/Todo/to_do_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: AppTheme(selectColor: 2).theme(),
      onGenerateRoute: AppRoutes.generateRoute,
      home: const ToDoList(),
    );
  }
}


