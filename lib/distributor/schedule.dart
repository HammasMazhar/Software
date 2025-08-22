import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _AddScheduleState();
}

class _AddScheduleState extends State<Schedule> {
  static const String routeName = '/schedule';
  List<Map<String, dynamic>> schedule = [];
  void _adddSchedule() {
    showDialog(
      context: context,
      builder: (context) {
        final nameController = TextEditingController();
        final dayController = TextEditingController();

        return AlertDialog(
          title: const Text('Add Schedule'),
          content: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Distributor Name',
                ),
              ),
              TextField(
                controller: dayController,
                decoration: const InputDecoration(labelText: 'Day'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    schedule.add({
                      "Name": nameController.text,
                      "Day": dayController.text,
                    });
                  });
                  Navigator.pop(context);
                },
                child: Text('Add '),
              ),
            ],
          ),
        );
      },
    );
  }

  void editSchedule(Map<String, dynamic> schedule) {
    final nameController = TextEditingController(text: schedule['Name']);
    final dayController = TextEditingController(text: schedule['Day']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Schedule "),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Schedule Name'),
              ),

              TextField(
                controller: dayController,
                decoration: InputDecoration(labelText: "Day"),
              ),
              SizedBox(height: 15),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      schedule["Name"] =
                          nameController.text.isEmpty
                              ? null
                              : nameController.text;

                      schedule["Day"] =
                          dayController.text.isEmpty
                              ? null
                              : dayController.text;

                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: Text("Update"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Booking Schedule"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _adddSchedule();
              },

              child: const Text("+ Add schedule"),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text("Name")),
                    DataColumn(label: Text("Day")),

                    DataColumn(label: Text("Actions")),
                  ],
                  rows: [
                    ...schedule.map(
                      (schedule) => DataRow(
                        cells: [
                          DataCell(Text(schedule["Name"] ?? "")),
                          DataCell(Text(schedule["Day"] ?? "")),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    editSchedule(schedule);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      this.schedule.remove(schedule);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
