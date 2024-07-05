import 'package:flutter/material.dart';
import 'package:to_do_application/src/api/api_service.dart';
import 'package:to_do_application/src/components/shared/to_do_list_card.dart';
import 'package:to_do_application/src/components/shared/search_field.dart';
import 'package:to_do_application/src/models/task.dart';

class HomeRealizedView extends StatefulWidget {
  const HomeRealizedView({super.key});

  @override
  State<HomeRealizedView> createState() => _HomeRealizedViewState();
}

class _HomeRealizedViewState extends State<HomeRealizedView> {
  late Future<List<Task>> futureTasks;
  List<Task> allTasks = [];
  List<Task> filteredTasks = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    futureTasks = ApiService.fetchRealizedTasks();
    futureTasks.then((tasks) {
      setState(() {
        allTasks = tasks;
        filteredTasks = tasks;
      });
    });
  }

  void _filterTasks(String query) {
    setState(() {
      searchQuery = query;
      filteredTasks = allTasks.where((task) => task.name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            SearchField(onChanged: _filterTasks),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Task>>(
                future: futureTasks,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No tasks available'));
                  } else {
                    return ListView.builder(
                      itemCount: filteredTasks.length,
                      itemBuilder: (context, index) {
                        final task = filteredTasks[index];
                        return ToDoListCard(
                          task_name: task.name,
                          id: task.id!,
                          active: task.active,
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
