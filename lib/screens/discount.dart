import 'package:flutter/material.dart';
import 'package:software/screens/global_widgets/dynamic_form.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:software/screens/global_widgets/excel.dart';
import 'package:intl/intl.dart';

class Discount extends StatefulWidget {
  const Discount({super.key});

  @override
  State<Discount> createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  late Box discountsBox;
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    discountsBox = Hive.box('discountsBox');
  }

  void _showDiscountDialog({Map? discount, int? index}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(discount == null ? 'Add Discount' : 'Edit Discount'),
        content: SizedBox(
            width: 500,
            height: 200,
            child: DynamicForm(
              fieldNames: ['Customer Name', 'Amount'],
              initialValues: discount != null
                  ? {
                      'Customer Name': discount['Customer Name'].toString(),
                      'Amount': discount['Amount'].toString(),
                    }
                  : null,
              onSubmit: (values) {
                final String name = (values['Customer Name'] ?? '').trim();
                final double amount =
                    double.tryParse((values['Amount'] ?? '0').trim()) ?? 0.0;

                if (name.isEmpty) return;

                DateTime now = DateTime.now();
                final String currentDate = DateFormat('yyyy-MM-dd').format(now);
                final String currentTime = DateFormat('hh:mm:ss a').format(now);

                final discountMap = {
                  'Customer Name': name,
                  'Amount': amount,
                  'Date': currentDate,
                  'Time': currentTime,
                };

                setState(() {
                  if (discount == null) {
                    discountsBox.add(discountMap);
                  } else if (index != null) {
                    discountsBox.putAt(index, discountMap);
                  }
                });

                Navigator.pop(context);
              },
            )),
      ),
    );
  }

  void _deleteDiscount(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Delete"),
        content: const Text("Are you sure you want to delete this discount?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // cancel
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              setState(() {
                discountsBox.deleteAt(index);
              });
              Navigator.pop(context); // close confirmation dialog
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discounts'),
        //backgroundColor: const Color(0xFF008000),
        actions: [
          IconButton(
            tooltip: "Export to Excel",
            onPressed: () {
              ExcelHelper.exportToExcel(
                context: context,
                boxes: [discountsBox],
                sheetName: "Discounts",
                fileName: "Discounts",
                headers: [
                  'Customer Name',
                  'Amount',
                  'Date',
                  'Time',
                ],
              );
            },
            icon: const Icon(Icons.file_upload),
          ),
          IconButton(
            tooltip: "Import from Excel",
            onPressed: () {
              ExcelHelper.importFromExcel(
                context: context,
                boxes: [discountsBox],
                headers: [
                  'Customer Name',
                  'Amount',
                  'Date',
                  'Time',
                ],
              );
            },
            icon: const Icon(Icons.file_download),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search by Customer Name...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: discountsBox.listenable(),
              builder: (context, Box box, _) {
                if (box.isEmpty) {
                  return const Center(child: Text('No discounts added'));
                }

                final discounts = box.values
                    .where((discount) => discount['Customer Name']
                        .toString()
                        .toLowerCase()
                        .contains(searchQuery))
                    .toList();

                if (discounts.isEmpty) {
                  return const Center(child: Text('No matching records found'));
                }

                return ListView.builder(
                  itemCount: discounts.length,
                  itemBuilder: (context, index) {
                    final discount = discounts[index];
                    return Card(
                      //    color: const Color(0Xff008000),
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          discount['Customer Name'].toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          'Amount: Rs.${discount['Amount']}\n'
                          'Date: ${discount['Date']}\n'
                          'Time: ${discount['Time']}',
                          style: const TextStyle(color: Colors.white70),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.green),
                              onPressed: () {
                                final realIndex =
                                    box.values.toList().indexOf(discount);
                                _showDiscountDialog(
                                    discount: discount, index: realIndex);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                final realIndex =
                                    box.values.toList().indexOf(discount);
                                _deleteDiscount(realIndex);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDiscountDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
