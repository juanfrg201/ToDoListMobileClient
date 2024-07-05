import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_application/config/app_theme.dart';
import 'package:to_do_application/src/api/api_service.dart';
import 'package:to_do_application/src/components/app_bar/custom_app_bar.dart';
import 'package:to_do_application/src/components/app_bar/custom_drawer.dart';
import 'package:to_do_application/src/components/snack_bar/CustomSnackBar.dart';
import 'package:to_do_application/src/components/todo_list/home_view.dart';
import 'package:to_do_application/src/models/task.dart';
import 'package:to_do_application/src/routes.dart';


class ToDoForm extends StatefulWidget {
  @override
  _ToDoFormState createState() => _ToDoFormState();
}

class _ToDoFormState extends State<ToDoForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    final color = Theme.of(context).colorScheme;
    if (_formKey.currentState!.validate()) {
      // Aquí puedes manejar el envío del formulario
      final taskName = _nameController.text;
      final task = Task(name: taskName, active: true);
      final createdTask = await ApiService.createTask(task);
      if (createdTask != null) {
        CustomSnackBar.show(context, 'Task created: ${createdTask.name}', color.primary);
        Navigator.pushNamed(context, AppRoutes.home);
      } else {
        print('Failed to create task');
      }
      

      // Puedes agregar la lógica para guardar la tarea en tu base de datos o estado
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Task Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a task name';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Create Task'),
          ),
        ],
      ),
    );
  }
}