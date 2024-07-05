import 'package:flutter/material.dart';
import 'package:to_do_application/src/screens/Todo/realized.dart';
import 'package:to_do_application/src/screens/Todo/to_do_list.dart';
import 'package:to_do_application/src/screens/Todo/create_to_do.dart';

class AppRoutes {
  static const String home = '/';
  static const String create = '/create';
  static const String realized = '/realized';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const ToDoList());
      case create:
        return MaterialPageRoute(builder: (_) => const CreateToDo());
      case realized:
        return MaterialPageRoute(builder: (_) => const Realized());
      default:
        return MaterialPageRoute(builder: (_) => const ToDoList());
    }
  }
}
