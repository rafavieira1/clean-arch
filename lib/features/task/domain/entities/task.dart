class Task {
  final String name;
  final bool isCompleted;
  final DateTime? dueDate;

  Task({required this.name, this.isCompleted = false, this.dueDate});

  Task copyWith({String? name, bool? isCompleted, DateTime? dueDate}) {
    return Task(
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
      dueDate: dueDate ?? this.dueDate,
    );
  }
}
