import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:to_do_application/src/api/api_service.dart';
import 'package:to_do_application/src/components/snack_bar/CustomSnackBar.dart';
import 'package:to_do_application/src/routes.dart';

class ToDoListCard extends StatefulWidget {
  final String? task_name;
  final int id;
  final bool active;


  const ToDoListCard({
    super.key,
    this.task_name,
    required this.id,
    required this.active
  });

  @override
  State<ToDoListCard> createState() => _ToDoListCardState();
}

class _ToDoListCardState extends State<ToDoListCard> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${widget.task_name}", style: TextStyle(fontSize: 16.0)),
            Text(widget.id.toString(), style: TextStyle(fontSize: 16.0)),
            if (widget.active) // Mostrar el botón solo si la tarea está activa
              IconButton(
                icon: Icon(Icons.done, color: Colors.green),
                onPressed: () async {
                  bool checkTask = await ApiService.checkTask(widget.id);
                  if (checkTask) {
                    CustomSnackBar.show(context, "Se cumplió la tarea", color.primary);
                    Navigator.pushNamed(context, AppRoutes.home);
                  }
                },
              ),
            
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () async {
                bool deleteSuccessful = await ApiService.deleteTask(widget.id);
                if (deleteSuccessful){
                  CustomSnackBar.show(context, "Se elimino correctamente", color.secondary);
                  Navigator.pushNamed(context, AppRoutes.home);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}