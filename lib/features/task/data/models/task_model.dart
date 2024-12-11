import '../../domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    required String name,
    bool isCompleted = false,
    DateTime? dueDate,
  }) : super(name: name, isCompleted: isCompleted, dueDate: dueDate);

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      name: json['name'],
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
