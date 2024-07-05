import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_application/config/app_theme.dart';
import 'package:to_do_application/src/components/app_bar/custom_app_bar.dart';
import 'package:to_do_application/src/components/app_bar/custom_drawer.dart';
import 'package:to_do_application/src/components/todo_list/home_view.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: HomeView()
      
    );
  }
}