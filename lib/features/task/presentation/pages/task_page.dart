import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // Importação do pacote intl
import '../state/manage_tasks.dart';
import '../../domain/entities/task.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _taskController = TextEditingController();
  DateTime? _selectedDate;

  void _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _addTask() {
    final taskName = _taskController.text;
    if (taskName.isNotEmpty) {
      Provider.of<ManageTasks>(context, listen: false)
          .addTask(taskName, _selectedDate);
      _taskController.clear();
      setState(() {
        _selectedDate = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Tarefas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      labelText: 'Nova Tarefa',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.date_range),
                  onPressed: _pickDate,
                ),
                ElevatedButton(
                  onPressed: _addTask, // Chamando o método _addTask
                  child: const Text('Adicionar'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<ManageTasks>(
              builder: (context, tasks, child) {
                return ListView.builder(
                  itemCount: tasks.tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks.tasks[index];
                    return ListTile(
                      title: Text(task.name),
                      subtitle: task.dueDate != null
                          ? Row(
                              children: [
                                const Text('Data Limite: '),
                                Expanded(
                                  child: Text(
                                    DateFormat('dd/MM/yyyy').format(
                                        task.dueDate!), // Formato da data
                                    overflow: TextOverflow
                                        .ellipsis, // Adiciona "..." caso o texto ultrapasse
                                  ),
                                ),
                              ],
                            )
                          : null,
                      leading: Checkbox(
                        value: task.isCompleted,
                        onChanged: (value) {
                          tasks.toggleTaskCompletion(index);
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          tasks.removeTask(index);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
