import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:pdf/widgets.dart' as pw;

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  final Map<String, List<Map<String, dynamic>>> bills = {};
  String activeBill = "Bill_1";

  final Box availableBox = Hive.box('availableBox');
  final Box viewsalesBox = Hive.box('viewsalesBox');

  final TextEditingController nameController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  final TextEditingController discountPercentController =
      TextEditingController();
  final TextEditingController discountAmountController =
      TextEditingController();
  final TextEditingController counterPersonController = TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode qtyFocus = FocusNode();
  final FocusNode priceFocus = FocusNode();
  final FocusNode customerFocus = FocusNode();
  final FocusNode discountPercentFocus = FocusNode();
  final FocusNode discountAmountFocus = FocusNode();
  final FocusNode counterPersonFocus = FocusNode();

  final String ntnNo = '#1234677';
  final String licenseNo = 'LIC-987654';

  List<Map> filteredMedicines = [];
  double currentPerTabletRate = 0.0;
  bool isManualRate = false;
  int selectedMedicineIndex = -1;

  final BlueThermalPrinter printer = BlueThermalPrinter.instance;

  @override
  void initState() {
    super.initState();
    bills[activeBill] = [];
  }

  @override
  void dispose() {
    nameController.dispose();
    qtyController.dispose();
    priceController.dispose();
    customerController.dispose();
    discountPercentController.dispose();
    discountAmountController.dispose();
    counterPersonController.dispose();
    nameFocus.dispose();
    qtyFocus.dispose();
    priceFocus.dispose();
    customerFocus.dispose();
    discountPercentFocus.dispose();
    discountAmountFocus.dispose();
    counterPersonFocus.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get cart => bills[activeBill] ?? [];

  void addMedicine() {
    final name = nameController.text.trim();
    final int qty = int.tryParse(qtyController.text.trim()) ?? 1;
    final double price = double.tryParse(priceController.text.trim()) ?? 0.0;

    if (name.isEmpty || price <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all required fields!')));
      return;
    }

    if (!isManualRate) {
      final stock = availableBox.values.cast<Map>().firstWhere(
            (m) =>
                m["Medicine Name"].toString().toLowerCase() ==
                name.toLowerCase(),
            orElse: () => {},
          );

      if (stock.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content:
                Text('Medicine not found in stock! Use manual rate instead.')));
        return;
      }
    }

    setState(() {
      cart.add({
        'name': name,
        'qty': qty,
        'price': price * qty,
        'unitPrice': price,
      });
      _clearInputs();
      nameFocus.requestFocus();
    });
  }

  void _clearInputs() {
    nameController.clear();
    qtyController.clear();
    priceController.clear();
    currentPerTabletRate = 0.0;
    filteredMedicines = [];
    selectedMedicineIndex = -1;
    isManualRate = false;
  }

  void _createNewBill() {
    final newKey = "Bill_${bills.length + 1}";
    setState(() {
      bills[newKey] = [];
      activeBill = newKey;
    });
  }

  void _switchBill(String key) {
    setState(() {
      activeBill = key;
    });
  }

  double get subtotal =>
      cart.fold<double>(0, (sum, item) => sum + (item['price'] as double));

  double get discount {
    final double discountAmountInput =
        double.tryParse(discountAmountController.text.trim()) ?? 0;
    final double discountPercentInput =
        double.tryParse(discountPercentController.text.trim()) ?? 0;

    if (discountAmountInput > 0) return discountAmountInput.clamp(0, subtotal);
    if (discountPercentInput > 0) {
      return subtotal * (discountPercentInput / 100).clamp(0, 1);
    }
    return 0;
  }

  double get grandTotal => (subtotal - discount).clamp(0, double.infinity);

  String _formatDateTime(DateTime dt) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
  }

  Widget _keyboardTextField({
    required TextEditingController controller,
    required FocusNode focusNode,
    FocusNode? nextFocus,
    FocusNode? prevFocus,
    FocusNode? rightFocus,
    FocusNode? leftFocus,
    String? label,
    TextInputType keyboardType = TextInputType.text,
    bool readOnly = false,
    void Function(String)? onChanged,
    void Function()? onEnter,
    bool isMedicineField = false,
  }) {
    return KeyboardListener(
      focusNode: FocusNode(),
      onKeyEvent: (event) {
        if (event is KeyDownEvent && focusNode.hasFocus) {
          if (isMedicineField && filteredMedicines.isNotEmpty) {
            if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
              setState(() {
                selectedMedicineIndex =
                    (selectedMedicineIndex + 1) % filteredMedicines.length;
              });
              return;
            } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
              setState(() {
                selectedMedicineIndex = selectedMedicineIndex <= 0
                    ? filteredMedicines.length - 1
                    : selectedMedicineIndex - 1;
              });
              return;
            } else if (event.logicalKey == LogicalKeyboardKey.enter) {
              if (selectedMedicineIndex >= 0 &&
                  selectedMedicineIndex < filteredMedicines.length) {
                _selectMedicine(filteredMedicines[selectedMedicineIndex]);
              }
              return;
            } else if (event.logicalKey == LogicalKeyboardKey.escape) {
              setState(() {
                filteredMedicines = [];
                selectedMedicineIndex = -1;
              });
              return;
            }
          }

          if (event.logicalKey == LogicalKeyboardKey.arrowRight &&
              rightFocus != null) {
            FocusScope.of(context).requestFocus(rightFocus);
            return;
          }
          if (event.logicalKey == LogicalKeyboardKey.arrowLeft &&
              leftFocus != null) {
            FocusScope.of(context).requestFocus(leftFocus);
            return;
          }

          if (event.logicalKey == LogicalKeyboardKey.enter && onEnter != null) {
            onEnter();
          }
        }
      },
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelText: label,
          isDense: true,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          suffixIcon: isMedicineField && filteredMedicines.isNotEmpty
              ? Icon(Icons.keyboard_arrow_down)
              : null,
          helperText: isMedicineField
              ? '↑↓: Navigate, Enter: Select (then enter Qty), Esc: Close'
              : '← → : Move between fields',
          helperMaxLines: 2,
        ),
        onChanged: onChanged,
        onSubmitted: (_) {
          if (onEnter != null) onEnter();
        },
      ),
    );
  }

  void _selectMedicine(Map stock) {
    setState(() {
      nameController.text = stock["Medicine Name"];
      final int packSize = int.tryParse(stock["Tablets"].toString()) ?? 1;
      final double packPrice =
          double.tryParse(stock["Pack Price"].toString()) ?? 0.0;
      currentPerTabletRate = packSize > 0 ? packPrice / packSize : 0;
      qtyController.text = '';
      priceController.text = '';
      filteredMedicines = [];
      selectedMedicineIndex = -1;
      isManualRate = false;
    });

    Future.delayed(Duration(milliseconds: 100), () {
      if (!mounted) return;
      FocusScope.of(context).requestFocus(qtyFocus);
    });
  }

  Widget _buildMedicineDropdown() {
    if (filteredMedicines.isEmpty) return const SizedBox.shrink();

    return Container(
      constraints: BoxConstraints(maxHeight: 200),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: filteredMedicines.length,
        itemBuilder: (context, index) {
          final stock = filteredMedicines[index];
          final bool isSelected = index == selectedMedicineIndex;

          return InkWell(
            onTap: () {
              _selectMedicine(stock);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              color: isSelected ? Colors.blue.shade100 : null,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(stock["Medicine Name"]),
                        Text(
                            "Pack: ${stock["Tablets"]}, Rs. ${stock["Pack Price"]}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice - $activeBill'),
        centerTitle: true,
        backgroundColor: const Color(0xFF008000),
        actions: [
          PopupMenuButton<String>(
            onSelected: _switchBill,
            itemBuilder: (context) => bills.keys
                .map((bill) => PopupMenuItem(
                      value: bill,
                      child: Text(bill == activeBill ? "$bill (Active)" : bill),
                    ))
                .toList(),
          ),
          IconButton(
              onPressed: _createNewBill,
              icon: const Icon(Icons.add),
              tooltip: "New Bill"),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text('Al-Shifa Medical',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: const Text('الشفاء میڈیکل',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('NTN: $ntnNo'),
                      Text('License No: $licenseNo'),
                      Text('Print Time: ${_formatDateTime(DateTime.now())}'),
                    ],
                  ),
                ),
                SizedBox(
                  width: 240,
                  child: _keyboardTextField(
                    controller: customerController,
                    focusNode: customerFocus,
                    nextFocus: nameFocus,
                    rightFocus: nameFocus,
                    leftFocus: counterPersonFocus,
                    label: 'Customer Name',
                  ),
                ),
              ],
            ),
            const Divider(height: 24, thickness: 1),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              _keyboardTextField(
                                controller: nameController,
                                focusNode: nameFocus,
                                nextFocus: qtyFocus,
                                prevFocus: customerFocus,
                                rightFocus: qtyFocus,
                                leftFocus: customerFocus,
                                label: 'Medicine Name',
                                isMedicineField: true,
                                onChanged: (value) {
                                  setState(() {
                                    isManualRate = false;
                                    selectedMedicineIndex = -1;
                                    filteredMedicines = value.isEmpty
                                        ? []
                                        : availableBox.values
                                            .where((stock) =>
                                                stock["Medicine Name"]
                                                    .toString()
                                                    .toLowerCase()
                                                    .contains(
                                                        value.toLowerCase()))
                                            .cast<Map>()
                                            .toList();
                                    if (filteredMedicines.isNotEmpty) {
                                      selectedMedicineIndex = 0;
                                    }
                                  });
                                },
                                onEnter: () {
                                  if (filteredMedicines.isNotEmpty &&
                                      selectedMedicineIndex >= 0) {
                                    _selectMedicine(filteredMedicines[
                                        selectedMedicineIndex]);
                                  } else {
                                    qtyFocus.requestFocus();
                                  }
                                },
                              ),
                              SizedBox(height: 4),
                              _buildMedicineDropdown(),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: _keyboardTextField(
                            controller: qtyController,
                            focusNode: qtyFocus,
                            nextFocus: priceFocus,
                            prevFocus: nameFocus,
                            rightFocus: priceFocus,
                            leftFocus: nameFocus,
                            label: 'Quantity',
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              if (!isManualRate && currentPerTabletRate > 0) {
                                final qty = int.tryParse(value) ?? 1;
                                setState(() {
                                  priceController.text =
                                      (currentPerTabletRate * qty)
                                          .toStringAsFixed(2);
                                });
                              }
                            },
                            onEnter: addMedicine,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: _keyboardTextField(
                            controller: priceController,
                            focusNode: priceFocus,
                            nextFocus: discountPercentFocus,
                            prevFocus: qtyFocus,
                            rightFocus: discountPercentFocus,
                            leftFocus: qtyFocus,
                            label: 'Unit Rate (Rs.)',
                            keyboardType: TextInputType.number,
                            readOnly: !isManualRate && currentPerTabletRate > 0,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  isManualRate = true;
                                });
                              }
                            },
                            onEnter: addMedicine,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.add, color: Colors.green),
                              onPressed: addMedicine,
                              tooltip: 'Add to cart',
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                setState(() {
                                  isManualRate = true;
                                  priceController.clear();
                                  priceFocus.requestFocus();
                                });
                              },
                              tooltip: 'Manual rate',
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isManualRate,
                          onChanged: (value) {
                            setState(() {
                              isManualRate = value ?? false;
                              if (!isManualRate) {
                                priceController.clear();
                              }
                            });
                          },
                        ),
                        Text('Manual Rate Entry'),
                        Spacer(),
                        if (currentPerTabletRate > 0 && !isManualRate)
                          Text(
                              'Auto Rate: Rs. ${currentPerTabletRate.toStringAsFixed(2)} per unit'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              constraints: BoxConstraints(maxHeight: 300),
              child: SingleChildScrollView(
                child: DataTable(
                  columnSpacing: 20,
                  columns: const [
                    DataColumn(label: Text('S.No')),
                    DataColumn(label: Text('Medicine')),
                    DataColumn(label: Text('Qty')),
                    DataColumn(label: Text('Unit Rate')),
                    DataColumn(label: Text('Total')),
                    DataColumn(label: Text('Action')),
                  ],
                  rows: [
                    for (int i = 0; i < cart.length; i++)
                      DataRow(cells: [
                        DataCell(Text('${i + 1}')),
                        DataCell(
                          SizedBox(
                            width: 120,
                            child: Text(
                              cart[i]['name'].toString(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        DataCell(Text(cart[i]['qty'].toString())),
                        DataCell(Text(
                            'Rs. ${(cart[i]['unitPrice'] as double).toStringAsFixed(2)}')),
                        DataCell(Text(
                            'Rs. ${(cart[i]['price'] as double).toStringAsFixed(2)}')),
                        DataCell(
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit,
                                    color: Colors.blue, size: 18),
                                onPressed: () {
                                  setState(() {
                                    nameController.text = cart[i]['name'];
                                    qtyController.text =
                                        cart[i]['qty'].toString();
                                    priceController.text =
                                        (cart[i]['unitPrice'] as double)
                                            .toStringAsFixed(2);
                                    isManualRate = true;
                                    cart.removeAt(i);
                                    nameFocus.requestFocus();
                                  });
                                },
                                tooltip: 'Edit',
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.red, size: 18),
                                onPressed: () {
                                  setState(() {
                                    cart.removeAt(i);
                                  });
                                },
                                tooltip: 'Delete',
                              ),
                            ],
                          ),
                        ),
                      ])
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _keyboardTextField(
                            controller: discountPercentController,
                            focusNode: discountPercentFocus,
                            nextFocus: discountAmountFocus,
                            prevFocus: priceFocus,
                            rightFocus: discountAmountFocus,
                            leftFocus: priceFocus,
                            keyboardType: TextInputType.number,
                            label: 'Discount %',
                            onChanged: (_) => setState(() {}),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _keyboardTextField(
                            controller: discountAmountController,
                            focusNode: discountAmountFocus,
                            nextFocus: counterPersonFocus,
                            prevFocus: discountPercentFocus,
                            rightFocus: counterPersonFocus,
                            leftFocus: discountPercentFocus,
                            keyboardType: TextInputType.number,
                            label: 'Discount Amount (Rs.)',
                            onChanged: (_) => setState(() {}),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Items: ${cart.length}'),
                            Text(
                                'Total Qty: ${cart.fold<int>(0, (sum, item) => sum + (item['qty'] as int))}'),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                                'Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
                            Text(
                                'Discount: Rs. ${discount.toStringAsFixed(2)}'),
                            Text(
                              'Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _keyboardTextField(
                    controller: counterPersonController,
                    focusNode: counterPersonFocus,
                    nextFocus: customerFocus,
                    prevFocus: discountAmountFocus,
                    rightFocus: customerFocus,
                    leftFocus: discountAmountFocus,
                    label: 'Counter Person Name',
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  'THANK YOU FOR SHOPPING',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: cart.isEmpty ? null : _saveAndPrintInvoice,
                  icon: const Icon(Icons.print),
                  label: const Text('Save & Print Invoice'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      bills[activeBill] = [];
                      _clearInputs();
                      customerController.clear();
                      counterPersonController.clear();
                      discountPercentController.clear();
                      discountAmountController.clear();
                    });
                  },
                  icon: const Icon(Icons.clear),
                  label: const Text('Clear All'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveAndPrintInvoice() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('AL-SHIFA MEDICAL',
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.Text('Invoice - $activeBill',
                  style: pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 10),
              pw.Text('Customer: ${customerController.text}'),
              pw.Text('Counter: ${counterPersonController.text}'),
              pw.Text('Date: ${_formatDateTime(DateTime.now())}'),
              pw.SizedBox(height: 10),
              pw.TableHelper.fromTextArray(
                headers: ['S.No', 'Medicine', 'Qty', 'Unit Rate', 'Total'],
                data: List.generate(cart.length, (index) {
                  final item = cart[index];
                  return [
                    '${index + 1}',
                    item['name'],
                    item['qty'].toString(),
                    'Rs. ${(item['unitPrice'] as double).toStringAsFixed(2)}',
                    'Rs. ${(item['price'] as double).toStringAsFixed(2)}',
                  ];
                }),
              ),
              pw.SizedBox(height: 10),
              pw.Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
              pw.Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
              pw.Text('Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 20),
              pw.Center(
                  child: pw.Text('THANK YOU FOR SHOPPING',
                      style: pw.TextStyle(
                          fontSize: 16, fontWeight: pw.FontWeight.bold))),
            ],
          );
        },
      ),
    );

    final output = File("Invoice_$activeBill.pdf");
    await output.writeAsBytes(await pdf.save());
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("PDF saved: Invoice_$activeBill.pdf")),
    );

    bool isConnected = await printer.isConnected ?? false;
    if (!mounted) return;
    if (!isConnected) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please connect the printer first!")),
      );
      return;
    }

    printer.printNewLine();
    printer.printCustom("AL-SHIFA MEDICAL", 2, 1);
    printer.printCustom("Invoice - $activeBill", 1, 1);
    printer.printNewLine();
    printer.printCustom("Customer: ${customerController.text}", 1, 0);
    printer.printCustom("Counter: ${counterPersonController.text}", 1, 0);
    printer.printCustom("Date: ${_formatDateTime(DateTime.now())}", 1, 0);
    printer.printNewLine();

    for (var item in cart) {
      printer.printLeftRight("${item['name']} x${item['qty']}",
          "Rs.${(item['unitPrice'] as double).toStringAsFixed(2)}", 1);
      printer.printLeftRight(
          "", "Rs.${(item['price'] as double).toStringAsFixed(2)}", 1);
    }

    printer.printNewLine();
    printer.printLeftRight("Subtotal", "Rs.${subtotal.toStringAsFixed(2)}", 1);
    printer.printLeftRight("Discount", "Rs.${discount.toStringAsFixed(2)}", 1);
    printer.printLeftRight("Total", "Rs.${grandTotal.toStringAsFixed(2)}", 2);
    printer.printNewLine();
    printer.printCustom("THANK YOU FOR SHOPPING", 1, 1);
    printer.printNewLine();
    printer.paperCut();

    viewsalesBox.add({
      'billNo': activeBill,
      'customer': customerController.text,
      'counterPerson': counterPersonController.text,
      'date': DateTime.now().toString(),
      'items': cart,
      'subtotal': subtotal,
      'discount': discount,
      'grandTotal': grandTotal,
    });

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Invoice printed & saved to sales history!')));
  }
}
