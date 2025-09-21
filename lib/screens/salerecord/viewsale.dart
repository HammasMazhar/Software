import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:software/screens/global_widgets/excel.dart';
import '../global_widgets/dynamic_form.dart';

class Viewsale extends StatefulWidget {
  const Viewsale({super.key});

  @override
  State<Viewsale> createState() => _ViewsaleState();
}

class _ViewsaleState extends State<Viewsale> {
  late Box viewsalesBox;
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    viewsalesBox = Hive.box('viewsalesBox');
  }

  void _addManualSale() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          title: const Text("Add Manual Sale"),
          content: SizedBox(
              width: 500,
              height: 320,
              child: DynamicForm(
                fieldNames: [
                  "Customer Name",
                  "Medicine Name",
                  "Subtotal",
                  "Discount"
                ],
                onSubmit: (values) {
                  final subtotal =
                      double.tryParse(values["Subtotal"] ?? "0") ?? 0.0;
                  final discount =
                      double.tryParse(values["Discount"] ?? "0") ?? 0.0;
                  final grandTotal = subtotal - discount;

                  final bill = {
                    "billNo": viewsalesBox.length + 1,
                    "customer": values["Customer Name"]!.isEmpty
                        ? "Random"
                        : values["Customer Name"],
                    "date": DateFormat("yyyy-MM-dd").format(DateTime.now()),
                    "time": DateFormat("HH:mm").format(DateTime.now()),

                    //  "date": DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now()),
                    "items": [
                      {
                        "name": values["Medicine Name"]!.isEmpty
                            ? "Manual Sale"
                            : values["Medicine Name"],
                        "qty": 1,
                        "price": grandTotal,
                      }
                    ],
                    "subtotal": subtotal,
                    "discount": discount,
                    "grandTotal": grandTotal,
                  };

                  viewsalesBox.add(bill);
                  setState(() {});
                },
              )),
        );
      },
    );
  }

  void _editSale(int index, Map bill) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Edit Sale"),
          content: SizedBox(
              width: 500,
              height: 320,
              child: DynamicForm(
                fieldNames: [
                  "Customer Name",
                  "Medicine Name",
                  "Subtotal",
                  "Discount"
                ],
                initialValues: {
                  "Customer Name": bill["customer"] ?? "",
                  "Medicine Name": bill["items"][0]["name"] ?? "",
                  "Subtotal": bill["subtotal"].toString(),
                  "Discount": bill["discount"].toString(),
                },
                onSubmit: (values) {
                  final subtotal =
                      double.tryParse(values["Subtotal"] ?? "0") ?? 0.0;
                  final discount =
                      double.tryParse(values["Discount"] ?? "0") ?? 0.0;
                  final grandTotal = subtotal - discount;

                  final updatedBill = {
                    // "billNo": bill["billNo"],
                    "customer": values["Customer Name"],
                    // "date": bill["date"], "time": bill["time"],
                    "date": DateFormat("yyyy-MM-dd").format(DateTime.now()),
                    "time": DateFormat("HH:mm").format(DateTime.now()),
                    "items": [
                      {
                        "name": values["Medicine Name"],
                        "qty": 1,
                        "price": grandTotal,
                      }
                    ],
                    "subtotal": subtotal,
                    "discount": discount,
                    "grandTotal": grandTotal,
                  };

                  viewsalesBox.putAt(index, updatedBill);
                  setState(() {});
                },
              )),
        );
      },
    );
  }

  void _deleteSale(int index) {
    viewsalesBox.deleteAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final sales = viewsalesBox.values.toList();

    final filteredSales = List.generate(sales.length, (i) {
      final bill = sales[i];
      if (bill is Map) {
        return {"index": i, "bill": bill};
      }
      return null;
    }).whereType<Map<String, dynamic>>().toList();

    final searchFiltered = filteredSales.where((entry) {
      final bill = entry["bill"];
      final customer = (bill["customer"]?.toString() ?? "").toLowerCase();
      final medicine =
          (bill["items"][0]["name"]?.toString() ?? "").toLowerCase();
      return customer.contains(searchQuery) || medicine.contains(searchQuery);
    }).toList();

    searchFiltered.sort((a, b) {
      final billNoA = a["bill"]["billNo"] ?? 0;
      final billNoB = b["bill"]["billNo"] ?? 0;
      return billNoB.compareTo(billNoA);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("View Sales"),
        // backgroundColor: const Color(0xFF008000),
        actions: [
          IconButton(
            tooltip: "Export to Excel",
            onPressed: () {
              ExcelHelper.exportToExcel(
                context: context,
                boxes: [viewsalesBox],
                sheetName: " View Sales ",
                fileName: " View Sales",
                headers: [
                  "customer",
                  "date",
                  "items",
                  "subtotal",
                  "discount",
                  "Total",
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
                boxes: [viewsalesBox],
                headers: [
                  "billNo",
                  "customer",
                  "date",
                  "time",
                  "items",
                  "subtotal",
                  "discount",
                  "grandTotal",
                  "soldBy",
                ],
              );
            },
            icon: const Icon(Icons.file_download),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Search by customer or medicine...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (val) {
                setState(() {
                  searchQuery = val.trim().toLowerCase();
                });
              },
            ),
          ),

          // Sales list
          Expanded(
            child: searchFiltered.isEmpty
                ? const Center(child: Text("No sales yet"))
                : ListView.builder(
                    itemCount: searchFiltered.length,
                    itemBuilder: (context, i) {
                      final bill = searchFiltered[i]["bill"];
                      final index = searchFiltered[i]["index"];

                      return Card(
                        // color: const Color(0xFF008000),
                        margin: const EdgeInsets.all(8),
                        child: ExpansionTile(
                          title: Text(
                              "Bill: ${bill['billNo']} - Rs. ${bill['grandTotal']}"),
                          subtitle: Text(
                              "Customer: ${bill['customer']} | Date: ${bill['date']} | Time: ${bill['time']}"),
                          children: [
                            ...List.generate(
                              (bill['items'] as List).length,
                              (j) {
                                final item = bill['items'][j];
                                return ListTile(
                                  title: Text(item['name']),
                                  subtitle: Text("Qty: ${item['qty']}"),
                                  trailing: Text("Rs. ${item['price']}"),
                                );
                              },
                            ),
                            ListTile(
                              title: Text("Subtotal: Rs.${bill['subtotal']}"),
                            ),
                            ListTile(
                              title: Text("Discount: Rs.${bill['discount']}"),
                            ),
                            ListTile(
                              title: Text("Total: Rs.${bill['grandTotal']}"),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.blue),
                                  onPressed: () => _editSale(index, bill),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () => _deleteSale(index),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addManualSale,
        child: const Icon(Icons.add),
      ),
    );
  }
}
