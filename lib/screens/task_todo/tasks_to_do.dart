import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TasksToDo extends StatefulWidget {
  const TasksToDo({super.key});

  @override
  State<TasksToDo> createState() => _TasksToDoState();
}

class _TasksToDoState extends State<TasksToDo> {
  final Box tasksToDoBox = Hive.box('tasksToDoBox');
  final TextEditingController _taskController = TextEditingController();
  List<String> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() {
    final storedTasks = tasksToDoBox.get('tasks', defaultValue: <String>[]);
    setState(() {
      tasks = List<String>.from(storedTasks);
    });
  }

  void _saveTasks() {
    tasksToDoBox.put('tasks', tasks);
  }

  void _addTask(String task) {
    setState(() {
      tasks.add(task);
      _saveTasks();
    });
    _taskController.clear();
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
      _saveTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks To-Do'),
        backgroundColor: const Color(0xFF008000),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    String task = _taskController.text.trim();
                    if (task.isNotEmpty) {
                      _addTask(task);
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: tasks.isEmpty
                  ? const Center(
                      child: Text(
                        'No tasks added yet!',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(tasks[index]),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Are you sure?"),
                                      content: const Text(
                                          "This task will be deleted permanently."),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text("Cancel"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            _deleteTask(index);
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Delete"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
