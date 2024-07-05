import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_do_application/src/models/task.dart'; // Import correcto para el modelo Task

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:3000/';

  static Future<Task?> createTask(Task task) async {
    final url = Uri.parse('$baseUrl/user_tasks');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(task.toJson()),
    );

    if (response.statusCode == 201) {
      return Task.fromJson(jsonDecode(response.body));
    } else {
      print('Failed to create task: ${response.statusCode}');
      return null;
    }
  }

  static Future<List<Task>> fetchTasks() async {
    final url = Uri.parse('${baseUrl}user_tasks');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Task.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tasks: ${response.statusCode}');
    }
  }

  static Future<bool> deleteTask(int taskId) async {
    final url = Uri.parse('$baseUrl/user_tasks/$taskId'); // Reemplaza $baseUrl según sea necesario
    final response = await http.delete(url);

    if (response.statusCode == 204) {
      return true;
    } else {
      throw Exception('Failed to delete task: ${response.statusCode}');
    }
  }

  static Future<bool> checkTask(int taskId) async {
    final url = Uri.parse('$baseUrl/user_tasks/$taskId/check'); // Reemplaza $baseUrl según sea necesario
    final response = await http.patch(url);

    if (response.statusCode == 204) {
      return true;
    } else {
      throw Exception('Failed to delete task: ${response.statusCode}');
    }
  }

  static Future<List<Task>> fetchRealizedTasks() async {
    final url = Uri.parse('${baseUrl}user_tasks/realized');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Task.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tasks: ${response.statusCode}');
    }
  }

  static Future<List<Task>> fetchFilterTasks(String name) async {
    final url = Uri.parse('${baseUrl}user_tasks/filter_task?name${name}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Task.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tasks: ${response.statusCode}');
    }
  }
}


