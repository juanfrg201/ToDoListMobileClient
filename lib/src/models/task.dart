class Task {
  int? id;
  String name;
  bool active;

  Task({required this.name, required this.active, this.id});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'active': active,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] ?? 1,
      name: json['name'] ?? '',
      active: json['active'] ?? false,
    );
  }
}
