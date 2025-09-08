import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../reuseable_widget/dynamic_form.dart';

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
          content: DynamicForm(
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
                "date": DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now()),
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
          ),
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
          content: DynamicForm(
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
                "billNo": bill["billNo"],
                "customer": values["Customer Name"],
                "date": bill["date"],
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
          ),
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

    filteredSales.sort((a, b) {
      final billA = a["bill"];
      final billB = b["bill"];

      final customerA = (billA["customer"] as String).toLowerCase();
      final medicineA = (billA["items"][0]["name"] as String).toLowerCase();

      final customerB = (billB["customer"] as String).toLowerCase();
      final medicineB = (billB["items"][0]["name"] as String).toLowerCase();

      final aMatch =
          customerA.contains(searchQuery) || medicineA.contains(searchQuery);
      final bMatch =
          customerB.contains(searchQuery) || medicineB.contains(searchQuery);

      if (aMatch && !bMatch) return -1;
      if (!aMatch && bMatch) return 1;
      return 0;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("View Sales"),
        backgroundColor: const Color(0xFF008000),
      ),
      body: Column(
        children: [
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
          Expanded(
            child: filteredSales.isEmpty
                ? const Center(child: Text("No sales yet"))
                : ListView.builder(
                    itemCount: filteredSales.length,
                    itemBuilder: (context, i) {
                      final bill = filteredSales[i]["bill"];
                      final index = filteredSales[i]["index"];

                      return Card(
                        color: Color(0xFF008000),
                        margin: const EdgeInsets.all(8),
                        child: ExpansionTile(
                          //backgroundColor: Color(0xFF008000),
                          title: Text(
                              "Bill: ${bill['billNo']} - Rs. ${bill['grandTotal']}"),
                          subtitle: Text(
                              "Customer: ${bill['customer']} | Date: ${bill['date']}"),
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
                              // textColor: Color(0xFF008000),
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
