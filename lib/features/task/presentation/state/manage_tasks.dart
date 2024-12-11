import 'package:flutter/material.dart';
import '../../domain/entities/task.dart';

class ManageTasks extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String name, DateTime? dueDate) {
    _tasks.add(Task(name: name, dueDate: dueDate));
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    _tasks[index] = _tasks[index].copyWith(
      isCompleted: !_tasks[index].isCompleted,
    );
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
