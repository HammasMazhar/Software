import 'package:flutter/material.dart';
import 'package:software/reuseable_widget/dynamic_form.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Discount extends StatefulWidget {
  const Discount({super.key});

  @override
  State<Discount> createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  late Box discountsBox;

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
        content: DynamicForm(
          fieldNames: ['Customer Name', 'Amount'],
          initialValues: discount != null
              ? {
                  'Customer Name': discount['name'],
                  'Amount': discount['amount'].toString(),
                }
              : null,
          onSubmit: (values) {
            final String name = (values['Customer Name'] ?? '').trim();
            final double amount =
                double.tryParse((values['Amount'] ?? '0').trim()) ?? 0.0;

            if (name.isEmpty) return;

            final discountMap = {'name': name, 'amount': amount};

            setState(() {
              if (discount == null) {
                discountsBox.add(discountMap);
              } else if (index != null) {
                discountsBox.putAt(index, discountMap);
              }
            });
          },
        ),
      ),
    );
  }

  void _deleteDiscount(int index) {
    setState(() {
      discountsBox.deleteAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discounts'),
        backgroundColor: Color(0xFF008000),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: discountsBox.listenable(),
        builder: (context, Box box, _) {
          if (box.isEmpty) {
            return const Center(child: Text('No discounts added'));
          }
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final discount = box.getAt(index);
              return Card(
                color: Color(0Xff008000),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(discount['name']),
                  subtitle: Text('Amount: Rs.${discount['amount']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.orange),
                        onPressed: () => _showDiscountDialog(
                            discount: discount, index: index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteDiscount(index),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDiscountDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
