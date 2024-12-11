import '../../domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    required String name, // Altere para "name" em vez de "title"
    bool isCompleted = false,
    DateTime? dueDate,
  }) : super(name: name, isCompleted: isCompleted, dueDate: dueDate);

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      name: json['name'], // Certifique-se de usar "name"
      isCompleted: json['isCompleted'] ?? false,
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isCompleted': isCompleted,
      'dueDate': dueDate?.toIso8601String(),
    };
  }
}
