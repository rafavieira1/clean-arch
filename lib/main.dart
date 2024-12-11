import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/task/presentation/state/manage_tasks.dart';
import 'features/task/presentation/pages/task_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ManageTasks()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TaskPage(), // Aqui a TaskPage foi definida corretamente
    );
  }
}
