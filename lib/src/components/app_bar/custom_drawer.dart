import 'package:flutter/material.dart';
import 'package:to_do_application/src/components/app_bar/list_card.dart';
import 'package:to_do_application/src/routes.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menú',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListCard(name_card: "Home", icon: Icon(Icons.accessibility_outlined), routes: AppRoutes.home,),
          ListCard(name_card: "Crear tarea", icon: Icon(Icons.new_label_rounded), routes:  AppRoutes.create,),
          ListCard(name_card: "Tareas realizadas", icon: Icon(Icons.done_all_rounded), routes:  AppRoutes.realized,),
          // Añade más opciones aquí
        ],
      ),
    );
  }

}

