import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  // Cart structure: {name: String, qty: int, price: double}
  final List<Map<String, dynamic>> cart = [];

  // Input controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  final TextEditingController discountPercentController =
      TextEditingController();
  final TextEditingController discountAmountController =
      TextEditingController();
  final TextEditingController counterPersonController =
      TextEditingController(); // NEW

  // Header details
  final String ntnNo = '#1234677';
  final String licenseNo = 'LIC-987654';

  @override
  void dispose() {
    nameController.dispose();
    qtyController.dispose();
    priceController.dispose();
    customerController.dispose();
    discountPercentController.dispose();
    discountAmountController.dispose();
    counterPersonController.dispose();
    super.dispose();
  }

  void addMedicine() {
    final name = nameController.text.trim();
    final qty = int.tryParse(qtyController.text.trim());
    final price = double.tryParse(priceController.text.trim());

    if (name.isNotEmpty && qty != null && price != null) {
      setState(() {
        cart.add({'name': name, 'qty': qty, 'price': price});
      });

      nameController.clear();
      qtyController.clear();
      priceController.clear();
    }
  }

  String _formatDateTime(DateTime dt) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
  }

  @override
  Widget build(BuildContext context) {
    final double subtotal = cart.fold<double>(
      0,
      (sum, item) => sum + (item['qty'] as int) * (item['price'] as double),
    );

    final double discountAmountInput =
        double.tryParse(discountAmountController.text.trim()) ?? 0;
    final double discountPercentInput =
        double.tryParse(discountPercentController.text.trim()) ?? 0;

    // Apply discount: if manual amount > 0, use it; else use percent.
    double discount = 0;
    if (discountAmountInput > 0) {
      discount = discountAmountInput.clamp(0, subtotal);
    } else if (discountPercentInput > 0) {
      discount = subtotal * (discountPercentInput / 100).clamp(0, 1);
    }

    final double grandTotal = (subtotal - discount).clamp(0, double.infinity);

    return Scaffold(
      appBar: AppBar(title: const Text('Invoice')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ====== Top Header (Paper bill style) ======
            Row(
              children: [
                // English (left)
                const Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Al-Shifa Medical',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Urdu (right)
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: const Text(
                        'الشفاء میڈیکل',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // NTN, License, Customer, Time row(s)
            Wrap(
              spacing: 16,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text('NTN: $ntnNo'),
                Text('License No: $licenseNo'),
                SizedBox(
                  width: 240,
                  child: TextField(
                    controller: customerController,
                    decoration: const InputDecoration(
                      labelText: 'Customer Name',
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Text('Print Time: ${_formatDateTime(DateTime.now())}'),
              ],
            ),

            const Divider(height: 24, thickness: 1),

            // ====== Input fields to add medicines ======
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Medicine'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: qtyController,
                    decoration: const InputDecoration(labelText: 'Qty'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: priceController,
                    decoration: const InputDecoration(labelText: 'Rate'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.green),
                  onPressed: addMedicine,
                  tooltip: 'Add to cart',
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ====== Medicines table ======
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('S.No')),
                    DataColumn(label: Text('Medicine')),
                    DataColumn(label: Text('Qty')),
                    DataColumn(label: Text('Rate')),
                    DataColumn(label: Text('Total')),
                  ],
                  rows: [
                    for (int i = 0; i < cart.length; i++)
                      DataRow(
                        cells: [
                          DataCell(Text('${i + 1}')),
                          DataCell(Text(cart[i]['name'].toString())),
                          DataCell(Text(cart[i]['qty'].toString())),
                          DataCell(
                            Text(
                              (cart[i]['price'] as double).toStringAsFixed(2),
                            ),
                          ),
                          DataCell(
                            Text(
                              ((cart[i]['qty'] as int) *
                                      (cart[i]['price'] as double))
                                  .toStringAsFixed(2),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            // ====== Discount controls ======
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 140,
                  child: TextField(
                    controller: discountPercentController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Discount %',
                      isDense: true,
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 160,
                  child: TextField(
                    controller: discountAmountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Discount (Rs.)',
                      isDense: true,
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // ====== Totals ======
            Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
                  Text(
                    'Discount: Rs. ${discount.toStringAsFixed(2)}' +
                        (discountAmountInput > 0
                            ? ' (manual)'
                            : discountPercentInput > 0
                            ? ' (${discountPercentInput.toStringAsFixed(2)}%)'
                            : ''),
                  ),
                  Text(
                    'Total: Rs. ${grandTotal.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Counter person (on-screen) + Thank you (preview)
            Row(
              children: [
                SizedBox(
                  width: 260,
                  child: TextField(
                    controller: counterPersonController,
                    decoration: const InputDecoration(
                      labelText: 'Counter Person Name',
                      isDense: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const Spacer(),
                const Text(
                  'THANK YOU FOR SHOPPING',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Terms & Conditions (on-screen preview)
            const Text(
              'Terms & Conditions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '1. Without bill, no medicine and other items will return/change.',
                ),
                Text(
                  '2. Purchase medicine only: return/change within 15 days; after that not possible.',
                ),
                Text(
                  '3. Insulins, vaccines, fridge items, cosmetics, children grooming items, damaged medicine, seal-open syrup, test strips, sugar strips are not returnable.',
                ),
                Text(
                  '4. Check medicine and money at counter; after that no claim will be accepted.',
                ),
                Text(
                  '5. Use medicine with doctor’s advice; in case of misuse we are not responsible.',
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: cart.isEmpty ? null : _printOrSharePdf,
                  icon: const Icon(Icons.print),
                  label: const Text('Print / Download Invoice'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _printOrSharePdf() async {
    final bytes = await _buildPdf();
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => bytes);
  }

  Future<Uint8List> _buildPdf() async {
    final doc = pw.Document();

    // Attempt to load an Urdu-capable font from assets for correct shaping.
    // assets/fonts/NotoNastaliqUrdu-Regular.ttf
    pw.Font? urduFont;
    try {
      final data = await rootBundle.load(
        'assets/fonts/NotoNastaliqUrdu-Regular.ttf',
      );
      urduFont = pw.Font.ttf(data);
    } catch (_) {
      urduFont = null; // Fallback
    }

    final now = DateTime.now();

    final double subtotal = cart.fold<double>(
      0,
      (sum, item) => sum + (item['qty'] as int) * (item['price'] as double),
    );
    final double discountAmountInput =
        double.tryParse(discountAmountController.text.trim()) ?? 0;
    final double discountPercentInput =
        double.tryParse(discountPercentController.text.trim()) ?? 0;
    double discount = 0;
    if (discountAmountInput > 0) {
      discount = discountAmountInput.clamp(0, subtotal);
    } else if (discountPercentInput > 0) {
      discount = subtotal * (discountPercentInput / 100).clamp(0, 1);
    }
    final double grandTotal = (subtotal - discount).clamp(0, double.infinity);

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(24),
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
            children: [
              // Header bilingual (English left, Urdu right)
              pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.Align(
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Text(
                        'Al-Shifa Medical',
                        style: pw.TextStyle(
                          fontSize: 18,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Align(
                      alignment: pw.Alignment.centerRight,
                      child:
                          urduFont == null
                              ? pw.Text(
                                'الشفاء میڈیکل',
                                style: pw.TextStyle(
                                  fontSize: 18,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              )
                              : pw.Directionality(
                                textDirection: pw.TextDirection.rtl,
                                child: pw.Text(
                                  'الشفاء میڈیکل',
                                  style: pw.TextStyle(
                                    fontSize: 18,
                                    fontWeight: pw.FontWeight.bold,
                                    font: urduFont,
                                  ),
                                ),
                              ),
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 8),

              // Meta info
              pw.Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  pw.Text('NTN: $ntnNo'),
                  pw.Text('License No: $licenseNo'),
                  pw.Text(
                    'Customer: ${customerController.text.trim().isEmpty ? '-' : customerController.text.trim()}',
                  ),
                  pw.Text('Print Time: ${_formatDateTime(now)}'),
                ],
              ),

              pw.SizedBox(height: 12),
              pw.Divider(),

              // Items table
              pw.Table.fromTextArray(
                headers: const ['S.No', 'Medicine', 'Qty', 'Rate', 'Total'],
                data: [
                  for (int i = 0; i < cart.length; i++)
                    [
                      '${i + 1}',
                      cart[i]['name'].toString(),
                      cart[i]['qty'].toString(),
                      (cart[i]['price'] as double).toStringAsFixed(2),
                      ((cart[i]['qty'] as int) * (cart[i]['price'] as double))
                          .toStringAsFixed(2),
                    ],
                ],
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                cellAlignment: pw.Alignment.centerLeft,
                headerDecoration: const pw.BoxDecoration(
                  color: PdfColors.grey300,
                ),
                cellHeight: 22,
              ),

              pw.SizedBox(height: 8),

              // Totals
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
                      pw.Text(
                        'Discount: Rs. ${discount.toStringAsFixed(2)}' +
                            (discountAmountInput > 0
                                ? ' (manual)'
                                : discountPercentInput > 0
                                ? ' (${discountPercentInput.toStringAsFixed(2)}%)'
                                : ''),
                      ),
                      pw.Text(
                        'Total: Rs. ${grandTotal.toStringAsFixed(2)}',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),

              pw.SizedBox(height: 14),

              // Terms & Conditions (exact points, numbered with dots)
              pw.Text(
                'Terms & Conditions',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 6),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    '١۔ بغیر بل کے کوئی دوا اور دیگر اشیاء واپس یا تبدیل نہیں کی جائیں گی۔',
                  ),
                  pw.Text(
                    '٢۔ واپسی/تبدیلی صرف 15 دن کے اندر ممکن ہے، اس کے بعد ممکن نہیں ہوگی۔',
                  ),
                  pw.Text(
                    '٣۔ انسولین، ویکسین، فریج کی اشیاء، کاسمیٹکس ، شوگر اسٹرپس واپس یا تبدیل نہیں کی جائیں گی۔',
                  ),
                  pw.Text(
                    '٤۔ دوا اور پیسے کاونٹر پر چیک کریں، بعد میں کوئی دعویٰ قبول نہیں کیا جائے گا۔',
                  ),
                  pw.Text(
                    '٥۔ دوا ڈاکٹر کے مشورے سے استعمال کریں؛ دوا کے غلط استعمال یا سائیڈ ایفیکٹس کی صورت میں ہم ذمہ دار نہیں ہوں گے۔',
                  ),
                ],
              ),

              pw.SizedBox(height: 14),

              // Footer row: left counter person, right big thank you
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Expanded(
                    child: pw.Align(
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Text(
                        'Counter: ${counterPersonController.text.trim().isEmpty ? '-' : counterPersonController.text.trim()}',
                        style: const pw.TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Align(
                      alignment: pw.Alignment.centerRight,
                      child: pw.Text(
                        'THANK YOU FOR SHOPPING',
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //  pw.SizedBox(height: 10),

              // Urdu footer note (kept from your original)
              // urduFont == null
              //     ? pw.Text(
              //       'ایک بار فروخت شدہ ادویات واپس نہیں ہوتیں۔ براہِ کرم ڈاکٹر کے مشورے کے مطابق استعمال کریں.',
              //       style: const pw.TextStyle(fontSize: 10),
              //     )
              //     : pw.Directionality(
              //       textDirection: pw.TextDirection.rtl,
              //       child: pw.Text(
              //         'ایک بار فروخت شدہ ادویات واپس نہیں ہوتیں۔ براہِ کرم ڈاکٹر کے مشورے کے مطابق استعمال کریں۔',
              //         style: pw.TextStyle(font: urduFont, fontSize: 10),
              //       ),
              //     ),
            ],
          );
        },
      ),
    );

    return doc.save();
  }
}
