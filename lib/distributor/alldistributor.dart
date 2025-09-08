import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/services.dart';

class Alldistributor extends StatefulWidget {
  const Alldistributor({super.key});

  @override
  State<Alldistributor> createState() => _AlldistributorState();
}

class _AlldistributorState extends State<Alldistributor> {
  final nameFocus = FocusNode();
  final managerNameFocus = FocusNode();
  final managerNumberFocus = FocusNode();
  final bookingMan1Focus = FocusNode();
  final bookingMan1NumberFocus = FocusNode();
  final bookingMan2Focus = FocusNode();
  final bookingMan2NumberFocus = FocusNode();
  final supplyManNameFocus = FocusNode();
  final supplyManNumberFocus = FocusNode();

  final distributorBox = Hive.box('distributorBox');
  String searchQuery = "";

  void _addDistributor() {
    final nameController = TextEditingController();
    final managerNameController = TextEditingController();
    final managerNumberController = TextEditingController();
    final bookingMan1Controller = TextEditingController();
    final bookingMan1NumberController = TextEditingController();
    final bookingMan2Controller = TextEditingController();
    final bookingMan2NumberController = TextEditingController();
    final supplyManNameController = TextEditingController();
    final supplyManNumberController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          title: const Text('Add Distributor'),
          content: RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: (RawKeyEvent event) {
              if (event is RawKeyDownEvent) {
                if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                  FocusScope.of(context).nextFocus();
                } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                  FocusScope.of(context).previousFocus();
                }
              }
            },
            child: FocusTraversalGroup(
              policy: OrderedTraversalPolicy(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      focusNode: nameFocus,
                      controller: nameController,
                      decoration:
                          const InputDecoration(labelText: 'Distributor Name'),
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(managerNameFocus),
                    ),
                    TextField(
                      focusNode: managerNameFocus,
                      controller: managerNameController,
                      decoration:
                          const InputDecoration(labelText: 'Manager Name'),
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(managerNumberFocus),
                    ),
                    TextField(
                      focusNode: managerNumberFocus,
                      controller: managerNumberController,
                      decoration:
                          const InputDecoration(labelText: 'Manager Number'),
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(bookingMan1Focus),
                    ),
                    TextField(
                      focusNode: bookingMan1Focus,
                      controller: bookingMan1Controller,
                      decoration:
                          const InputDecoration(labelText: 'Booking Man1'),
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(bookingMan1NumberFocus),
                    ),
                    TextField(
                      focusNode: bookingMan1NumberFocus,
                      controller: bookingMan1NumberController,
                      decoration:
                          const InputDecoration(labelText: 'Booking 1 Number'),
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(bookingMan2Focus),
                    ),
                    TextField(
                      focusNode: bookingMan2Focus,
                      controller: bookingMan2Controller,
                      decoration:
                          const InputDecoration(labelText: 'Booking Man2'),
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(bookingMan2NumberFocus),
                    ),
                    TextField(
                      focusNode: bookingMan2NumberFocus,
                      controller: bookingMan2NumberController,
                      decoration:
                          const InputDecoration(labelText: 'Booking 2 Number'),
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(supplyManNameFocus),
                    ),
                    TextField(
                      focusNode: supplyManNameFocus,
                      controller: supplyManNameController,
                      decoration:
                          const InputDecoration(labelText: 'Supply Man Name'),
                      textInputAction: TextInputAction.next,
                      onSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(supplyManNumberFocus),
                    ),
                    TextField(
                      focusNode: supplyManNumberFocus,
                      controller: supplyManNumberController,
                      decoration:
                          const InputDecoration(labelText: 'Supply Man Number'),
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) {
                        _saveDistributor(
                          nameController,
                          managerNameController,
                          managerNumberController,
                          bookingMan1Controller,
                          bookingMan1NumberController,
                          bookingMan2Controller,
                          bookingMan2NumberController,
                          supplyManNameController,
                          supplyManNumberController,
                        );
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        _saveDistributor(
                          nameController,
                          managerNameController,
                          managerNumberController,
                          bookingMan1Controller,
                          bookingMan1NumberController,
                          bookingMan2Controller,
                          bookingMan2NumberController,
                          supplyManNameController,
                          supplyManNumberController,
                        );
                        Navigator.pop(context);
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _saveDistributor(
    TextEditingController nameController,
    TextEditingController managerNameController,
    TextEditingController managerNumberController,
    TextEditingController bookingMan1Controller,
    TextEditingController bookingMan1NumberController,
    TextEditingController bookingMan2Controller,
    TextEditingController bookingMan2NumberController,
    TextEditingController supplyManNameController,
    TextEditingController supplyManNumberController,
  ) {
    distributorBox.add({
      "Name": nameController.text,
      "ManagerName": managerNameController.text,
      "ManagerNumber": managerNumberController.text,
      "BookingMan1": bookingMan1Controller.text,
      "BookingMan1Number": bookingMan1NumberController.text,
      "BookingMan2": bookingMan2Controller.text,
      "BookingMan2Number": bookingMan2NumberController.text,
      "SupplyManName": supplyManNameController.text,
      "SupplyManNumber": supplyManNumberController.text,
    });
  }

  void _editDistributor(dynamic key, Map distributor) {
    final nameController = TextEditingController(text: distributor['Name']);
    final managerNameController =
        TextEditingController(text: distributor['ManagerName']);
    final managerNumberController =
        TextEditingController(text: distributor['ManagerNumber']);
    final bookingMan1Controller =
        TextEditingController(text: distributor['BookingMan1']);
    final bookingMan1NumberController =
        TextEditingController(text: distributor['BookingMan1Number']);
    final bookingMan2Controller =
        TextEditingController(text: distributor['BookingMan2']);
    final bookingMan2NumberController =
        TextEditingController(text: distributor['BookingMan2Number']);
    final supplyManNameController =
        TextEditingController(text: distributor['SupplyManName']);
    final supplyManNumberController =
        TextEditingController(text: distributor['SupplyManNumber']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          title: const Text("Edit Distributor"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                    controller: nameController,
                    decoration:
                        const InputDecoration(labelText: 'Distributor Name')),
                TextField(
                    controller: managerNameController,
                    decoration:
                        const InputDecoration(labelText: 'Manager Name')),
                TextField(
                    controller: managerNumberController,
                    decoration:
                        const InputDecoration(labelText: 'Manager Number')),
                TextField(
                    controller: bookingMan1Controller,
                    decoration:
                        const InputDecoration(labelText: 'Booking Man1')),
                TextField(
                    controller: bookingMan1NumberController,
                    decoration:
                        const InputDecoration(labelText: 'Booking 1 Number')),
                TextField(
                    controller: bookingMan2Controller,
                    decoration:
                        const InputDecoration(labelText: 'Booking Man2')),
                TextField(
                    controller: bookingMan2NumberController,
                    decoration:
                        const InputDecoration(labelText: 'Booking 2 Number')),
                TextField(
                    controller: supplyManNameController,
                    decoration:
                        const InputDecoration(labelText: 'Supply Man Name')),
                TextField(
                    controller: supplyManNumberController,
                    decoration:
                        const InputDecoration(labelText: 'Supply Man Number')),
                const SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel")),
                    const SizedBox(width: 10),
                    ElevatedButton(
                        onPressed: () {
                          distributorBox.put(key, {
                            "Name": nameController.text,
                            "ManagerName": managerNameController.text,
                            "ManagerNumber": managerNumberController.text,
                            "BookingMan1": bookingMan1Controller.text,
                            "BookingMan1Number":
                                bookingMan1NumberController.text,
                            "BookingMan2": bookingMan2Controller.text,
                            "BookingMan2Number":
                                bookingMan2NumberController.text,
                            "SupplyManName": supplyManNameController.text,
                            "SupplyManNumber": supplyManNumberController.text,
                          });
                          Navigator.pop(context);
                        },
                        child: const Text("Update")),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _deleteDistributor(dynamic key) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Are you sure?"),
          content: const Text("This distributor will be deleted permanently."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                distributorBox.delete(key);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Distributor deleted')),
                );
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
          title: const Text("Distributors"),
          centerTitle: true,
          backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: _addDistributor,
                child: const Text("+ Add Distributor")),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                  labelText: "Search by name", prefixIcon: Icon(Icons.search)),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ValueListenableBuilder(
                    valueListenable: distributorBox.listenable(),
                    builder: (context, Box box, _) {
                      if (box.isEmpty) {
                        return const Center(
                            child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text("No Distributors Added")));
                      }

                      final distributors = box.keys
                          .map((key) => {"key": key, "data": box.get(key)})
                          .where((entry) {
                        final data = entry["data"] as Map;
                        final name =
                            (data["Name"] ?? "").toString().toLowerCase();
                        return name.contains(searchQuery);
                      }).toList();

                      distributors.sort((a, b) {
                        final aName =
                            (a["data"]["Name"] ?? "").toString().toLowerCase();
                        final bName =
                            (b["data"]["Name"] ?? "").toString().toLowerCase();
                        return aName.compareTo(bName);
                      });

                      return DataTable(
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
                        rows: distributors.map((entry) {
                          final distributor = entry["data"] as Map;
                          final key = entry["key"];
                          return DataRow(cells: [
                            DataCell(Text(distributor["Name"] ?? "")),
                            DataCell(Text(distributor["ManagerName"] ?? "")),
                            DataCell(Text(distributor["ManagerNumber"] ?? "")),
                            DataCell(Text(distributor["BookingMan1"] ?? "")),
                            DataCell(
                                Text(distributor["BookingMan1Number"] ?? "")),
                            DataCell(Text(distributor["BookingMan2"] ?? "")),
                            DataCell(
                                Text(distributor["BookingMan2Number"] ?? "")),
                            DataCell(Text(distributor["SupplyManName"] ?? "")),
                            DataCell(
                                Text(distributor["SupplyManNumber"] ?? "")),
                            DataCell(Row(children: [
                              IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.blue),
                                  onPressed: () =>
                                      _editDistributor(key, distributor)),
                              IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () => _deleteDistributor(key)),
                            ])),
                          ]);
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
