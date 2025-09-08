import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:software/reuseable_widget/dynamic_form.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late Box scheduleBox;
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    scheduleBox = Hive.box('scheduleBox');
  }

  void _addSchedule() {
    final fieldNames = ["Distributor Name", "Day"];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Schedule'),
          content: DynamicForm(
            fieldNames: fieldNames,
            onSubmit: (values) {
              final newSchedule = {
                'name': values["Distributor Name"] ?? "",
                'day': values["Day"] ?? "",
              };
              scheduleBox.add(newSchedule);
            },
          ),
        );
      },
    );
  }

  void _editSchedule(int key, Map schedule) {
    final fieldNames = ["Distributor Name", "Day"];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Schedule"),
          content: DynamicForm(
            fieldNames: fieldNames,
            initialValues: {
              "Distributor Name": schedule['name'] ?? "",
              "Day": schedule['day'] ?? "",
            },
            onSubmit: (values) {
              final updatedSchedule = {
                'name': values["Distributor Name"] ?? "",
                'day': values["Day"] ?? "",
              };
              scheduleBox.put(key, updatedSchedule);
            },
          ),
        );
      },
    );
  }

  void _deleteSchedule(int key) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Are you sure?"),
          content: const Text("This schedule will be deleted permanently."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                scheduleBox.delete(key);
                Navigator.pop(context);
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Schedule"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Search Distributor or Day",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addSchedule,
              child: const Text("+ Add Schedule"),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ValueListenableBuilder(
                    valueListenable: scheduleBox.listenable(),
                    builder: (context, Box box, _) {
                      if (box.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: Text("No schedules available")),
                        );
                      }

                      final filteredKeys = box.keys.where((key) {
                        final data = box.get(key);

                        if (data is! Map) return false;

                        final schedule = Map<String, dynamic>.from(data);

                        final name =
                            (schedule['name'] ?? "").toString().toLowerCase();
                        final day =
                            (schedule['day'] ?? "").toString().toLowerCase();

                        return name.contains(searchQuery) ||
                            day.contains(searchQuery);
                      }).toList();

                      if (filteredKeys.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: Text("No matching schedules")),
                        );
                      }

                      return DataTable(
                        columns: const [
                          DataColumn(label: Text("Distributor Name")),
                          DataColumn(label: Text("Day")),
                          DataColumn(label: Text("Actions")),
                        ],
                        rows: filteredKeys.map((key) {
                          final schedule =
                              Map<String, dynamic>.from(box.get(key));

                          return DataRow(
                            cells: [
                              DataCell(Text(schedule['name'] ?? "")),
                              DataCell(Text(schedule['day'] ?? "")),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit,
                                          color: Colors.blue),
                                      onPressed: () =>
                                          _editSchedule(key, schedule),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () => _deleteSchedule(key),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
