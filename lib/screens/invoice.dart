import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final Map<String, Map<String, dynamic>> bills = {};
  String activeBill = "Bill_1";

  final Box availableBox = Hive.box('availableBox');
  final Box viewsalesBox = Hive.box('viewsalesBox');

  final TextEditingController totalController = TextEditingController();
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

  List<Map> filteredMedicines = [];
  double currentPerTabletRate = 0.0;
  bool isManualRate = false;
  int selectedMedicineIndex = -1;

  @override
  void initState() {
    super.initState();
    bills[activeBill] = {
      "customer": "",
      "counterPerson": "",
      "discountAmount": 0.0,
      "discountPercent": 0.0,
      "total": 0.0,
      "cart": <Map<String, dynamic>>[],
    };
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

  List<Map<String, dynamic>> get cart {
    final billData = bills[activeBill];
    if (billData == null) return <Map<String, dynamic>>[];

    final cartData = billData["cart"];
    if (cartData is List<Map<String, dynamic>>) {
      return cartData;
    }
    return <Map<String, dynamic>>[];
  }

  void addMedicine() {
    final name = nameController.text.trim();
    final int qty = int.tryParse(qtyController.text.trim()) ?? 1;
    final double unitPrice =
        double.tryParse(priceController.text.trim()) ?? 0.0;
    final double totalPrice = qty * unitPrice;

    if (name.isEmpty || unitPrice <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all required fields!')));
      return;
    }

    if (!isManualRate) {
      try {
        final stockList = availableBox.values.cast<Map>();
        final stock = stockList.firstWhere(
          (m) {
            final medicineName = m["Medicine Name"];
            return medicineName != null &&
                medicineName.toString().toLowerCase() == name.toLowerCase();
          },
          orElse: () => <String, dynamic>{},
        );

        if (stock.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  'Medicine not found in stock! Use manual rate instead.')));
          return;
        }
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error checking stock: $e')));
        return;
      }
    }

    setState(() {
      final currentCart = cart;
      currentCart.add({
        "name": name,
        "qty": qty,
        "unitPrice": unitPrice,
        "price": totalPrice,
      });

      final currentBill = bills[activeBill];
      if (currentBill != null) {
        currentBill["total"] = grandTotal;
      }

      totalController.text = grandTotal.toStringAsFixed(2);

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
    _saveBillData();
    setState(() {
      bills[newKey] = {
        "customer": "",
        "counterPerson": "",
        "discountAmount": 0.0,
        "discountPercent": 0.0,
        "total": 0.0,
        "cart": <Map<String, dynamic>>[],
      };

      activeBill = newKey;
      _loadBillData(newKey);
      customerController.clear();
      counterPersonController.clear();
      discountAmountController.clear();
      discountPercentController.clear();
      totalController.clear();
    });
  }

  void _saveBillData() {
    if (activeBill.isEmpty || !bills.containsKey(activeBill)) return;

    final bill = bills[activeBill];
    if (bill == null) return;

    bill["customer"] = customerController.text;
    bill["counterPerson"] = counterPersonController.text;
    bill["discountAmount"] =
        double.tryParse(discountAmountController.text.trim()) ?? 0.0;
    bill["discountPercent"] =
        double.tryParse(discountPercentController.text.trim()) ?? 0.0;
  }

  void _loadBillData(String billKey) {
    if (!bills.containsKey(billKey)) return;

    final bill = bills[billKey];
    if (bill == null) return;

    customerController.text = bill["customer"]?.toString() ?? "";
    counterPersonController.text = bill["counterPerson"]?.toString() ?? "";
    discountAmountController.text = (bill["discountAmount"] ?? 0.0).toString();
    discountPercentController.text =
        (bill["discountPercent"] ?? 0.0).toString();
    totalController.text = (bill["total"] ?? 0.0).toString();
  }

  void _switchBill(String key) {
    _saveBillData();

    setState(() {
      activeBill = key;

      final bill = bills[key];
      if (bill != null) {
        customerController.text = bill["customer"]?.toString() ?? "";
        counterPersonController.text = bill["counterPerson"]?.toString() ?? "";
        discountAmountController.text =
            (bill["discountAmount"] ?? 0.0).toString();
        discountPercentController.text =
            (bill["discountPercent"] ?? 0.0).toString();
        totalController.text = (bill["total"] ?? 0.0).toString();
      }
    });
  }

  double get subtotal => cart.fold<double>(0, (sum, item) {
        final price = item['price'];
        return sum + (price is num ? price.toDouble() : 0.0);
      });

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

  String formatDateTime(DateTime dt) {
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
          border: const OutlineInputBorder(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          suffixIcon: isMedicineField && filteredMedicines.isNotEmpty
              ? const Icon(Icons.keyboard_arrow_down)
              : null,
        ),
        onChanged: onChanged,
        onSubmitted: (_) {
          if (onEnter != null) onEnter();
        },
      ),
    );
  }

  void _selectMedicine(Map stock) {
    try {
      setState(() {
        final medicineName = stock["Medicine Name"]?.toString() ?? "";
        nameController.text = medicineName;

        final int packSize =
            int.tryParse(stock["Tablets"]?.toString() ?? "1") ?? 1;
        final double packPrice =
            double.tryParse(stock["Pack Price"]?.toString() ?? "0.0") ?? 0.0;
        currentPerTabletRate = packSize > 0 ? packPrice / packSize : 0;

        priceController.text = currentPerTabletRate.toStringAsFixed(2);

        qtyController.text = '';
        filteredMedicines = [];
        selectedMedicineIndex = -1;
        isManualRate = false;
      });

      Future.delayed(const Duration(milliseconds: 100), () {
        if (!mounted) return;
        FocusScope.of(context).requestFocus(qtyFocus);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error selecting medicine: $e')));
    }
  }

  Widget _buildMedicineDropdown() {
    if (filteredMedicines.isEmpty) return const SizedBox.shrink();

    return Container(
      constraints: const BoxConstraints(maxHeight: 200),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
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
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue.shade100 : null,
                borderRadius: index == 0
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))
                    : index == filteredMedicines.length - 1
                        ? const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8))
                        : null,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stock["Medicine Name"]?.toString() ?? "Unknown",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? Colors.blue.shade800
                                : Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Pack: ${stock["Tablets"]?.toString() ?? "N/A"}, Rs. ${stock["Pack Price"]?.toString() ?? "0"}",
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected
                                ? Colors.blue.shade600
                                : Colors.grey.shade600,
                          ),
                        ),
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
    super.build(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Invoice - $activeBill'),
          centerTitle: true,
          backgroundColor: const Color(0xFF2E7D32),
          foregroundColor: Colors.white,
          elevation: 2,
          actions: [
            PopupMenuButton<String>(
              onSelected: _switchBill,
              icon: const Icon(Icons.receipt_long),
              tooltip: 'Switch Bills',
              itemBuilder: (context) => bills.keys.map((bill) {
                return PopupMenuItem<String>(
                  value: bill,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          bill == activeBill ? "$bill (Active)" : bill,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: bill == activeBill
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: bill == activeBill
                                ? Colors.green.shade700
                                : null,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete,
                            color: Colors.red, size: 18),
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            bills.remove(bill);
                            if (activeBill == bill && bills.isNotEmpty) {
                              activeBill = bills.keys.first;
                            } else if (bills.isEmpty) {
                              _createNewBill();
                            }
                          });
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            IconButton(
              onPressed: _createNewBill,
              icon: const Icon(Icons.add_circle_outline),
              tooltip: "New Bill",
            ),
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.grey.shade50,
                  Colors.white,
                ],
              ),
            ),
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  Card(
                    //ENTER MEDICINE IN CONTAINER PORTION
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add Medicine',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade700,
                                ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
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

                                          if (value.isEmpty) {
                                            filteredMedicines = [];
                                          } else {
                                            try {
                                              filteredMedicines =
                                                  availableBox.values
                                                      .where((stock) {
                                                        final medicineName =
                                                            stock["Medicine Name"]
                                                                ?.toString();
                                                        return medicineName !=
                                                                null &&
                                                            medicineName
                                                                .toLowerCase()
                                                                .startsWith(value
                                                                    .toLowerCase());
                                                      })
                                                      .cast<Map>()
                                                      .toList();
                                              if (filteredMedicines
                                                  .isNotEmpty) {
                                                selectedMedicineIndex = 0;
                                              }
                                            } catch (e) {
                                              filteredMedicines = [];
                                            }
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
                                    const SizedBox(height: 4),
                                    _buildMedicineDropdown(),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
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
                                    final qty = int.tryParse(value) ?? 0;
                                    final double unitPrice = double.tryParse(
                                            priceController.text.trim()) ??
                                        currentPerTabletRate;

                                    setState(() {
                                      if (qty > 0 && unitPrice > 0) {
                                        final total = qty * unitPrice;
                                        totalController.text =
                                            total.toStringAsFixed(2);
                                      } else {
                                        totalController.clear();
                                      }
                                    });
                                  },
                                  onEnter: addMedicine,
                                ),
                              ),
                              const SizedBox(width: 12),
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
                                  readOnly:
                                      !isManualRate && currentPerTabletRate > 0,
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
                              const SizedBox(width: 12),
                              Expanded(
                                flex: 1,
                                child: TextField(
                                  controller: totalController,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    labelText: "Total",
                                    filled: true,
                                    fillColor: Color(0xFFF5F5F5),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: addMedicine,
                                    icon: const Icon(Icons.add, size: 18),
                                    label: const Text('Add'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  OutlinedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        isManualRate = true;
                                        priceController.clear();
                                        priceFocus.requestFocus();
                                      });
                                    },
                                    icon: const Icon(Icons.edit, size: 16),
                                    label: const Text('Manual'),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
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
                              const Text('Manual Rate Entry'),
                              const Spacer(),
                              if (currentPerTabletRate > 0 && !isManualRate)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade50,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        color: Colors.green.shade200),
                                  ),
                                  child: Text(
                                    'Auto Rate: Rs. ${currentPerTabletRate.toStringAsFixed(2)} per unit',
                                    style: TextStyle(
                                      color: Colors.green.shade700,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Cart Table
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            'Cart Items (${cart.length})',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade700,
                                ),
                          ),
                        ),
                        Center(
                          child: Container(
                            constraints: const BoxConstraints(maxHeight: 300),
                            child: SingleChildScrollView(
                              child: DataTable(
                                columnSpacing: 16,
                                headingRowColor: MaterialStateProperty.all(
                                    Colors.grey.shade100),
                                columns: const [
                                  DataColumn(
                                      label: Text('S.No',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('Medicine',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('Qty',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('Unit Rate',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('Total',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(
                                      label: Text('Action',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                ],
                                rows: [
                                  for (int i = 0; i < cart.length; i++)
                                    DataRow(
                                        color: MaterialStateProperty.all(
                                          i.isEven
                                              ? Colors.grey.shade50
                                              : Colors.white,
                                        ),
                                        cells: [
                                          DataCell(Text('${i + 1}')),
                                          DataCell(
                                            SizedBox(
                                              width: 120,
                                              child: Text(
                                                cart[i]['name']?.toString() ??
                                                    'Unknown',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          DataCell(Text(
                                              cart[i]['qty']?.toString() ??
                                                  '0')),
                                          DataCell(Text(
                                              'Rs. ${(cart[i]['unitPrice'] as num?)?.toStringAsFixed(2) ?? "0.00"}')),
                                          DataCell(Text(
                                              'Rs. ${(cart[i]['price'] as num?)?.toStringAsFixed(2) ?? "0.00"}')),
                                          DataCell(
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                  icon: const Icon(Icons.edit,
                                                      color: Colors.blue,
                                                      size: 18),
                                                  onPressed: () {
                                                    setState(() {
                                                      nameController
                                                          .text = cart[i]
                                                                  ['name']
                                                              ?.toString() ??
                                                          '';
                                                      qtyController
                                                          .text = cart[i]['qty']
                                                              ?.toString() ??
                                                          '0';
                                                      priceController
                                                          .text = (cart[i][
                                                                      'unitPrice']
                                                                  as num?)
                                                              ?.toStringAsFixed(
                                                                  2) ??
                                                          '0.00';
                                                      isManualRate = true;
                                                      cart.removeAt(i);
                                                      nameFocus.requestFocus();
                                                    });
                                                  },
                                                  tooltip: 'Edit',
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.delete,
                                                      color: Colors.red,
                                                      size: 18),
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
                        ),
                        const SizedBox(height: 16),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: 50, left: 50, top: 20, bottom: 20),
                            //   padding: EdgeInsets.all(40),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Items: ${cart.length}'),
                                        Text(
                                            'Total Qty: ${cart.fold<int>(0, (sum, item) => sum + (item['qty'] as int))}'),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        // Text(
                                        //     'Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
                                        Text(
                                            'Discount: Rs. ${discount.toStringAsFixed(2)}'),
                                        Text(
                                          ' Total: Rs. ${grandTotal.toStringAsFixed(2)}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
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
                        Padding(
                          padding: const EdgeInsets.only(right: 50, left: 50),
                          child: Row(
                            children: [
                              Expanded(
                                child: _keyboardTextField(
                                  controller: counterPersonController,
                                  focusNode: counterPersonFocus,
                                  nextFocus: customerFocus,
                                  prevFocus: discountAmountFocus,
                                  rightFocus: customerFocus,
                                  leftFocus: discountAmountFocus,
                                  label: 'Sold By',
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                  child: _keyboardTextField(
                                controller: customerController,
                                focusNode: customerFocus,
                                nextFocus: nameFocus,
                                rightFocus: nameFocus,
                                leftFocus: counterPersonFocus,
                                label: 'Customer Name',
                              )),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 16),
                            ElevatedButton.icon(
                              onPressed:
                                  cart.isEmpty ? null : _saveAndPrintInvoice,
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
                                  bills[activeBill] = {
                                    "customer": "",
                                    "counterPerson": "",
                                    "discountAmount": 0.0,
                                    "discountPercent": 0.0,
                                    "total": 0.0,
                                    "cart": <Map<String, dynamic>>[],
                                  };

                                  _clearInputs();
                                  customerController.clear();
                                  counterPersonController.clear();
                                  discountPercentController.clear();
                                  discountAmountController.clear();
                                  totalController.clear();
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
                ]))));
  }

  Future<void> _saveAndPrintInvoice() async {
    final pdf = pw.Document();
    final fontUrdu = pw.Font.ttf(await rootBundle.load('asset/1.ttf'));

    final now = DateTime.now();
    final formattedDateTime =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} "
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

    final saleData = {
      "billNo": viewsalesBox.length + 1,
      "customer":
          customerController.text.isEmpty ? "Random" : customerController.text,
      "soldBy": counterPersonController.text,
      "date": DateFormat("yyyy-MM-dd").format(now),
      "time": DateFormat("HH:mm").format(now),
      "dateTime": formattedDateTime,
      "items": cart,
      "subtotal": cart.fold(
          0.0,
          (sum, item) =>
              sum + (item['unitPrice'] as double) * (item['qty'] as int)),
      "discount": 0.0,
      "grandTotal":
          cart.fold(0.0, (sum, item) => sum + (item['price'] as double)),
    };

    await viewsalesBox.add(saleData);

    final Object? grandTotal = saleData["grandTotal"];

    pw.Widget boldUrduText(String text, {double fontSize = 12}) {
      return pw.Text(
        text,
        style: pw.TextStyle(
          font: fontUrdu,
          fontSize: fontSize,
          fontWeight: pw.FontWeight.bold,
        ),
        textDirection: pw.TextDirection.rtl,
      );
    }

    pw.Widget buildHeader() {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Text(
            'Al-Shifa Medical Store',
            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
          ),
          boldUrduText(' الشفاء میڈیکل سٹور', fontSize: 18),
          pw.SizedBox(height: 2),
          pw.Text(
            'Jhanda Peer Road, Waris-pura (Faisalabad)',
            style: pw.TextStyle(fontSize: 9),
          ),
          pw.Text(
            'LIC#: 06-331-0166-87626M',
            style: pw.TextStyle(fontSize: 9),
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                saleData["dateTime"].toString(),
                style: pw.TextStyle(fontSize: 9),
              ),
            ],
          ),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                'Customer: ${customerController.text}',
                style: pw.TextStyle(fontSize: 9),
              ),
            ],
          ),
          pw.Divider(),
        ],
      );
    }

    pw.Widget buildTableHeader() {
      return pw.Row(
        children: [
          pw.SizedBox(
              width: 20,
              child: pw.Text('#',
                  style: pw.TextStyle(
                      fontSize: 9, fontWeight: pw.FontWeight.bold))),
          pw.Expanded(
              flex: 5,
              child: pw.Text('Item Name',
                  style: pw.TextStyle(
                      fontSize: 9, fontWeight: pw.FontWeight.bold))),
          pw.Expanded(
              flex: 2,
              child: pw.Text('Qty',
                  style: pw.TextStyle(
                      fontSize: 9, fontWeight: pw.FontWeight.bold))),
          pw.Expanded(
              flex: 3,
              child: pw.Text('Price',
                  style: pw.TextStyle(
                      fontSize: 9, fontWeight: pw.FontWeight.bold))),
          pw.Expanded(
              flex: 3,
              child: pw.Text('Total',
                  style: pw.TextStyle(
                      fontSize: 9, fontWeight: pw.FontWeight.bold))),
        ],
      );
    }

    pw.Widget buildTableRows() {
      return pw.Column(
        children: cart.asMap().entries.map((entry) {
          final i = entry.key + 1;
          final item = entry.value;
          return pw.Padding(
            padding: const pw.EdgeInsets.symmetric(vertical: 1),
            child: pw.Row(
              children: [
                pw.SizedBox(
                    width: 20,
                    child: pw.Text('$i', style: pw.TextStyle(fontSize: 9))),
                pw.Expanded(
                    flex: 5,
                    child: pw.Text('${item['name'] ?? ''}',
                        style: pw.TextStyle(fontSize: 9))),
                pw.Expanded(
                    flex: 2,
                    child: pw.Text('${item['qty'] ?? 0}',
                        style: pw.TextStyle(fontSize: 9))),
                pw.Expanded(
                    flex: 3,
                    child: pw.Text(
                        ' ${(item['unitPrice'] as num?)?.toStringAsFixed(2) ?? "0.00"}',
                        style: pw.TextStyle(fontSize: 9))),
                pw.Expanded(
                    flex: 3,
                    child: pw.Text(
                        ' ${(item['price'] as num?)?.toStringAsFixed(2) ?? "0.00"}',
                        style: pw.TextStyle(fontSize: 9))),
              ],
            ),
          );
        }).toList(),
      );
    }

    pw.Widget buildTotals() {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.end,
        children: [
          pw.SizedBox(height: 4),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                'Total items: ${cart?.length ?? 0}',
                style: pw.TextStyle(fontSize: 9),
              ),
            ],
          ),
          pw.Text(
            'Net Total:${(grandTotal as num?)?.toStringAsFixed(2) ?? "0.00"}',
            style: pw.TextStyle(
              fontWeight: pw.FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ],
      );
    }

    pw.Widget buildFooter() {
      return pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(height: 5),
          pw.Text('Sold By: ${counterPersonController.text}',
              style: pw.TextStyle(fontSize: 9)),
          pw.Divider(),
          boldUrduText(
            ' بل کے ساتھ 15 دن کےاندرادویات کی واپسی ممکن ہےورنہ نہیں',
            fontSize: 7,
          ),
          boldUrduText(
            '.فریج آئٹمز، کاسمیٹکس کی واپسی اور تبدیلی ممکن نہیں',
            fontSize: 7,
          ),
          boldUrduText(
            'خریداری کے لئے شکریہ!',
            fontSize: 7,
          ),
        ],
      );
    }

    final customFormat = PdfPageFormat.roll80.copyWith(
      marginTop: 0,
      marginBottom: 5,
      marginLeft: 10,
      marginRight: 10,
    );

    pdf.addPage(
      pw.Page(
        pageFormat: customFormat,
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            buildHeader(),
            buildTableHeader(),
            pw.Divider(),
            buildTableRows(),
            pw.Divider(),
            buildTotals(),
            buildFooter(),
          ],
        ),
      ),
    );

    bool result =
        await Printing.layoutPdf(onLayout: (format) async => pdf.save());

    setState(() {
      if (result == true) {
        bills.remove(activeBill);
        _createNewBill();
        customerController.clear();
        counterPersonController.clear();
      }
      return;
    });
  }
}
