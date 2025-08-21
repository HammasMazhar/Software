import 'package:flutter/material.dart';

class Alldistributor extends StatefulWidget {
  const Alldistributor({super.key});

  @override
  State<Alldistributor> createState() => _AlldistributorState();
}

class _AlldistributorState extends State<Alldistributor> {
  static const String routeName = '/alldistributor';
  List<Map<String, dynamic>> distributor = [
    // {
    //   "Name": "Distributor1",
    //   "ManagerName": "Manager1",
    //   "ManagerNumber": "1234567890",
    //   "BookingMan1": "BookingMan1",
    //   "BookingMan1Number": "0987654321",
    //   "BookingMan2": "BookingMan2",
    //   "BookingMan2Number": "1122334455",
    //   "SupplyManName": "SupplyMan1",
    //   "SupplyManNumber": "5566778899",
    // },
  ];
  void _adddDistributor() {
    showDialog(
      context: context,
      builder: (context) {
        final nameController = TextEditingController();
        final mangerNameController = TextEditingController();
        final managerNumberController = TextEditingController();
        final bookingMan1NumberController = TextEditingController();
        final bookingMan2NumberController = TextEditingController();
        final bookingManName1Controller = TextEditingController();
        final bookingManName2Controller = TextEditingController();
        final supplyManNameController = TextEditingController();
        final supplyManNumberController = TextEditingController();
        return AlertDialog(
          title: const Text('Add Distributor'),
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
                controller: mangerNameController,
                decoration: const InputDecoration(labelText: 'Manager Name'),
              ),
              TextField(
                controller: managerNumberController,
                decoration: const InputDecoration(labelText: 'Manager Number'),
              ),
              TextField(
                controller: bookingManName1Controller,
                decoration: const InputDecoration(labelText: "Booking Man1"),
              ),
              TextField(
                controller: bookingMan1NumberController,
                decoration: const InputDecoration(
                  labelText: "Booking 1 Number",
                ),
              ),
              TextField(
                controller: bookingManName2Controller,
                decoration: const InputDecoration(labelText: "Booking Man2"),
              ),
              TextField(
                controller: bookingMan2NumberController,
                decoration: const InputDecoration(
                  labelText: "Booking 2 Number",
                ),
              ),
              TextField(
                controller: supplyManNameController,
                decoration: const InputDecoration(labelText: "Supply Man Name"),
              ),
              TextField(
                controller: supplyManNumberController,
                decoration: const InputDecoration(
                  labelText: "Supply Man Number",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    distributor.add({
                      "Name": nameController.text,
                      "ManagerName": mangerNameController.text,
                      "ManagerNumber": managerNumberController.text,
                      "BookingMan1": bookingManName1Controller.text,
                      "BookingMan1Number": bookingMan1NumberController.text,
                      "BookingMan2": bookingManName2Controller.text,
                      "BookingMan2Number": bookingMan2NumberController.text,
                      "SupplyManName": supplyManNameController.text,
                      "SupplyManNumber": supplyManNumberController.text,
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

  void editDistributor(Map<String, dynamic> distributor) {
    final nameController = TextEditingController(text: distributor['Name']);
    final managerNameController = TextEditingController(
      text: distributor['ManagerName'],
    );
    final managerNumberController = TextEditingController(
      text: distributor['ManagerNumber'],
    );
    final bookingManName1Controller = TextEditingController(
      text: distributor['BookingMan1'],
    );
    final bookingMan1NumberController = TextEditingController(
      text: distributor['BookingMan1Number'],
    );
    final bookingManName2Controller = TextEditingController(
      text: distributor['BookingMan2'],
    );
    final bookingMan2NumberController = TextEditingController(
      text: distributor['BookingMan2Number'],
    );
    final supplyManNameController = TextEditingController(
      text: distributor['SupplyManName'],
    );
    final supplyManNumberController = TextEditingController(
      text: distributor['SupplyManNumber'],
    );
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Distributor "),
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
                controller: managerNameController,
                decoration: const InputDecoration(labelText: 'Manager Name'),
              ),
              TextField(
                controller: managerNumberController,
                decoration: const InputDecoration(labelText: 'Manager Number'),
              ),
              TextField(
                controller: bookingManName1Controller,
                decoration: const InputDecoration(labelText: "Booking Man1"),
              ),
              TextField(
                controller: bookingMan1NumberController,
                decoration: const InputDecoration(
                  labelText: "Booking 1 Number",
                ),
              ),
              TextField(
                controller: bookingManName2Controller,
                decoration: const InputDecoration(labelText: "Booking Man2"),
              ),
              TextField(
                controller: bookingMan2NumberController,
                decoration: const InputDecoration(
                  labelText: "Booking 2 Number",
                ),
              ),
              TextField(
                controller: supplyManNameController,
                decoration: const InputDecoration(labelText: "Supply Man Name"),
              ),
              TextField(
                controller: supplyManNumberController,
                decoration: const InputDecoration(
                  labelText: "Supply Man Number",
                ),
              ),
              SizedBox(height: 15),

              Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("Cancel")),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      distributor["Name"] =
                          nameController.text.isEmpty
                              ? null
                              : nameController.text;
                      distributor["ManagerName"] =
                          managerNameController.text.isEmpty
                              ? null
                              : managerNameController.text;
                      distributor["ManagerNumber"] =
                          managerNumberController.text.isEmpty
                              ? null
                              : managerNumberController.text;
                      distributor["BookingMan1"] =
                          bookingManName1Controller.text.isEmpty
                              ? null
                              : bookingManName1Controller.text;
                      distributor["BookingMan1Number"] =
                          bookingMan1NumberController.text.isEmpty
                              ? null
                              : bookingMan1NumberController.text;
                      distributor["BookingMan2"] =
                          bookingManName2Controller.text.isEmpty
                              ? null
                              : bookingManName2Controller.text;
                      distributor["BookingMan2Number"] =
                          bookingMan2NumberController.text.isEmpty
                              ? null
                              : bookingMan2NumberController.text;
                      distributor["SupplyManName"] =
                          supplyManNameController.text.isEmpty
                              ? null
                              : supplyManNameController.text;
                      distributor["SupplyManNumber"] =
                          supplyManNumberController.text.isEmpty
                              ? null
                              : supplyManNumberController.text;

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
        title: const Text(" Distributions"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _adddDistributor();
              },

              child: const Text("+ Add Distributor"),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text("Name")),
                    DataColumn(label: Text("Manager Name")),
                    DataColumn(label: Text("Manager Number")),
                    DataColumn(label: Text("Booking Man1")),
                    DataColumn(label: Text("Booking Man1 Number")),
                    DataColumn(label: Text("Booking Man2")),
                    DataColumn(label: Text("Booking Man2 Number")),
                    DataColumn(label: Text("Supply Man Name")),
                    DataColumn(label: Text("Supply Man Number")),
                    DataColumn(label: Text("Actions")),
                  ],
                  rows: [
                    ...distributor.map(
                      (distributor) => DataRow(
                        cells: [
                          DataCell(Text(distributor["Name"] ?? "")),
                          DataCell(Text(distributor["ManagerName"] ?? "")),
                          DataCell(Text(distributor["ManagerNumber"] ?? "")),
                          DataCell(Text(distributor["BookingMan1"] ?? "")),
                          DataCell(
                            Text(distributor["BookingMan1Number"] ?? ""),
                          ),
                          DataCell(Text(distributor["BookingMan2"] ?? "")),
                          DataCell(
                            Text(distributor["BookingMan2Number"] ?? ""),
                          ),
                          DataCell(Text(distributor["SupplyManName"] ?? "")),
                          DataCell(Text(distributor["SupplyManNumber"] ?? "")),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    editDistributor(distributor);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      distributor.remove(distributor);
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
