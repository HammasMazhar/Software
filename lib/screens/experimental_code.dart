// import 'package:flutter/material.dart';
// import 'screens/sale_record.dart';
// import 'screens/purchase_record.dart';
// import 'screens/stocks.dart';
// import 'screens/distributor.dart';
// import 'invoice.dart';
// import 'package:software/dashboard.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   static const String routeName = '/dashboard';
//   TextEditingController searchController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFfce7e7),
//       body: Column(
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 350, top: 60),
//                 child: CircleAvatar(
//                   backgroundImage: AssetImage('assets/images/logo.png'),
//                   radius: 60,
//                 ),
//               ),
//               SizedBox(width: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 80),
//                     child: Text(
//                       'Hi Hammas,',
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10),
//                     child: Text(
//                       'Welcome Back!',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(width: 400),
//               Padding(
//                 padding: const EdgeInsets.only(top: 80, left: 50),
//                 child: SizedBox(
//                   width: 300,
//                   height: 50,
//                   child: TextFormField(
//                     controller: searchController,
//                     onChanged: (value) {},
//                     style: TextStyle(fontSize: 18, color: Colors.black),
//                     decoration: InputDecoration(
//                       hintText: 'Search Medicine',
//                       hintStyle: TextStyle(
//                         fontSize: 18,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       prefixIcon: Icon(Icons.search, color: Colors.red),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none,
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 60),
//           // First box with title
//           Container(
//             width: 440,
//             height: 240,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               gradient: LinearGradient(
//                 stops: [0.3, 0.3],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//                 colors: [Color(0xFFe64340), Color(0xFFFFFFFF)],
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Today Sale',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 60),
//           // Second box (unchanged design, just structured)
//           Container(
//             width: 440,
//             height: 240,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               gradient: LinearGradient(
//                 stops: [0.3, 0.3],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//                 colors: [Color(0xFFe64340), Color(0xFFFFFFFF)],
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Today Purchase',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'screens/sale_record.dart';
// import 'screens/purchase_record.dart';
// import 'screens/stocks.dart';
// import 'screens/distributor.dart';
// import 'invoice.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});
//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   TextEditingController searchController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFfce7e7),
//       appBar: AppBar(
//         title: const Text("Pharmacy Dashboard"),
//         backgroundColor: Colors.red,
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(color: Colors.red),
//               child: Text(
//                 "Menu",
//                 style: TextStyle(color: Colors.white, fontSize: 24),
//               ),
//             ),
//             ExpansionTile(
//               title: const Text("Sale Record"),
//               children: [
//                 ListTile(
//                   title: const Text("View Sales"),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const SaleRecord(),
//                       ),
//                     );
//                   },
//                 ),
//                 ListTile(
//                   title: const Text("Add Sale"),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const SaleRecord(),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//             ExpansionTile(
//               title: const Text("Purchase Record"),
//               children: [
//                 ListTile(
//                   title: const Text("View Purchases"),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const PurchaseRecord(),
//                       ),
//                     );
//                   },
//                 ),
//                 ListTile(
//                   title: const Text("Add Purchase"),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const PurchaseRecord(),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//             ExpansionTile(
//               title: const Text("Stocks"),
//               children: [
//                 ListTile(
//                   title: const Text("Available Stock"),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const Stocks()),
//                     );
//                   },
//                 ),
//                 ListTile(
//                   title: const Text("Expired Stock"),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const Stocks()),
//                     );
//                   },
//                 ),
//               ],
//             ),
//             ExpansionTile(
//               title: const Text("Distributor"),
//               children: [
//                 ListTile(
//                   title: const Text("All Distributors"),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const Distributor(),
//                       ),
//                     );
//                   },
//                 ),
//                 ListTile(
//                   title: const Text("Add Distributor"),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const Distributor(),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//             ListTile(
//               title: const Text("Invoice"),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Invoice()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 350, top: 60),
//                 child: CircleAvatar(
//                   backgroundImage: AssetImage('assets/images/logo.png'),
//                   radius: 60,
//                 ),
//               ),
//               SizedBox(width: 10),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 80),
//                     child: Text(
//                       'Hi Hammas,',
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10),
//                     child: Text(
//                       'Welcome Back!',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(width: 400),
//               Padding(
//                 padding: const EdgeInsets.only(top: 80, left: 50),
//                 child: SizedBox(
//                   width: 300,
//                   height: 50,
//                   child: TextFormField(
//                     controller: searchController,
//                     onChanged: (value) {},
//                     style: TextStyle(fontSize: 18, color: Colors.black),
//                     decoration: InputDecoration(
//                       hintText: 'Search Medicine',
//                       hintStyle: TextStyle(
//                         fontSize: 18,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       prefixIcon: Icon(Icons.search, color: Colors.red),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none,
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 125.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 SizedBox(width: 320),
//                 Container(
//                   width: 440,
//                   height: 340,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     gradient: LinearGradient(
//                       stops: [0.3, 0.3],
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                       colors: [Color(0xFFe64340), Color(0xFFFFFFFF)],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: 440,
//                   height: 340,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     gradient: LinearGradient(
//                       stops: [0.3, 0.3],
//                       begin: Alignment.centerLeft,
//                       end: Alignment.centerRight,
//                       colors: [Color(0xFFe64340), Color(0xFFFFFFFF)],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:software/dashboard.dart';
// import 'package:software/invoice.dart';
// import 'package:software/screens/distributor.dart';
// import 'package:software/screens/purchase_record.dart';
// import 'package:software/screens/sale_record.dart';
// import 'package:software/screens/stocks.dart';

// void main() {
//   runApp(const PharmacySoftware());
// }

// class PharmacySoftware extends StatelessWidget {
//   const PharmacySoftware({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/dashboard',
//       routes: {
//         '/dashboard': (context) => const Dashboard(),
//         '/stocks': (context) => const Stocks(),
//         '/distributor': (context) => const Distributor(),
//         '/invoice': (context) => const Invoice(),
//         '/sale_record': (context) => const SaleRecord(),
//         '/purchase_record': (context) => const PurchaseRecord(),
//       },
//     );
//   }
// }
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class InvoiceScreen extends StatefulWidget {
//   const InvoiceScreen({super.key});

//   @override
//   State<InvoiceScreen> createState() => _InvoiceScreenState();
// }

// class _InvoiceScreenState extends State<InvoiceScreen> {
//   final List<Map<String, dynamic>> cart = [];

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController qtyController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController customerController = TextEditingController();
//   final TextEditingController discountPercentController =
//       TextEditingController();
//   final TextEditingController discountAmountController =
//       TextEditingController();
//   final TextEditingController counterPersonController = TextEditingController();

//   final String ntnNo = '#1234677';
//   final String licenseNo = 'LIC-987654';

//   @override
//   void dispose() {
//     nameController.dispose();
//     qtyController.dispose();
//     priceController.dispose();
//     customerController.dispose();
//     discountPercentController.dispose();
//     discountAmountController.dispose();
//     counterPersonController.dispose();
//     super.dispose();
//   }

//   void addMedicine() {
//     final name = nameController.text.trim();
//     final qty = int.tryParse(qtyController.text.trim());
//     final price = double.tryParse(priceController.text.trim());

//     if (name.isNotEmpty && qty != null && price != null) {
//       setState(() {
//         cart.add({'name': name, 'qty': qty, 'price': price});
//       });

//       nameController.clear();
//       qtyController.clear();
//       priceController.clear();
//     }
//   }

//   String _formatDateTime(DateTime dt) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double subtotal = cart.fold<double>(
//       0,
//       (sum, item) => sum + (item['qty'] as int) * (item['price'] as double),
//     );

//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;

//     double discount = 0;
//     if (discountAmountInput > 0) {
//       discount = discountAmountInput.clamp(0, subtotal);
//     } else if (discountPercentInput > 0) {
//       discount = subtotal * (discountPercentInput / 100).clamp(0, 1);
//     }

//     final double grandTotal = (subtotal - discount).clamp(0, double.infinity);

//     return Scaffold(
//       appBar: AppBar(title: const Text('Invoice')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 // English (left)
//                 const Expanded(
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Al-Shifa Medical',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Urdu (right)
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: const Text(
//                         'الشفاء میڈیکل',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             Wrap(
//               spacing: 16,
//               runSpacing: 8,
//               crossAxisAlignment: WrapCrossAlignment.center,
//               children: [
//                 Text('NTN: $ntnNo'),
//                 Text('License No: $licenseNo'),
//                 SizedBox(
//                   width: 240,
//                   child: TextField(
//                     controller: customerController,
//                     decoration: const InputDecoration(
//                       labelText: 'Customer Name',
//                       isDense: true,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 Text('Print Time: ${_formatDateTime(DateTime.now())}'),
//               ],
//             ),

//             const Divider(height: 24, thickness: 1),

//             Row(
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(labelText: 'Medicine'),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: TextField(
//                     controller: qtyController,
//                     decoration: const InputDecoration(labelText: 'Qty'),
//                     keyboardType: TextInputType.number,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: TextField(
//                     controller: priceController,
//                     decoration: const InputDecoration(labelText: 'Rate'),
//                     keyboardType: TextInputType.number,
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.add, color: Colors.green),
//                   onPressed: addMedicine,
//                   tooltip: 'Add to cart',
//                 ),
//               ],
//             ),

//             const SizedBox(height: 16),

//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: DataTable(
//                   columns: const [
//                     DataColumn(label: Text('S.No')),
//                     DataColumn(label: Text('Medicine')),
//                     DataColumn(label: Text('Qty')),
//                     DataColumn(label: Text('Rate')),
//                     DataColumn(label: Text('Total')),
//                     DataColumn(label: Icon(Icons.delete, color: Colors.red)),
//                   ],
//                   rows: [
//                     for (int i = 0; i < cart.length; i++)
//                       DataRow(
//                         cells: [
//                           DataCell(Text('${i + 1}')),
//                           DataCell(Text(cart[i]['name'].toString())),
//                           DataCell(Text(cart[i]['qty'].toString())),
//                           DataCell(
//                             Text(
//                               (cart[i]['price'] as double).toStringAsFixed(2),
//                             ),
//                           ),
//                           DataCell(
//                             Text(
//                               ((cart[i]['qty'] as int) *
//                                       (cart[i]['price'] as double))
//                                   .toStringAsFixed(2),
//                             ),
//                           ),
//                           DataCell(
//                             IconButton(
//                               icon: const Icon(Icons.delete, color: Colors.red),
//                               onPressed: () {
//                                 setState(() {
//                                   cart.removeAt(i);
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 8),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   width: 140,
//                   child: TextField(
//                     controller: discountPercentController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       labelText: 'Discount %',
//                       isDense: true,
//                     ),
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 SizedBox(
//                   width: 160,
//                   child: TextField(
//                     controller: discountAmountController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       labelText: 'Discount (Rs.)',
//                       isDense: true,
//                     ),
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 8),

//             // ====== Totals ======
//             Align(
//               alignment: Alignment.centerRight,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                   Text(
//                     'Discount: Rs. ${discount.toStringAsFixed(2)}' +
//                         (discountAmountInput > 0
//                             ? ' (manual)'
//                             : discountPercentInput > 0
//                             ? ' (${discountPercentInput.toStringAsFixed(2)}%)'
//                             : ''),
//                   ),
//                   Text(
//                     'Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             Row(
//               children: [
//                 SizedBox(
//                   width: 260,
//                   child: TextField(
//                     controller: counterPersonController,
//                     decoration: const InputDecoration(
//                       labelText: 'Counter Person Name',
//                       isDense: true,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 const Text(
//                   'THANK YOU FOR SHOPPING',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 12),

//             const Text(
//               'Terms & Conditions',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 6),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   ' بغیر بل کے کوئی دوا اور دیگر اشیاء واپس یا تبدیل نہیں کی جائیں گی۔',
//                 ),
//                 Text(
//                   'واپسی/تبدیلی صرف 15 دن کے اندر ممکن ہے، اس کے بعد ممکن نہیں ہوگی۔',
//                 ),
//                 Text(
//                   ' انسولین، ویکسین، فریج کی اشیاء، کاسمیٹکس ، شوگر اسٹرپس واپس یا تبدیل نہیں کی جائیں گی۔',
//                 ),
//                 Text(
//                   ' دوا اور بقایا جات کاونٹر پر چیک کریں، بعد میں کوئی دعویٰ قبول نہیں کیا جائے گا۔',
//                 ),
//                 Text(
//                   'دوا ڈاکٹر کے مشورے سے استعمال کریں؛ دوا کے غلط استعمال یا سائیڈ ایفیکٹس کی صورت میں ہم ذمہ دار نہیں ہوں گے۔',
//                 ),
//               ],
//             ),

//             const SizedBox(height: 12),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _printOrSharePdf,
//                   icon: const Icon(Icons.print),
//                   label: const Text('Print / Download Invoice'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _printOrSharePdf() async {
//     final bytes = await _buildPdf();
//     await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => bytes);
//   }

//   Future<Uint8List> _buildPdf() async {
//     final doc = pw.Document();

//     // Attempt to load an Urdu-capable font from assets for correct shaping.
//     // assets/fonts/NotoNastaliqUrdu-Regular.ttf
//     pw.Font? urduFont;
//     try {
//       final data = await rootBundle.load(
//         'assets/fonts/NotoNastaliqUrdu-Regular.ttf',
//       );
//       urduFont = pw.Font.ttf(data);
//     } catch (_) {
//       urduFont = null; // Fallback
//     }

//     final now = DateTime.now();

//     final double subtotal = cart.fold<double>(
//       0,
//       (sum, item) => sum + (item['qty'] as int) * (item['price'] as double),
//     );
//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;
//     double discount = 0;
//     if (discountAmountInput > 0) {
//       discount = discountAmountInput.clamp(0, subtotal);
//     } else if (discountPercentInput > 0) {
//       discount = subtotal * (discountPercentInput / 100).clamp(0, 1);
//     }
//     final double grandTotal = (subtotal - discount).clamp(0, double.infinity);

//     doc.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         margin: const pw.EdgeInsets.all(24),
//         build: (context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.stretch,
//             children: [
//               // Header bilingual (English left, Urdu right)
//               pw.Row(
//                 children: [
//                   pw.Expanded(
//                     child: pw.Align(
//                       alignment: pw.Alignment.centerLeft,
//                       child: pw.Text(
//                         'Al-Shifa Medical',
//                         style: pw.TextStyle(
//                           fontSize: 18,
//                           fontWeight: pw.FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   pw.Expanded(
//                     child: pw.Align(
//                       alignment: pw.Alignment.centerRight,
//                       child:
//                           urduFont == null
//                               ? pw.Text(
//                                 'الشفاء میڈیکل',
//                                 style: pw.TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: pw.FontWeight.bold,
//                                 ),
//                               )
//                               : pw.Directionality(
//                                 textDirection: pw.TextDirection.rtl,
//                                 child: pw.Text(
//                                   'الشفاء میڈیکل',
//                                   style: pw.TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: pw.FontWeight.bold,
//                                     font: urduFont,
//                                   ),
//                                 ),
//                               ),
//                     ),
//                   ),
//                 ],
//               ),
//               pw.SizedBox(height: 8),

//               // Meta info
//               pw.Wrap(
//                 spacing: 16,
//                 runSpacing: 8,
//                 children: [
//                   pw.Text('NTN: $ntnNo'),
//                   pw.Text('License No: $licenseNo'),
//                   pw.Text(
//                     'Customer: ${customerController.text.trim().isEmpty ? '-' : customerController.text.trim()}',
//                   ),
//                   pw.Text('Print Time: ${_formatDateTime(now)}'),
//                 ],
//               ),

//               pw.SizedBox(height: 12),
//               pw.Divider(),

//               // Items table
//               pw.Table.fromTextArray(
//                 headers: const ['S.No', 'Medicine', 'Qty', 'Rate', 'Total'],
//                 data: [
//                   for (int i = 0; i < cart.length; i++)
//                     [
//                       '${i + 1}',
//                       cart[i]['name'].toString(),
//                       cart[i]['qty'].toString(),
//                       (cart[i]['price'] as double).toStringAsFixed(2),
//                       ((cart[i]['qty'] as int) * (cart[i]['price'] as double))
//                           .toStringAsFixed(2),
//                     ],
//                 ],
//                 headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//                 cellAlignment: pw.Alignment.centerLeft,
//                 headerDecoration: const pw.BoxDecoration(
//                   color: PdfColors.grey300,
//                 ),
//                 cellHeight: 22,
//               ),

//               pw.SizedBox(height: 8),

//               // Totals
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.end,
//                 children: [
//                   pw.Column(
//                     crossAxisAlignment: pw.CrossAxisAlignment.end,
//                     children: [
//                       pw.Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                       pw.Text(
//                         'Discount: Rs. ${discount.toStringAsFixed(2)}' +
//                             (discountAmountInput > 0
//                                 ? ' (manual)'
//                                 : discountPercentInput > 0
//                                 ? ' (${discountPercentInput.toStringAsFixed(2)}%)'
//                                 : ''),
//                       ),
//                       pw.Text(
//                         'Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                         style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),

//               pw.SizedBox(height: 14),

//               pw.Text(
//                 'Terms & Conditions',
//                 style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
//               ),
//               pw.SizedBox(height: 6),
//               pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   pw.Text(
//                     ' بغیر بل کے کوئی دوا اور دیگر اشیاء واپس یا تبدیل نہیں کی جائیں گی۔',
//                   ),
//                   pw.Text(
//                     ' واپسی/تبدیلی صرف 15 دن کے اندر ممکن ہے، اس کے بعد ممکن نہیں ہوگی۔',
//                   ),
//                   pw.Text(
//                     ' انسولین، ویکسین، فریج کی اشیاء، کاسمیٹکس ، شوگر اسٹرپس واپس یا تبدیل نہیں کی جائیں گی۔',
//                   ),
//                   pw.Text(
//                     '٤۔ دوا اور پیسے کاونٹر پر چیک کریں، بعد میں کوئی دعویٰ قبول نہیں کیا جائے گا۔',
//                   ),
//                   pw.Text(
//                     ' دوا ڈاکٹر کے مشورے سے استعمال کریں؛ دوا کے غلط استعمال یا سائیڈ ایفیکٹس کی صورت میں ہم ذمہ دار نہیں ہوں گے۔',
//                   ),
//                 ],
//               ),

//               pw.SizedBox(height: 14),

//               pw.Row(
//                 crossAxisAlignment: pw.CrossAxisAlignment.end,
//                 children: [
//                   pw.Expanded(
//                     child: pw.Align(
//                       alignment: pw.Alignment.centerLeft,
//                       child: pw.Text(
//                         'Counter: ${counterPersonController.text.trim().isEmpty ? '-' : counterPersonController.text.trim()}',
//                         style: const pw.TextStyle(fontSize: 12),
//                       ),
//                     ),
//                   ),
//                   pw.Expanded(
//                     child: pw.Align(
//                       alignment: pw.Alignment.centerRight,
//                       child: pw.Text(
//                         'THANK YOU FOR SHOPPING',
//                         style: pw.TextStyle(
//                           fontSize: 16,
//                           fontWeight: pw.FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),
//     );

//     return doc.save();
//   }
// }
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class InvoiceScreen extends StatefulWidget {
//   const InvoiceScreen({super.key});

//   @override
//   State<InvoiceScreen> createState() => _InvoiceScreenState();
// }

// class _InvoiceScreenState extends State<InvoiceScreen> {
//   // Multiple bills stored here
//   final Map<String, List<Map<String, dynamic>>> bills = {};
//   String activeBill = "Bill_1";

//   // Controllers
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController qtyController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController customerController = TextEditingController();
//   final TextEditingController discountPercentController =
//       TextEditingController();
//   final TextEditingController discountAmountController =
//       TextEditingController();
//   final TextEditingController counterPersonController = TextEditingController();

//   final String ntnNo = '#1234677';
//   final String licenseNo = 'LIC-987654';

//   @override
//   void initState() {
//     super.initState();
//     bills[activeBill] = []; // Initialize first bill
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     qtyController.dispose();
//     priceController.dispose();
//     customerController.dispose();
//     discountPercentController.dispose();
//     discountAmountController.dispose();
//     counterPersonController.dispose();
//     super.dispose();
//   }

//   List<Map<String, dynamic>> get cart => bills[activeBill] ?? [];

//   void addMedicine() {
//     final name = nameController.text.trim();
//     final qty = int.tryParse(qtyController.text.trim());
//     final price = double.tryParse(priceController.text.trim());

//     if (name.isNotEmpty && qty != null && price != null) {
//       setState(() {
//         cart.add({'name': name, 'qty': qty, 'price': price});
//       });

//       nameController.clear();
//       qtyController.clear();
//       priceController.clear();
//     }
//   }

//   void _createNewBill() {
//     final newKey = "Bill_${bills.length + 1}";
//     setState(() {
//       bills[newKey] = [];
//       activeBill = newKey;
//     });
//   }

//   void _switchBill(String key) {
//     setState(() {
//       activeBill = key;
//     });
//   }

//   String _formatDateTime(DateTime dt) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double subtotal = cart.fold<double>(
//       0,
//       (sum, item) => sum + (item['qty'] as int) * (item['price'] as double),
//     );

//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;

//     double discount = 0;
//     if (discountAmountInput > 0) {
//       discount = discountAmountInput.clamp(0, subtotal);
//     } else if (discountPercentInput > 0) {
//       discount = subtotal * (discountPercentInput / 100).clamp(0, 1);
//     }

//     final double grandTotal = (subtotal - discount).clamp(0, double.infinity);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice - $activeBill'),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _switchBill,
//             itemBuilder: (context) => bills.keys
//                 .map(
//                   (bill) => PopupMenuItem(
//                     value: bill,
//                     child: Text(bill == activeBill ? "$bill (Active)" : bill),
//                   ),
//                 )
//                 .toList(),
//           ),
//           IconButton(
//             onPressed: _createNewBill,
//             icon: const Icon(Icons.add),
//             tooltip: "New Bill",
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header bilingual
//             Row(
//               children: [
//                 const Expanded(
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Al-Shifa Medical',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: const Text(
//                         'الشفاء میڈیکل',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             Wrap(
//               spacing: 16,
//               runSpacing: 8,
//               crossAxisAlignment: WrapCrossAlignment.center,
//               children: [
//                 Text('NTN: $ntnNo'),
//                 Text('License No: $licenseNo'),
//                 SizedBox(
//                   width: 240,
//                   child: TextField(
//                     controller: customerController,
//                     decoration: const InputDecoration(
//                       labelText: 'Customer Name',
//                       isDense: true,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 Text('Print Time: ${_formatDateTime(DateTime.now())}'),
//               ],
//             ),

//             const Divider(height: 24, thickness: 1),

//             Row(
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(labelText: 'Medicine'),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: TextField(
//                     controller: qtyController,
//                     decoration: const InputDecoration(labelText: 'Qty'),
//                     keyboardType: TextInputType.number,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: TextField(
//                     controller: priceController,
//                     decoration: const InputDecoration(labelText: 'Rate'),
//                     keyboardType: TextInputType.number,
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.add, color: Colors.green),
//                   onPressed: addMedicine,
//                   tooltip: 'Add to cart',
//                 ),
//               ],
//             ),

//             const SizedBox(height: 16),

//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: DataTable(
//                   columns: const [
//                     DataColumn(label: Text('S.No')),
//                     DataColumn(label: Text('Medicine')),
//                     DataColumn(label: Text('Qty')),
//                     DataColumn(label: Text('Rate')),
//                     DataColumn(label: Text('Total')),
//                     DataColumn(label: Icon(Icons.delete, color: Colors.red)),
//                   ],
//                   rows: [
//                     for (int i = 0; i < cart.length; i++)
//                       DataRow(
//                         cells: [
//                           DataCell(Text('${i + 1}')),
//                           DataCell(Text(cart[i]['name'].toString())),
//                           DataCell(Text(cart[i]['qty'].toString())),
//                           DataCell(Text(
//                               (cart[i]['price'] as double).toStringAsFixed(2))),
//                           DataCell(
//                             Text(((cart[i]['qty'] as int) *
//                                     (cart[i]['price'] as double))
//                                 .toStringAsFixed(2)),
//                           ),
//                           DataCell(
//                             IconButton(
//                               icon: const Icon(Icons.delete, color: Colors.red),
//                               onPressed: () {
//                                 setState(() {
//                                   cart.removeAt(i);
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 8),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   width: 140,
//                   child: TextField(
//                     controller: discountPercentController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       labelText: 'Discount %',
//                       isDense: true,
//                     ),
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 SizedBox(
//                   width: 160,
//                   child: TextField(
//                     controller: discountAmountController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       labelText: 'Discount (Rs.)',
//                       isDense: true,
//                     ),
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 8),

//             Align(
//               alignment: Alignment.centerRight,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                   Text(
//                     'Discount: Rs. ${discount.toStringAsFixed(2)}' +
//                         (discountAmountInput > 0
//                             ? ' (manual)'
//                             : discountPercentInput > 0
//                                 ? ' (${discountPercentInput.toStringAsFixed(2)}%)'
//                                 : ''),
//                   ),
//                   Text(
//                     'Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 18),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             Row(
//               children: [
//                 SizedBox(
//                   width: 260,
//                   child: TextField(
//                     controller: counterPersonController,
//                     decoration: const InputDecoration(
//                       labelText: 'Counter Person Name',
//                       isDense: true,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 const Text(
//                   'THANK YOU FOR SHOPPING',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 12),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _printOrSharePdf,
//                   icon: const Icon(Icons.print),
//                   label: const Text('Print / Download Invoice'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _printOrSharePdf() async {
//     final bytes = await _buildPdf();
//     await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => bytes);
//   }

//   Future<Uint8List> _buildPdf() async {
//     final doc = pw.Document();
//     final now = DateTime.now();

//     final double subtotal = cart.fold<double>(
//       0,
//       (sum, item) => sum + (item['qty'] as int) * (item['price'] as double),
//     );
//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;
//     double discount = 0;
//     if (discountAmountInput > 0) {
//       discount = discountAmountInput.clamp(0, subtotal);
//     } else if (discountPercentInput > 0) {
//       discount = subtotal * (discountPercentInput / 100).clamp(0, 1);
//     }
//     final double grandTotal = (subtotal - discount).clamp(0, double.infinity);

//     doc.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (context) => pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.stretch,
//           children: [
//             pw.Text("Invoice - $activeBill",
//                 style:
//                     pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
//             pw.SizedBox(height: 12),
//             pw.Table.fromTextArray(
//               headers: const ['S.No', 'Medicine', 'Qty', 'Rate', 'Total'],
//               data: [
//                 for (int i = 0; i < cart.length; i++)
//                   [
//                     '${i + 1}',
//                     cart[i]['name'],
//                     cart[i]['qty'].toString(),
//                     (cart[i]['price'] as double).toStringAsFixed(2),
//                     ((cart[i]['qty'] as int) * (cart[i]['price'] as double))
//                         .toStringAsFixed(2),
//                   ]
//               ],
//             ),
//             pw.SizedBox(height: 20),
//             pw.Text("Subtotal: Rs. ${subtotal.toStringAsFixed(2)}"),
//             pw.Text("Discount: Rs. ${discount.toStringAsFixed(2)}"),
//             pw.Text("Total: Rs. ${grandTotal.toStringAsFixed(2)}",
//                 style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//           ],
//         ),
//       ),
//     );

//     return doc.save();
//   }
// }
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart'; // ✅ Added
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class InvoiceScreen extends StatefulWidget {
//   const InvoiceScreen({super.key});

//   @override
//   State<InvoiceScreen> createState() => _InvoiceScreenState();
// }

// class _InvoiceScreenState extends State<InvoiceScreen> {
//   // Multiple bills
//   final Map<String, List<Map<String, dynamic>>> bills = {};
//   String activeBill = "Bill_1";

//   // Hive box for available stocks
//   final Box stocksBox = Hive.box('stocksBox');

//   // Controllers
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController qtyController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController customerController = TextEditingController();
//   final TextEditingController discountPercentController =
//       TextEditingController();
//   final TextEditingController discountAmountController =
//       TextEditingController();
//   final TextEditingController counterPersonController = TextEditingController();

//   final String ntnNo = '#1234677';
//   final String licenseNo = 'LIC-987654';

//   // For medicine suggestions
//   List<Map> filteredMedicines = []; // ✅ Changed

//   @override
//   void initState() {
//     super.initState();
//     bills[activeBill] = [];
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     qtyController.dispose();
//     priceController.dispose();
//     customerController.dispose();
//     discountPercentController.dispose();
//     discountAmountController.dispose();
//     counterPersonController.dispose();
//     super.dispose();
//   }

//   List<Map<String, dynamic>> get cart => bills[activeBill] ?? [];

//   void addMedicine() {
//     final name = nameController.text.trim();
//     final qty = int.tryParse(qtyController.text.trim());
//     final price = double.tryParse(priceController.text.trim());

//     if (name.isNotEmpty && qty != null && price != null) {
//       setState(() {
//         cart.add({'name': name, 'qty': qty, 'price': price});
//       });

//       nameController.clear();
//       qtyController.clear();
//       priceController.clear();
//     }
//   }

//   void _createNewBill() {
//     final newKey = "Bill_${bills.length + 1}";
//     setState(() {
//       bills[newKey] = [];
//       activeBill = newKey;
//     });
//   }

//   void _switchBill(String key) {
//     setState(() {
//       activeBill = key;
//     });
//   }

//   String _formatDateTime(DateTime dt) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double subtotal = cart.fold<double>(
//       0,
//       (sum, item) => sum + (item['qty'] as int) * (item['price'] as double),
//     );

//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;

//     double discount = 0;
//     if (discountAmountInput > 0) {
//       discount = discountAmountInput.clamp(0, subtotal);
//     } else if (discountPercentInput > 0) {
//       discount = subtotal * (discountPercentInput / 100).clamp(0, 1);
//     }

//     final double grandTotal = (subtotal - discount).clamp(0, double.infinity);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice - $activeBill'),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _switchBill,
//             itemBuilder: (context) => bills.keys
//                 .map(
//                   (bill) => PopupMenuItem(
//                     value: bill,
//                     child: Text(bill == activeBill ? "$bill (Active)" : bill),
//                   ),
//                 )
//                 .toList(),
//           ),
//           IconButton(
//             onPressed: _createNewBill,
//             icon: const Icon(Icons.add),
//             tooltip: "New Bill",
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header bilingual
//             Row(
//               children: [
//                 const Expanded(
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Al-Shifa Medical',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: const Text(
//                         'الشفاء میڈیکل',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             Wrap(
//               spacing: 16,
//               runSpacing: 8,
//               crossAxisAlignment: WrapCrossAlignment.center,
//               children: [
//                 Text('NTN: $ntnNo'),
//                 Text('License No: $licenseNo'),
//                 SizedBox(
//                   width: 240,
//                   child: TextField(
//                     controller: customerController,
//                     decoration: const InputDecoration(
//                       labelText: 'Customer Name',
//                       isDense: true,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 Text('Print Time: ${_formatDateTime(DateTime.now())}'),
//               ],
//             ),

//             const Divider(height: 24, thickness: 1),

//             // ✅ Medicine search + auto fill
//             Row(
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: Column(
//                     children: [
//                       TextField(
//                         controller: nameController,
//                         decoration:
//                             const InputDecoration(labelText: 'Medicine'),
//                         onChanged: (value) {
//                           setState(() {
//                             if (value.isNotEmpty) {
//                               filteredMedicines = stocksBox.values
//                                   .where((stock) => stock["Medicine Name"]
//                                       .toString()
//                                       .toLowerCase()
//                                       .startsWith(value.toLowerCase()))
//                                   .cast<Map>()
//                                   .toList();
//                             } else {
//                               filteredMedicines = [];
//                             }
//                           });
//                         },
//                       ),
//                       if (filteredMedicines.isNotEmpty)
//                         Container(
//                           height: 120,
//                           color: Colors.grey[200],
//                           child: ListView.builder(
//                             itemCount: filteredMedicines.length,
//                             itemBuilder: (context, index) {
//                               final stock = filteredMedicines[index];
//                               return ListTile(
//                                 title: Text(stock["Medicine Name"]),
//                                 subtitle: Text(
//                                     "Pack: ${stock["Tablets"]} | Price: Rs. ${stock["PackPrice"]}"),
//                                 onTap: () {
//                                   setState(() {
//                                     nameController.text =
//                                         stock["Medicine Name"];

//                                     final int packSize = int.tryParse(
//                                             stock["Tablets"].toString()) ??
//                                         1;
//                                     final double packPrice = double.tryParse(
//                                             stock["PackPrice"].toString()) ??
//                                         0.0;
//                                     final double perTabletRate =
//                                         packSize > 0 ? packPrice / packSize : 0;

//                                     filteredMedicines = [];
//                                   });
//                                 },
//                               );
//                             },
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: TextField(
//                     controller: qtyController,
//                     decoration: const InputDecoration(labelText: 'Qty'),
//                     keyboardType: TextInputType.number,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: TextField(
//                     controller: priceController,
//                     decoration: const InputDecoration(labelText: 'Rate'),
//                     keyboardType: TextInputType.number,
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.add, color: Colors.green),
//                   onPressed: addMedicine,
//                   tooltip: 'Add to cart',
//                 ),
//               ],
//             ),

//             const SizedBox(height: 16),

//             // Table of cart
//             Expanded(
//               child: SingleChildScrollView(
//                 child: DataTable(
//                   columns: const [
//                     DataColumn(label: Text('S.No')),
//                     DataColumn(label: Text('Medicine')),
//                     DataColumn(label: Text('Qty')),
//                     DataColumn(label: Text('Rate')),
//                     DataColumn(label: Text('Total')),
//                     DataColumn(label: Icon(Icons.delete, color: Colors.red)),
//                   ],
//                   rows: [
//                     for (int i = 0; i < cart.length; i++)
//                       DataRow(
//                         cells: [
//                           DataCell(Text('${i + 1}')),
//                           DataCell(Text(cart[i]['name'].toString())),
//                           DataCell(Text(cart[i]['qty'].toString())),
//                           DataCell(Text(
//                               (cart[i]['price'] as double).toStringAsFixed(2))),
//                           DataCell(
//                             Text(((cart[i]['qty'] as int) *
//                                     (cart[i]['price'] as double))
//                                 .toStringAsFixed(2)),
//                           ),
//                           DataCell(
//                             IconButton(
//                               icon: const Icon(Icons.delete, color: Colors.red),
//                               onPressed: () {
//                                 setState(() {
//                                   cart.removeAt(i);
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 8),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   width: 140,
//                   child: TextField(
//                     controller: discountPercentController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       labelText: 'Discount %',
//                       isDense: true,
//                     ),
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 SizedBox(
//                   width: 160,
//                   child: TextField(
//                     controller: discountAmountController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       labelText: 'Discount (Rs.)',
//                       isDense: true,
//                     ),
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 8),

//             Align(
//               alignment: Alignment.centerRight,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                   Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//                   Text(
//                     'Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 18),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             Row(
//               children: [
//                 SizedBox(
//                   width: 260,
//                   child: TextField(
//                     controller: counterPersonController,
//                     decoration: const InputDecoration(
//                       labelText: 'Counter Person Name',
//                       isDense: true,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 const Text(
//                   'THANK YOU FOR SHOPPING',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 12),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _printOrSharePdf,
//                   icon: const Icon(Icons.print),
//                   label: const Text('Print / Download Invoice'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _printOrSharePdf() async {
//     final bytes = await _buildPdf();
//     await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => bytes);
//   }

//   Future<Uint8List> _buildPdf() async {
//     final doc = pw.Document();
//     final double subtotal = cart.fold<double>(
//       0,
//       (sum, item) => sum + (item['qty'] as int) * (item['price'] as double),
//     );
//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;
//     double discount = 0;
//     if (discountAmountInput > 0) {
//       discount = discountAmountInput.clamp(0, subtotal);
//     } else if (discountPercentInput > 0) {
//       discount = subtotal * (discountPercentInput / 100).clamp(0, 1);
//     }
//     final double grandTotal = (subtotal - discount).clamp(0, double.infinity);

//     doc.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (context) => pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.stretch,
//           children: [
//             pw.Text("Invoice - $activeBill",
//                 style:
//                     pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
//             pw.SizedBox(height: 12),
//             pw.Table.fromTextArray(
//               headers: const ['S.No', 'Medicine', 'Qty', 'Rate', 'Total'],
//               data: [
//                 for (int i = 0; i < cart.length; i++)
//                   [
//                     '${i + 1}',
//                     cart[i]['name'],
//                     cart[i]['qty'].toString(),
//                     (cart[i]['price'] as double).toStringAsFixed(2),
//                     ((cart[i]['qty'] as int) * (cart[i]['price'] as double))
//                         .toStringAsFixed(2),
//                   ]
//               ],
//             ),
//             pw.SizedBox(height: 20),
//             pw.Text("Subtotal: Rs. ${subtotal.toStringAsFixed(2)}"),
//             pw.Text("Discount: Rs. ${discount.toStringAsFixed(2)}"),
//             pw.Text("Total: Rs. ${grandTotal.toStringAsFixed(2)}",
//                 style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//           ],
//         ),
//       ),
//     );

//     return doc.save();
//   }
// }
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class InvoiceScreen extends StatefulWidget {
//   const InvoiceScreen({super.key});

//   @override
//   State<InvoiceScreen> createState() => _InvoiceScreenState();
// }

// class _InvoiceScreenState extends State<InvoiceScreen> {
//   // Multiple bills
//   final Map<String, List<Map<String, dynamic>>> bills = {};
//   String activeBill = "Bill_1";

//   // Hive box for available stocks
//   final Box stocksBox = Hive.box('stocksBox');

//   // Controllers
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController qtyController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController customerController = TextEditingController();
//   final TextEditingController discountPercentController =
//       TextEditingController();
//   final TextEditingController discountAmountController =
//       TextEditingController();
//   final TextEditingController counterPersonController = TextEditingController();

//   final String ntnNo = '#1234677';
//   final String licenseNo = 'LIC-987654';

//   // For medicine suggestions
//   List<Map> filteredMedicines = [];

//   // Track per-tablet rate
//   double currentPerTabletRate = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     bills[activeBill] = [];
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     qtyController.dispose();
//     priceController.dispose();
//     customerController.dispose();
//     discountPercentController.dispose();
//     discountAmountController.dispose();
//     counterPersonController.dispose();
//     super.dispose();
//   }

//   List<Map<String, dynamic>> get cart => bills[activeBill] ?? [];

//   void addMedicine() {
//     final name = nameController.text.trim();
//     final qty = int.tryParse(qtyController.text.trim());

//     if (name.isNotEmpty && qty != null) {
//       setState(() {
//         cart.add({
//           'name': name,
//           'qty': qty,
//           'price': currentPerTabletRate * qty, // auto total price
//         });
//       });

//       nameController.clear();
//       qtyController.clear();
//       priceController.clear();
//       currentPerTabletRate = 0.0;
//     }
//   }

//   void _createNewBill() {
//     final newKey = "Bill_${bills.length + 1}";
//     setState(() {
//       bills[newKey] = [];
//       activeBill = newKey;
//     });
//   }

//   void _switchBill(String key) {
//     setState(() {
//       activeBill = key;
//     });
//   }

//   String _formatDateTime(DateTime dt) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double subtotal = cart.fold<double>(
//       0,
//       (sum, item) => sum + (item['price'] as double),
//     );

//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;

//     double discount = 0;
//     if (discountAmountInput > 0) {
//       discount = discountAmountInput.clamp(0, subtotal);
//     } else if (discountPercentInput > 0) {
//       discount = subtotal * (discountPercentInput / 100).clamp(0, 1);
//     }

//     final double grandTotal = (subtotal - discount).clamp(0, double.infinity);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice - $activeBill'),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _switchBill,
//             itemBuilder: (context) => bills.keys
//                 .map(
//                   (bill) => PopupMenuItem(
//                     value: bill,
//                     child: Text(bill == activeBill ? "$bill (Active)" : bill),
//                   ),
//                 )
//                 .toList(),
//           ),
//           IconButton(
//             onPressed: _createNewBill,
//             icon: const Icon(Icons.add),
//             tooltip: "New Bill",
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header bilingual
//             Row(
//               children: [
//                 const Expanded(
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Al-Shifa Medical',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: const Text(
//                         'الشفاء میڈیکل',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             Wrap(
//               spacing: 16,
//               runSpacing: 8,
//               crossAxisAlignment: WrapCrossAlignment.center,
//               children: [
//                 Text('NTN: $ntnNo'),
//                 Text('License No: $licenseNo'),
//                 SizedBox(
//                   width: 240,
//                   child: TextField(
//                     controller: customerController,
//                     decoration: const InputDecoration(
//                       labelText: 'Customer Name',
//                       isDense: true,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 Text('Print Time: ${_formatDateTime(DateTime.now())}'),
//               ],
//             ),

//             const Divider(height: 24, thickness: 1),

//             // Medicine search + auto fill
//             Row(
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: Column(
//                     children: [
//                       TextField(
//                         controller: nameController,
//                         decoration:
//                             const InputDecoration(labelText: 'Medicine'),
//                         onChanged: (value) {
//                           setState(() {
//                             if (value.isNotEmpty) {
//                               filteredMedicines = stocksBox.values
//                                   .where((stock) => stock["Medicine Name"]
//                                       .toString()
//                                       .toLowerCase()
//                                       .startsWith(value.toLowerCase()))
//                                   .cast<Map>()
//                                   .toList();
//                             } else {
//                               filteredMedicines = [];
//                             }
//                           });
//                         },
//                       ),
//                       if (filteredMedicines.isNotEmpty)
//                         Container(
//                           height: 120,
//                           color: Colors.grey[200],
//                           child: ListView.builder(
//                             itemCount: filteredMedicines.length,
//                             itemBuilder: (context, index) {
//                               final stock = filteredMedicines[index];
//                               return ListTile(
//                                 title: Text(stock["Medicine Name"]),
//                                 subtitle: Text(
//                                     "Pack: ${stock["Tablets"]} | Price: Rs. ${stock["PackPrice"]}"),
//                                 onTap: () {
//                                   setState(() {
//                                     nameController.text =
//                                         stock["Medicine Name"];

//                                     final int packSize = int.tryParse(
//                                             stock["Tablets"].toString()) ??
//                                         1;
//                                     final double packPrice = double.tryParse(
//                                             stock["PackPrice"].toString()) ??
//                                         0.0;

//                                     currentPerTabletRate =
//                                         packSize > 0 ? packPrice / packSize : 0;

//                                     qtyController.text = '1';
//                                     priceController.text =
//                                         currentPerTabletRate.toStringAsFixed(2);

//                                     filteredMedicines = [];
//                                   });
//                                 },
//                               );
//                             },
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: TextField(
//                     controller: qtyController,
//                     decoration: const InputDecoration(labelText: 'Qty'),
//                     keyboardType: TextInputType.number,
//                     onChanged: (value) {
//                       final qty = int.tryParse(value) ?? 1;
//                       setState(() {
//                         priceController.text =
//                             (currentPerTabletRate * qty).toStringAsFixed(2);
//                       });
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: TextField(
//                     controller: priceController,
//                     decoration: const InputDecoration(labelText: 'Rate'),
//                     keyboardType: TextInputType.number,
//                     readOnly: true, // Make it read-only as it auto-calculates
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.add, color: Colors.green),
//                   onPressed: addMedicine,
//                   tooltip: 'Add to cart',
//                 ),
//               ],
//             ),

//             const SizedBox(height: 16),

//             // Table of cart
//             Expanded(
//               child: SingleChildScrollView(
//                 child: DataTable(
//                   columns: const [
//                     DataColumn(label: Text('S.No')),
//                     DataColumn(label: Text('Medicine')),
//                     DataColumn(label: Text('Qty')),
//                     DataColumn(label: Text('Rate')),
//                     DataColumn(label: Text('Total')),
//                     DataColumn(label: Icon(Icons.delete, color: Colors.red)),
//                   ],
//                   rows: [
//                     for (int i = 0; i < cart.length; i++)
//                       DataRow(
//                         cells: [
//                           DataCell(Text('${i + 1}')),
//                           DataCell(Text(cart[i]['name'].toString())),
//                           DataCell(Text(cart[i]['qty'].toString())),
//                           DataCell(Text((cart[i]['price'] / cart[i]['qty'])
//                               .toStringAsFixed(2))),
//                           DataCell(
//                             Text((cart[i]['price'] as double)
//                                 .toStringAsFixed(2)),
//                           ),
//                           DataCell(
//                             IconButton(
//                               icon: const Icon(Icons.delete, color: Colors.red),
//                               onPressed: () {
//                                 setState(() {
//                                   cart.removeAt(i);
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 8),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   width: 140,
//                   child: TextField(
//                     controller: discountPercentController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       labelText: 'Discount %',
//                       isDense: true,
//                     ),
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 SizedBox(
//                   width: 160,
//                   child: TextField(
//                     controller: discountAmountController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       labelText: 'Discount (Rs.)',
//                       isDense: true,
//                     ),
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 8),

//             Align(
//               alignment: Alignment.centerRight,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                   Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//                   Text(
//                     'Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 18),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             Row(
//               children: [
//                 SizedBox(
//                   width: 260,
//                   child: TextField(
//                     controller: counterPersonController,
//                     decoration: const InputDecoration(
//                       labelText: 'Counter Person Name',
//                       isDense: true,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 const Text(
//                   'THANK YOU FOR SHOPPING',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 12),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _printOrSharePdf,
//                   icon: const Icon(Icons.print),
//                   label: const Text('Print / Download Invoice'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _printOrSharePdf() async {
//     final bytes = await _buildPdf();
//     await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => bytes);
//   }

//   Future<Uint8List> _buildPdf() async {
//     final doc = pw.Document();
//     final double subtotal = cart.fold<double>(
//       0,
//       (sum, item) => sum + (item['price'] as double),
//     );
//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;
//     double discount = 0;
//     if (discountAmountInput > 0) {
//       discount = discountAmountInput.clamp(0, subtotal);
//     } else if (discountPercentInput > 0) {
//       discount = subtotal * (discountPercentInput / 100).clamp(0, 1);
//     }
//     final double grandTotal = (subtotal - discount).clamp(0, double.infinity);

//     doc.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (context) => pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.stretch,
//           children: [
//             pw.Text("Invoice - $activeBill",
//                 style:
//                     pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
//             pw.SizedBox(height: 12),
//             pw.Table.fromTextArray(
//               headers: const ['S.No', 'Medicine', 'Qty', 'Rate', 'Total'],
//               data: [
//                 for (int i = 0; i < cart.length; i++)
//                   [
//                     '${i + 1}',
//                     cart[i]['name'],
//                     cart[i]['qty'].toString(),
//                     ((cart[i]['price'] as double) / (cart[i]['qty'] as int))
//                         .toStringAsFixed(2),
//                     (cart[i]['price'] as double).toStringAsFixed(2),
//                   ]
//               ],
//             ),
//             pw.SizedBox(height: 20),
//             pw.Text("Subtotal: Rs. ${subtotal.toStringAsFixed(2)}"),
//             pw.Text("Discount: Rs. ${discount.toStringAsFixed(2)}"),
//             pw.Text("Total: Rs. ${grandTotal.toStringAsFixed(2)}",
//                 style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//           ],
//         ),
//       ),
//     );

//     return doc.save();
//   }
// }
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class InvoiceScreen extends StatefulWidget {
//   const InvoiceScreen({super.key});

//   @override
//   State<InvoiceScreen> createState() => _InvoiceScreenState();
// }

// class _InvoiceScreenState extends State<InvoiceScreen> {
//   // Multiple bills
//   final Map<String, List<Map<String, dynamic>>> bills = {};
//   String activeBill = "Bill_1";

//   // Hive box for available stocks
//   final Box stocksBox = Hive.box('stocksBox');

//   // Controllers
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController qtyController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController customerController = TextEditingController();
//   final TextEditingController discountPercentController =
//       TextEditingController();
//   final TextEditingController discountAmountController =
//       TextEditingController();
//   final TextEditingController counterPersonController = TextEditingController();

//   final String ntnNo = '#1234677';
//   final String licenseNo = 'LIC-987654';

//   // For medicine suggestions
//   List<Map> filteredMedicines = [];

//   // Track per-tablet rate
//   double currentPerTabletRate = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     bills[activeBill] = [];
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     qtyController.dispose();
//     priceController.dispose();
//     customerController.dispose();
//     discountPercentController.dispose();
//     discountAmountController.dispose();
//     counterPersonController.dispose();
//     super.dispose();
//   }

//   List<Map<String, dynamic>> get cart => bills[activeBill] ?? [];

//   // void addMedicine() {
//   //   final name = nameController.text.trim();
//   //   final qty = int.tryParse(qtyController.text.trim());

//   //   if (name.isNotEmpty && qty != null && currentPerTabletRate > 0) {
//   //     setState(() {
//   //       cart.add({
//   //         'name': name,
//   //         'qty': qty,
//   //         'price': currentPerTabletRate * qty, // total price
//   //       });
//   //     });

//   //     nameController.clear();
//   //     qtyController.clear();
//   //     priceController.clear();
//   //     currentPerTabletRate = 0.0;
//   //   } else {
//   //     // Show warning if medicine not selected from stocks
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(
//   //           content: Text('Please select a medicine from suggestions')),
//   //     );
//   //   }
//   // }
//   void addMedicine() {
//     final name = nameController.text.trim();
//     final qty = int.tryParse(qtyController.text.trim()) ?? 1;

//     if (name.isEmpty) return;

//     // Find medicine in stocksBox
//     final stock = stocksBox.values.cast<Map>().firstWhere(
//           (m) =>
//               m["Medicine Name"].toString().toLowerCase() == name.toLowerCase(),
//           orElse: () => {},
//         );

//     if (stock.isNotEmpty) {
//       // If found in stock, calculate per-tablet rate
//       final int packSize = int.tryParse(stock["Tablets"].toString()) ?? 1;
//       final double packPrice =
//           double.tryParse(stock["PackPrice"].toString()) ?? 0.0;
//       currentPerTabletRate = packSize > 0 ? packPrice / packSize : 0;
//     }

//     if (currentPerTabletRate <= 0) {
//       // Medicine not found, show error
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Medicine not found in stock!')),
//       );
//       return;
//     }

//     setState(() {
//       cart.add({
//         'name': name,
//         'qty': qty,
//         'price': currentPerTabletRate * qty,
//       });

//       // Clear inputs
//       nameController.clear();
//       qtyController.clear();
//       priceController.clear();
//       currentPerTabletRate = 0.0;
//     });
//   }

//   void _createNewBill() {
//     final newKey = "Bill_${bills.length + 1}";
//     setState(() {
//       bills[newKey] = [];
//       activeBill = newKey;
//     });
//   }

//   void _switchBill(String key) {
//     setState(() {
//       activeBill = key;
//     });
//   }

//   String _formatDateTime(DateTime dt) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double subtotal = cart.fold<double>(
//       0,
//       (sum, item) => sum + (item['price'] as double),
//     );

//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;

//     double discount = 0;
//     if (discountAmountInput > 0) {
//       discount = discountAmountInput.clamp(0, subtotal);
//     } else if (discountPercentInput > 0) {
//       discount = subtotal * (discountPercentInput / 100).clamp(0, 1);
//     }

//     final double grandTotal = (subtotal - discount).clamp(0, double.infinity);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice - $activeBill'),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _switchBill,
//             itemBuilder: (context) => bills.keys
//                 .map(
//                   (bill) => PopupMenuItem(
//                     value: bill,
//                     child: Text(bill == activeBill ? "$bill (Active)" : bill),
//                   ),
//                 )
//                 .toList(),
//           ),
//           IconButton(
//             onPressed: _createNewBill,
//             icon: const Icon(Icons.add),
//             tooltip: "New Bill",
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header bilingual
//             Row(
//               children: [
//                 const Expanded(
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Al-Shifa Medical',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: const Text(
//                         'الشفاء میڈیکل',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             Wrap(
//               spacing: 16,
//               runSpacing: 8,
//               crossAxisAlignment: WrapCrossAlignment.center,
//               children: [
//                 Text('NTN: $ntnNo'),
//                 Text('License No: $licenseNo'),
//                 SizedBox(
//                   width: 240,
//                   child: TextField(
//                     controller: customerController,
//                     decoration: const InputDecoration(
//                       labelText: 'Customer Name',
//                       isDense: true,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 Text('Print Time: ${_formatDateTime(DateTime.now())}'),
//               ],
//             ),

//             const Divider(height: 24, thickness: 1),

//             // Medicine search + auto fill
//             Row(
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: Column(
//                     children: [
//                       TextField(
//                         controller: nameController,
//                         decoration:
//                             const InputDecoration(labelText: 'Medicine'),
//                         onChanged: (value) {
//                           setState(() {
//                             if (value.isNotEmpty) {
//                               filteredMedicines = stocksBox.values
//                                   .where((stock) => stock["Medicine Name"]
//                                       .toString()
//                                       .toLowerCase()
//                                       .startsWith(value.toLowerCase()))
//                                   .cast<Map>()
//                                   .toList();
//                             } else {
//                               filteredMedicines = [];
//                             }
//                           });
//                         },
//                       ),
//                       if (filteredMedicines.isNotEmpty)
//                         Container(
//                           height: 120,
//                           color: Colors.grey[200],
//                           child: ListView.builder(
//                             itemCount: filteredMedicines.length,
//                             itemBuilder: (context, index) {
//                               final stock = filteredMedicines[index];
//                               return ListTile(
//                                 title: Text(stock["Medicine Name"]),
//                                 subtitle: Text(
//                                     "Pack: ${stock["Tablets"]} | Price: Rs. ${stock["PackPrice"]}"),
//                                 onTap: () {
//                                   setState(() {
//                                     nameController.text =
//                                         stock["Medicine Name"];

//                                     final int packSize = int.tryParse(
//                                             stock["Tablets"].toString()) ??
//                                         1;
//                                     final double packPrice = double.tryParse(
//                                             stock["PackPrice"].toString()) ??
//                                         0.0;

//                                     currentPerTabletRate =
//                                         packSize > 0 ? packPrice / packSize : 0;

//                                     qtyController.text = '1';
//                                     priceController.text =
//                                         currentPerTabletRate.toStringAsFixed(2);

//                                     filteredMedicines = [];
//                                   });
//                                 },
//                               );
//                             },
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: TextField(
//                     controller: qtyController,
//                     decoration: const InputDecoration(labelText: 'Qty'),
//                     keyboardType: TextInputType.number,
//                     onChanged: (value) {
//                       final qty = int.tryParse(value) ?? 1;
//                       setState(() {
//                         priceController.text =
//                             (currentPerTabletRate * qty).toStringAsFixed(2);
//                       });
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: TextField(
//                     controller: priceController,
//                     decoration: const InputDecoration(labelText: 'Rate'),
//                     keyboardType: TextInputType.number,
//                     readOnly: true, // auto-calculated
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.add, color: Colors.green),
//                   onPressed: addMedicine,
//                   tooltip: 'Add to cart',
//                 ),
//               ],
//             ),

//             const SizedBox(height: 16),

//             // Table of cart
//             Expanded(
//               child: SingleChildScrollView(
//                 child: DataTable(
//                   columns: const [
//                     DataColumn(label: Text('S.No')),
//                     DataColumn(label: Text('Medicine')),
//                     DataColumn(label: Text('Qty')),
//                     DataColumn(label: Text('Rate')),
//                     DataColumn(label: Text('Total')),
//                     DataColumn(label: Icon(Icons.delete, color: Colors.red)),
//                   ],
//                   rows: [
//                     for (int i = 0; i < cart.length; i++)
//                       DataRow(
//                         cells: [
//                           DataCell(Text('${i + 1}')),
//                           DataCell(Text(cart[i]['name'].toString())),
//                           DataCell(Text(cart[i]['qty'].toString())),
//                           DataCell(
//                             Text(
//                               cart[i]['qty'] > 0
//                                   ? ((cart[i]['price'] as double) /
//                                           (cart[i]['qty'] as int))
//                                       .toStringAsFixed(2)
//                                   : '0.00',
//                             ),
//                           ),
//                           DataCell(
//                             Text((cart[i]['price'] as double)
//                                 .toStringAsFixed(2)),
//                           ),
//                           DataCell(
//                             IconButton(
//                               icon: const Icon(Icons.delete, color: Colors.red),
//                               onPressed: () {
//                                 setState(() {
//                                   cart.removeAt(i);
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 8),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   width: 140,
//                   child: TextField(
//                     controller: discountPercentController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       labelText: 'Discount %',
//                       isDense: true,
//                     ),
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 SizedBox(
//                   width: 160,
//                   child: TextField(
//                     controller: discountAmountController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       labelText: 'Discount (Rs.)',
//                       isDense: true,
//                     ),
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 8),

//             Align(
//               alignment: Alignment.centerRight,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                   Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//                   Text(
//                     'Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 18),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             Row(
//               children: [
//                 SizedBox(
//                   width: 260,
//                   child: TextField(
//                     controller: counterPersonController,
//                     decoration: const InputDecoration(
//                       labelText: 'Counter Person Name',
//                       isDense: true,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 const Text(
//                   'THANK YOU FOR SHOPPING',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 12),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _printOrSharePdf,
//                   icon: const Icon(Icons.print),
//                   label: const Text('Print / Download Invoice'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _printOrSharePdf() async {
//     final bytes = await _buildPdf();
//     await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => bytes);
//   }

//   Future<Uint8List> _buildPdf() async {
//     final doc = pw.Document();
//     final double subtotal = cart.fold<double>(
//       0,
//       (sum, item) => sum + (item['price'] as double),
//     );
//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;
//     double discount = 0;
//     if (discountAmountInput > 0) {
//       discount = discountAmountInput.clamp(0, subtotal);
//     } else if (discountPercentInput > 0) {
//       discount = subtotal * (discountPercentInput / 100).clamp(0, 1);
//     }
//     final double grandTotal = (subtotal - discount).clamp(0, double.infinity);

//     doc.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (context) => pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.stretch,
//           children: [
//             pw.Text("Invoice - $activeBill",
//                 style:
//                     pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
//             pw.SizedBox(height: 12),
//             pw.Table.fromTextArray(
//               headers: const ['S.No', 'Medicine', 'Qty', 'Rate', 'Total'],
//               data: [
//                 for (int i = 0; i < cart.length; i++)
//                   [
//                     '${i + 1}',
//                     cart[i]['name'],
//                     cart[i]['qty'].toString(),
//                     (cart[i]['qty'] > 0
//                             ? ((cart[i]['price'] as double) /
//                                 (cart[i]['qty'] as int))
//                             : 0.0)
//                         .toStringAsFixed(2),
//                     (cart[i]['price'] as double).toStringAsFixed(2),
//                   ]
//               ],
//             ),
//             pw.SizedBox(height: 20),
//             pw.Text("Subtotal: Rs. ${subtotal.toStringAsFixed(2)}"),
//             pw.Text("Discount: Rs. ${discount.toStringAsFixed(2)}"),
//             pw.Text("Total: Rs. ${grandTotal.toStringAsFixed(2)}",
//                 style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//           ],
//         ),
//       ),
//     );

//     return doc.save();
//   }
// }
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class InvoiceScreen extends StatefulWidget {
//   const InvoiceScreen({super.key});

//   @override
//   State<InvoiceScreen> createState() => _InvoiceScreenState();
// }

// class _InvoiceScreenState extends State<InvoiceScreen> {
//   // Multiple bills
//   final Map<String, List<Map<String, dynamic>>> bills = {};
//   String activeBill = "Bill_1";

//   // Hive box for available stocks
//   final Box stocksBox = Hive.box('stocksBox');

//   // Controllers
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController qtyController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController customerController = TextEditingController();
//   final TextEditingController discountPercentController =
//       TextEditingController();
//   final TextEditingController discountAmountController =
//       TextEditingController();
//   final TextEditingController counterPersonController = TextEditingController();

//   final String ntnNo = '#1234677';
//   final String licenseNo = 'LIC-987654';

//   // Medicine suggestions
//   List<Map> filteredMedicines = [];

//   // Track per-tablet rate
//   double currentPerTabletRate = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     bills[activeBill] = [];
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     qtyController.dispose();
//     priceController.dispose();
//     customerController.dispose();
//     discountPercentController.dispose();
//     discountAmountController.dispose();
//     counterPersonController.dispose();
//     super.dispose();
//   }

//   List<Map<String, dynamic>> get cart => bills[activeBill] ?? [];

//   // Add medicine to cart
//   void addMedicine() {
//     final name = nameController.text.trim();
//     final int qty = int.tryParse(qtyController.text.trim()) ?? 1;

//     if (name.isEmpty) return;

//     // Search medicine in Hive stock
//     final stock = stocksBox.values.cast<Map>().firstWhere(
//           (m) =>
//               m["Medicine Name"].toString().toLowerCase() == name.toLowerCase(),
//           orElse: () => {},
//         );

//     if (stock.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Medicine not found in stock!')),
//       );
//       return;
//     }

//     // Calculate per-tablet rate
//     final int packSize = int.tryParse(stock["Tablets"].toString()) ?? 1;
//     final double packPrice =
//         double.tryParse(stock["Pack Price"].toString()) ?? 0.0;
//     currentPerTabletRate = packSize > 0 ? packPrice / packSize : 0;

//     if (currentPerTabletRate <= 0) return;

//     setState(() {
//       cart.add({
//         'name': name,
//         'qty': qty,
//         'price': currentPerTabletRate * qty, // total price
//       });

//       // Clear input fields
//       nameController.clear();
//       qtyController.clear();
//       priceController.clear();
//       currentPerTabletRate = 0.0;
//       filteredMedicines = [];
//     });
//   }

//   void _createNewBill() {
//     final newKey = "Bill_${bills.length + 1}";
//     setState(() {
//       bills[newKey] = [];
//       activeBill = newKey;
//     });
//   }

//   void _switchBill(String key) {
//     setState(() {
//       activeBill = key;
//     });
//   }

//   String _formatDateTime(DateTime dt) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double subtotal = cart.fold<double>(
//       0,
//       (sum, item) => sum + (item['price'] as double),
//     );

//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;

//     double discount = 0;
//     if (discountAmountInput > 0) {
//       discount = discountAmountInput.clamp(0, subtotal);
//     } else if (discountPercentInput > 0) {
//       discount = subtotal * (discountPercentInput / 100).clamp(0, 1);
//     }

//     final double grandTotal = (subtotal - discount).clamp(0, double.infinity);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice - $activeBill'),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _switchBill,
//             itemBuilder: (context) => bills.keys
//                 .map(
//                   (bill) => PopupMenuItem(
//                     value: bill,
//                     child: Text(bill == activeBill ? "$bill (Active)" : bill),
//                   ),
//                 )
//                 .toList(),
//           ),
//           IconButton(
//             onPressed: _createNewBill,
//             icon: const Icon(Icons.add),
//             tooltip: "New Bill",
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header bilingual
//             Row(
//               children: [
//                 const Expanded(
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Al-Shifa Medical',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: const Text(
//                         'الشفاء میڈیکل',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             Wrap(
//               spacing: 16,
//               runSpacing: 8,
//               crossAxisAlignment: WrapCrossAlignment.center,
//               children: [
//                 Text('NTN: $ntnNo'),
//                 Text('License No: $licenseNo'),
//                 SizedBox(
//                   width: 240,
//                   child: TextField(
//                     controller: customerController,
//                     decoration: const InputDecoration(
//                       labelText: 'Customer Name',
//                       isDense: true,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 Text('Print Time: ${_formatDateTime(DateTime.now())}'),
//               ],
//             ),

//             const Divider(height: 24, thickness: 1),

//             // Medicine search + auto fill
//             Row(
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: Column(
//                     children: [
//                       TextField(
//                         controller: nameController,
//                         decoration:
//                             const InputDecoration(labelText: 'Medicine'),
//                         onChanged: (value) {
//                           setState(() {
//                             if (value.isNotEmpty) {
//                               filteredMedicines = stocksBox.values
//                                   .where((stock) => stock["Medicine Name"]
//                                       .toString()
//                                       .toLowerCase()
//                                       .startsWith(value.toLowerCase()))
//                                   .cast<Map>()
//                                   .toList();
//                             } else {
//                               filteredMedicines = [];
//                             }
//                           });
//                         },
//                       ),
//                       if (filteredMedicines.isNotEmpty)
//                         Container(
//                           height: 120,
//                           color: Colors.grey[200],
//                           child: ListView.builder(
//                             itemCount: filteredMedicines.length,
//                             itemBuilder: (context, index) {
//                               final stock = filteredMedicines[index];
//                               return ListTile(
//                                 title: Text(stock["Medicine Name"]),
//                                 subtitle: Text(
//                                     "Pack: ${stock["Tablets"]} | Price: Rs. ${stock["Pack Price"]}"),
//                                 onTap: () {
//                                   setState(() {
//                                     nameController.text =
//                                         stock["Medicine Name"];
//                                     final int packSize = int.tryParse(
//                                             stock["Tablets"].toString()) ??
//                                         1;
//                                     final double packPrice = double.tryParse(
//                                             stock["Pack Price"].toString()) ??
//                                         0.0;

//                                     currentPerTabletRate =
//                                         packSize > 0 ? packPrice / packSize : 0;

//                                     qtyController.text = '1';
//                                     priceController.text =
//                                         currentPerTabletRate.toStringAsFixed(2);

//                                     filteredMedicines = [];
//                                   });
//                                 },
//                               );
//                             },
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: TextField(
//                     controller: qtyController,
//                     decoration: const InputDecoration(labelText: 'Qty'),
//                     keyboardType: TextInputType.number,
//                     onChanged: (value) {
//                       final qty = int.tryParse(value) ?? 1;
//                       setState(() {
//                         priceController.text =
//                             (currentPerTabletRate * qty).toStringAsFixed(2);
//                       });
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: TextField(
//                     controller: priceController,
//                     decoration: const InputDecoration(labelText: 'Rate'),
//                     keyboardType: TextInputType.number,
//                     readOnly: true,
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.add, color: Colors.green),
//                   onPressed: addMedicine,
//                   tooltip: 'Add to cart',
//                 ),
//               ],
//             ),

//             const SizedBox(height: 16),

//             // Table of cart
//             Expanded(
//               child: SingleChildScrollView(
//                 child: DataTable(
//                   columns: const [
//                     DataColumn(label: Text('S.No')),
//                     DataColumn(label: Text('Medicine')),
//                     DataColumn(label: Text('Qty')),
//                     DataColumn(label: Text('Rate')),
//                     DataColumn(label: Text('Total')),
//                     DataColumn(label: Icon(Icons.delete, color: Colors.red)),
//                   ],
//                   rows: [
//                     for (int i = 0; i < cart.length; i++)
//                       DataRow(
//                         cells: [
//                           DataCell(Text('${i + 1}')),
//                           DataCell(Text(cart[i]['name'].toString())),
//                           DataCell(Text(cart[i]['qty'].toString())),
//                           DataCell(Text(((cart[i]['price'] as double) /
//                                   (cart[i]['qty'] as int))
//                               .toStringAsFixed(2))),
//                           DataCell(Text(
//                               (cart[i]['price'] as double).toStringAsFixed(2))),
//                           DataCell(
//                             IconButton(
//                               icon: const Icon(Icons.delete, color: Colors.red),
//                               onPressed: () {
//                                 setState(() {
//                                   cart.removeAt(i);
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 8),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   width: 140,
//                   child: TextField(
//                     controller: discountPercentController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       labelText: 'Discount %',
//                       isDense: true,
//                     ),
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 SizedBox(
//                   width: 160,
//                   child: TextField(
//                     controller: discountAmountController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       labelText: 'Discount (Rs.)',
//                       isDense: true,
//                     ),
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 8),

//             Align(
//               alignment: Alignment.centerRight,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                   Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//                   Text(
//                     'Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 18),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             Row(
//               children: [
//                 SizedBox(
//                   width: 260,
//                   child: TextField(
//                     controller: counterPersonController,
//                     decoration: const InputDecoration(
//                       labelText: 'Counter Person Name',
//                       isDense: true,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 const Text(
//                   'THANK YOU FOR SHOPPING',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 12),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _printOrSharePdf,
//                   icon: const Icon(Icons.print),
//                   label: const Text('Print / Download Invoice'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _printOrSharePdf() async {
//     final bytes = await _buildPdf();
//     await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => bytes);
//   }

//   Future<Uint8List> _buildPdf() async {
//     final doc = pw.Document();
//     final double subtotal = cart.fold<double>(
//       0,
//       (sum, item) => sum + (item['price'] as double),
//     );
//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;
//     double discount = 0;
//     if (discountAmountInput > 0) {
//       discount = discountAmountInput.clamp(0, subtotal);
//     } else if (discountPercentInput > 0) {
//       discount = subtotal * (discountPercentInput / 100).clamp(0, 1);
//     }
//     final double grandTotal = (subtotal - discount).clamp(0, double.infinity);

//     doc.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (context) => pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.stretch,
//           children: [
//             pw.Text("Invoice - $activeBill",
//                 style:
//                     pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
//             pw.SizedBox(height: 12),
//             pw.Table.fromTextArray(
//               headers: const ['S.No', 'Medicine', 'Qty', 'Rate', 'Total'],
//               data: [
//                 for (int i = 0; i < cart.length; i++)
//                   [
//                     '${i + 1}',
//                     cart[i]['name'],
//                     cart[i]['qty'].toString(),
//                     ((cart[i]['price'] as double) / (cart[i]['qty'] as int))
//                         .toStringAsFixed(2),
//                     (cart[i]['price'] as double).toStringAsFixed(2),
//                   ]
//               ],
//             ),
//             pw.SizedBox(height: 20),
//             pw.Text("Subtotal: Rs. ${subtotal.toStringAsFixed(2)}"),
//             pw.Text("Discount: Rs. ${discount.toStringAsFixed(2)}"),
//             pw.Text("Total: Rs. ${grandTotal.toStringAsFixed(2)}",
//                 style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//           ],
//         ),
//       ),
//     );

//     return doc.save();
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:blue_thermal_printer/blue_thermal_printer.dart'; // ✅ Added for thermal printing

// class InvoiceScreen extends StatefulWidget {
//   const InvoiceScreen({super.key});

//   @override
//   State<InvoiceScreen> createState() => _InvoiceScreenState();
// }

// class _InvoiceScreenState extends State<InvoiceScreen> {
//   // Multiple bills
//   final Map<String, List<Map<String, dynamic>>> bills = {};
//   String activeBill = "Bill_1";

//   // Hive box for available stocks
//   final Box stocksBox = Hive.box('stocksBox');

//   // Controllers
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController qtyController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController customerController = TextEditingController();
//   final TextEditingController discountPercentController =
//       TextEditingController();
//   final TextEditingController discountAmountController =
//       TextEditingController();
//   final TextEditingController counterPersonController = TextEditingController();

//   final String ntnNo = '#1234677';
//   final String licenseNo = 'LIC-987654';

//   // Medicine suggestions
//   List<Map> filteredMedicines = [];

//   // Track per-tablet rate
//   double currentPerTabletRate =
//       0.0; // ✅ Changed: track rate for thermal printer

//   // Thermal printer instance
//   final BlueThermalPrinter printer = BlueThermalPrinter.instance; // ✅ Added

//   @override
//   void initState() {
//     super.initState();
//     bills[activeBill] = [];
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     qtyController.dispose();
//     priceController.dispose();
//     customerController.dispose();
//     discountPercentController.dispose();
//     discountAmountController.dispose();
//     counterPersonController.dispose();
//     super.dispose();
//   }

//   List<Map<String, dynamic>> get cart => bills[activeBill] ?? [];

//   // Add medicine to cart
//   void addMedicine() {
//     final name = nameController.text.trim();
//     final int qty = int.tryParse(qtyController.text.trim()) ?? 1;

//     if (name.isEmpty) return;

//     // Search medicine in Hive stock
//     final stock = stocksBox.values.cast<Map>().firstWhere(
//           (m) =>
//               m["Medicine Name"].toString().toLowerCase() == name.toLowerCase(),
//           orElse: () => {},
//         );

//     if (stock.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Medicine not found in stock!')),
//       );
//       return;
//     }

//     // Calculate per-tablet rate
//     final int packSize = int.tryParse(stock["Tablets"].toString()) ?? 1;
//     final double packPrice =
//         double.tryParse(stock["Pack Price"].toString()) ?? 0.0;
//     currentPerTabletRate = packSize > 0 ? packPrice / packSize : 0;

//     if (currentPerTabletRate <= 0) return;

//     setState(() {
//       cart.add({
//         'name': name,
//         'qty': qty,
//         'price': currentPerTabletRate * qty, // total price
//       });

//       // Clear input fields
//       nameController.clear();
//       qtyController.clear();
//       priceController.clear();
//       currentPerTabletRate = 0.0;
//       filteredMedicines = [];
//     });
//   }

//   void _createNewBill() {
//     final newKey = "Bill_${bills.length + 1}";
//     setState(() {
//       bills[newKey] = [];
//       activeBill = newKey;
//     });
//   }

//   void _switchBill(String key) {
//     setState(() {
//       activeBill = key;
//     });
//   }

//   String _formatDateTime(DateTime dt) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
//   }

//   double get subtotal =>
//       cart.fold<double>(0, (sum, item) => sum + (item['price'] as double));

//   double get discount {
//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;

//     if (discountAmountInput > 0) {
//       return discountAmountInput.clamp(0, subtotal);
//     } else if (discountPercentInput > 0) {
//       return subtotal * (discountPercentInput / 100).clamp(0, 1);
//     }
//     return 0;
//   }

//   double get grandTotal => (subtotal - discount).clamp(0, double.infinity);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice - $activeBill'),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _switchBill,
//             itemBuilder: (context) => bills.keys
//                 .map(
//                   (bill) => PopupMenuItem(
//                     value: bill,
//                     child: Text(bill == activeBill ? "$bill (Active)" : bill),
//                   ),
//                 )
//                 .toList(),
//           ),
//           IconButton(
//             onPressed: _createNewBill,
//             icon: const Icon(Icons.add),
//             tooltip: "New Bill",
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header bilingual
//             Row(
//               children: [
//                 const Expanded(
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Al-Shifa Medical',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: const Text(
//                         'الشفاء میڈیکل',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             Wrap(
//               spacing: 16,
//               runSpacing: 8,
//               crossAxisAlignment: WrapCrossAlignment.center,
//               children: [
//                 Text('NTN: $ntnNo'),
//                 Text('License No: $licenseNo'),
//                 SizedBox(
//                   width: 240,
//                   child: TextField(
//                     controller: customerController,
//                     decoration: const InputDecoration(
//                       labelText: 'Customer Name',
//                       isDense: true,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 Text('Print Time: ${_formatDateTime(DateTime.now())}'),
//               ],
//             ),

//             const Divider(height: 24, thickness: 1),

//             // Medicine search + auto fill
//             Row(
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: Column(
//                     children: [
//                       TextField(
//                         controller: nameController,
//                         decoration:
//                             const InputDecoration(labelText: 'Medicine'),
//                         onChanged: (value) {
//                           setState(() {
//                             if (value.isNotEmpty) {
//                               filteredMedicines = stocksBox.values
//                                   .where((stock) => stock["Medicine Name"]
//                                       .toString()
//                                       .toLowerCase()
//                                       .startsWith(value.toLowerCase()))
//                                   .cast<Map>()
//                                   .toList();
//                             } else {
//                               filteredMedicines = [];
//                             }
//                           });
//                         },
//                       ),
//                       if (filteredMedicines.isNotEmpty)
//                         Container(
//                           height: 120,
//                           color: Colors.grey[200],
//                           child: ListView.builder(
//                             itemCount: filteredMedicines.length,
//                             itemBuilder: (context, index) {
//                               final stock = filteredMedicines[index];
//                               return ListTile(
//                                 title: Text(stock["Medicine Name"]),
//                                 subtitle: Text(
//                                     "Pack: ${stock["Tablets"]} | Price: Rs. ${stock["Pack Price"]}"),
//                                 onTap: () {
//                                   setState(() {
//                                     nameController.text =
//                                         stock["Medicine Name"];
//                                     final int packSize = int.tryParse(
//                                             stock["Tablets"].toString()) ??
//                                         1;
//                                     final double packPrice = double.tryParse(
//                                             stock["Pack Price"].toString()) ??
//                                         0.0;

//                                     currentPerTabletRate =
//                                         packSize > 0 ? packPrice / packSize : 0;

//                                     qtyController.text = '1';
//                                     priceController.text =
//                                         currentPerTabletRate.toStringAsFixed(2);

//                                     filteredMedicines = [];
//                                   });
//                                 },
//                               );
//                             },
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: TextField(
//                     controller: qtyController,
//                     decoration: const InputDecoration(labelText: 'Qty'),
//                     keyboardType: TextInputType.number,
//                     onChanged: (value) {
//                       final qty = int.tryParse(value) ?? 1;
//                       setState(() {
//                         priceController.text =
//                             (currentPerTabletRate * qty).toStringAsFixed(2);
//                       });
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: TextField(
//                     controller: priceController,
//                     decoration: const InputDecoration(labelText: 'Rate'),
//                     keyboardType: TextInputType.number,
//                     readOnly: true,
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.add, color: Colors.green),
//                   onPressed: addMedicine,
//                   tooltip: 'Add to cart',
//                 ),
//               ],
//             ),

//             const SizedBox(height: 16),

//             // Table of cart
//             Expanded(
//               child: SingleChildScrollView(
//                 child: DataTable(
//                   columns: const [
//                     DataColumn(label: Text('S.No')),
//                     DataColumn(label: Text('Medicine')),
//                     DataColumn(label: Text('Qty')),
//                     DataColumn(label: Text('Rate')),
//                     DataColumn(label: Text('Total')),
//                     DataColumn(label: Icon(Icons.delete, color: Colors.red)),
//                   ],
//                   rows: [
//                     for (int i = 0; i < cart.length; i++)
//                       DataRow(
//                         cells: [
//                           DataCell(Text('${i + 1}')),
//                           DataCell(Text(cart[i]['name'].toString())),
//                           DataCell(Text(cart[i]['qty'].toString())),
//                           DataCell(Text(((cart[i]['price'] as double) /
//                                   (cart[i]['qty'] as int))
//                               .toStringAsFixed(2))),
//                           DataCell(Text(
//                               (cart[i]['price'] as double).toStringAsFixed(2))),
//                           DataCell(
//                             IconButton(
//                               icon: const Icon(Icons.delete, color: Colors.red),
//                               onPressed: () {
//                                 setState(() {
//                                   cart.removeAt(i);
//                                 });
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 8),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   width: 140,
//                   child: TextField(
//                     controller: discountPercentController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       labelText: 'Discount %',
//                       isDense: true,
//                     ),
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 SizedBox(
//                   width: 160,
//                   child: TextField(
//                     controller: discountAmountController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       labelText: 'Discount (Rs.)',
//                       isDense: true,
//                     ),
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 8),

//             Align(
//               alignment: Alignment.centerRight,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                   Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//                   Text(
//                     'Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 18),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             Row(
//               children: [
//                 SizedBox(
//                   width: 260,
//                   child: TextField(
//                     controller: counterPersonController,
//                     decoration: const InputDecoration(
//                       labelText: 'Counter Person Name',
//                       isDense: true,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 const Text(
//                   'THANK YOU FOR SHOPPING',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 12),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _printThermalInvoice,
//                   icon: const Icon(Icons.print),
//                   label: const Text('Print Invoice (Thermal)'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // 🔹 Important: Thermal printing function
//   Future<void> _printThermalInvoice() async {
//     bool isConnected = await printer.isConnected ?? false;

//     if (!isConnected) {
//       List<BluetoothDevice> devices = await printer.getBondedDevices();
//       if (devices.isNotEmpty) {
//         await printer.connect(devices.first); // connect to first paired printer
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('No Bluetooth printer found!')));
//         return;
//       }
//     }

//     printer.printNewLine();
//     printer.printCustom("AL-SHIFA MEDICAL", 2, 1);
//     printer.printCustom("Invoice - $activeBill", 1, 1);
//     printer.printNewLine();
//     printer.printCustom(
//         "Customer: ${customerController.text}", 1, 0); // 🔹 Added
//     printer.printCustom(
//         "Counter: ${counterPersonController.text}", 1, 0); // 🔹 Added
//     printer.printNewLine();

//     for (var i = 0; i < cart.length; i++) {
//       final item = cart[i];
//       printer.printLeftRight(
//           "${item['name']} x${item['qty']}",
//           "Rs.${((item['price'] as double) / (item['qty'] as int)).toStringAsFixed(2)}",
//           1);
//     }

//     printer.printNewLine();
//     printer.printLeftRight("Subtotal", "Rs.${subtotal.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Discount", "Rs.${discount.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Total", "Rs.${grandTotal.toStringAsFixed(2)}", 2);

//     printer.printNewLine();
//     printer.printCustom("THANK YOU FOR SHOPPING", 1, 1);
//     printer.printNewLine();
//     printer.paperCut();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:blue_thermal_printer/blue_thermal_printer.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class InvoiceScreen extends StatefulWidget {
//   const InvoiceScreen({super.key});

//   @override
//   State<InvoiceScreen> createState() => _InvoiceScreenState();
// }

// class _InvoiceScreenState extends State<InvoiceScreen> {
//   final Map<String, List<Map<String, dynamic>>> bills = {};
//   String activeBill = "Bill_1";

//   final Box availableBox = Hive.box('availableBox');
//   final Box viewsalesBox = Hive.box('viewsalesBox');

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController qtyController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController customerController = TextEditingController();
//   final TextEditingController discountPercentController =
//       TextEditingController();
//   final TextEditingController discountAmountController =
//       TextEditingController();
//   final TextEditingController counterPersonController = TextEditingController();

//   final String ntnNo = '#1234677';
//   final String licenseNo = 'LIC-987654';

//   List<Map> filteredMedicines = [];
//   double currentPerTabletRate = 0.0;

//   final BlueThermalPrinter printer = BlueThermalPrinter.instance;

//   @override
//   void initState() {
//     super.initState();
//     bills[activeBill] = [];
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     qtyController.dispose();
//     priceController.dispose();
//     customerController.dispose();
//     discountPercentController.dispose();
//     discountAmountController.dispose();
//     counterPersonController.dispose();
//     super.dispose();
//   }

//   List<Map<String, dynamic>> get cart => bills[activeBill] ?? [];

//   void addMedicine() {
//     final name = nameController.text.trim();
//     final int qty = int.tryParse(qtyController.text.trim()) ?? 1;
//     if (name.isEmpty) return;

//     final stock = availableBox.values.cast<Map>().firstWhere(
//           (m) =>
//               m["Medicine Name"].toString().toLowerCase() == name.toLowerCase(),
//           orElse: () => {},
//         );

//     if (stock.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Medicine not found in stock!')));
//       return;
//     }

//     final int packSize = int.tryParse(stock["Tablets"].toString()) ?? 1;
//     final double packPrice =
//         double.tryParse(stock["Pack Price"].toString()) ?? 0.0;
//     currentPerTabletRate = packSize > 0 ? packPrice / packSize : 0;
//     if (currentPerTabletRate <= 0) return;

//     setState(() {
//       cart.add({
//         'name': name,
//         'qty': qty,
//         'price': currentPerTabletRate * qty,
//       });
//       nameController.clear();
//       qtyController.clear();
//       priceController.clear();
//       currentPerTabletRate = 0.0;
//       filteredMedicines = [];
//     });
//   }

//   void _createNewBill() {
//     final newKey = "Bill_${bills.length + 1}";
//     setState(() {
//       bills[newKey] = [];
//       activeBill = newKey;
//     });
//   }

//   void _switchBill(String key) {
//     setState(() {
//       activeBill = key;
//     });
//   }

//   double get subtotal =>
//       cart.fold<double>(0, (sum, item) => sum + (item['price'] as double));

//   double get discount {
//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;

//     if (discountAmountInput > 0) return discountAmountInput.clamp(0, subtotal);
//     if (discountPercentInput > 0)
//       return subtotal * (discountPercentInput / 100).clamp(0, 1);
//     return 0;
//   }

//   double get grandTotal => (subtotal - discount).clamp(0, double.infinity);

//   String _formatDateTime(DateTime dt) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice - $activeBill'),
//         centerTitle: true,
//         backgroundColor: Color(0xFF008000),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _switchBill,
//             itemBuilder: (context) => bills.keys
//                 .map((bill) => PopupMenuItem(
//                       value: bill,
//                       child: Text(bill == activeBill ? "$bill (Active)" : bill),
//                     ))
//                 .toList(),
//           ),
//           IconButton(
//               onPressed: _createNewBill,
//               icon: const Icon(Icons.add),
//               tooltip: "New Bill"),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Header and customer input
//             Row(
//               children: [
//                 const Expanded(
//                     child: Text('Al-Shifa Medical',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold))),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: const Text('الشفاء میڈیکل',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Wrap(
//               spacing: 16,
//               children: [
//                 Text('NTN: $ntnNo'),
//                 Text('License No: $licenseNo'),
//                 SizedBox(
//                     width: 240,
//                     child: TextField(
//                         controller: customerController,
//                         decoration: const InputDecoration(
//                             labelText: 'Customer Name', isDense: true))),
//                 Text('Print Time: ${_formatDateTime(DateTime.now())}'),
//               ],
//             ),
//             const Divider(height: 24, thickness: 1),

//             // Medicine Input Row
//             Row(
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: Column(
//                     children: [
//                       TextField(
//                         controller: nameController,
//                         decoration:
//                             const InputDecoration(labelText: 'Medicine'),
//                         onChanged: (value) {
//                           setState(() {
//                             filteredMedicines = value.isEmpty
//                                 ? []
//                                 : availableBox.values
//                                     .where((stock) => stock["Medicine Name"]
//                                         .toString()
//                                         .toLowerCase()
//                                         .startsWith(value.toLowerCase()))
//                                     .cast<Map>()
//                                     .toList();
//                           });
//                         },
//                       ),
//                       if (filteredMedicines.isNotEmpty)
//                         Container(
//                           height: 120,
//                           color: Colors.grey[200],
//                           child: ListView.builder(
//                             itemCount: filteredMedicines.length,
//                             itemBuilder: (context, index) {
//                               final stock = filteredMedicines[index];
//                               return ListTile(
//                                 title: Text(stock["Medicine Name"]),
//                                 subtitle: Text(
//                                     "Pack: ${stock["Tablets"]} | Price: Rs. ${stock["Pack Price"]}"),
//                                 onTap: () {
//                                   setState(() {
//                                     nameController.text =
//                                         stock["Medicine Name"];
//                                     final int packSize = int.tryParse(
//                                             stock["Tablets"].toString()) ??
//                                         1;
//                                     final double packPrice = double.tryParse(
//                                             stock["Pack Price"].toString()) ??
//                                         0.0;
//                                     currentPerTabletRate =
//                                         packSize > 0 ? packPrice / packSize : 0;
//                                     qtyController.text = '1';
//                                     priceController.text =
//                                         currentPerTabletRate.toStringAsFixed(2);
//                                     filteredMedicines = [];
//                                   });
//                                 },
//                               );
//                             },
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                     flex: 1,
//                     child: TextField(
//                         controller: qtyController,
//                         decoration: const InputDecoration(labelText: 'Qty'),
//                         keyboardType: TextInputType.number,
//                         onChanged: (value) {
//                           final qty = int.tryParse(value) ?? 1;
//                           setState(() {
//                             priceController.text =
//                                 (currentPerTabletRate * qty).toStringAsFixed(2);
//                           });
//                         })),
//                 const SizedBox(width: 10),
//                 Expanded(
//                     flex: 1,
//                     child: TextField(
//                         controller: priceController,
//                         decoration: const InputDecoration(labelText: 'Rate'),
//                         readOnly: true)),
//                 IconButton(
//                     icon: const Icon(Icons.add, color: Colors.green),
//                     onPressed: addMedicine,
//                     tooltip: 'Add to cart'),
//               ],
//             ),
//             const SizedBox(height: 16),

//             // Cart Table
//             Expanded(
//               child: SingleChildScrollView(
//                 child: DataTable(
//                   columns: const [
//                     DataColumn(label: Text('S.No')),
//                     DataColumn(label: Text('Medicine')),
//                     DataColumn(label: Text('Qty')),
//                     DataColumn(label: Text('Rate')),
//                     DataColumn(label: Text('Total')),
//                     DataColumn(label: Icon(Icons.delete, color: Colors.red)),
//                   ],
//                   rows: [
//                     for (int i = 0; i < cart.length; i++)
//                       DataRow(cells: [
//                         DataCell(Text('${i + 1}')),
//                         DataCell(Text(cart[i]['name'].toString())),
//                         DataCell(Text(cart[i]['qty'].toString())),
//                         DataCell(Text(((cart[i]['price'] as double) /
//                                 (cart[i]['qty'] as int))
//                             .toStringAsFixed(2))),
//                         DataCell(Text(
//                             (cart[i]['price'] as double).toStringAsFixed(2))),
//                         DataCell(IconButton(
//                             icon: const Icon(Icons.delete, color: Colors.red),
//                             onPressed: () {
//                               setState(() {
//                                 cart.removeAt(i);
//                               });
//                             })),
//                       ])
//                   ],
//                 ),
//               ),
//             ),

//             // Discount and totals
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SizedBox(
//                     width: 140,
//                     child: TextField(
//                         controller: discountPercentController,
//                         keyboardType: TextInputType.number,
//                         decoration: const InputDecoration(
//                             labelText: 'Discount %', isDense: true),
//                         onChanged: (_) => setState(() {}))),
//                 const SizedBox(width: 8),
//                 SizedBox(
//                     width: 160,
//                     child: TextField(
//                         controller: discountAmountController,
//                         keyboardType: TextInputType.number,
//                         decoration: const InputDecoration(
//                             labelText: 'Discount (Rs.)', isDense: true),
//                         onChanged: (_) => setState(() {}))),
//               ],
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                   Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//                   Text('Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 18)),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),
//             Row(
//               children: [
//                 SizedBox(
//                     width: 260,
//                     child: TextField(
//                         controller: counterPersonController,
//                         decoration: const InputDecoration(
//                             labelText: 'Counter Person Name',
//                             isDense: true,
//                             border: OutlineInputBorder()))),
//                 const Spacer(),
//                 const Text('THANK YOU FOR SHOPPING',
//                     style:
//                         TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _printThermalInvoice,
//                   icon: const Icon(Icons.print),
//                   label: const Text('Print Invoice (Thermal)'),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _generatePdfInvoice,
//                   icon: const Icon(Icons.picture_as_pdf),
//                   label: const Text('Generate PDF'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _printThermalInvoice() async {
//     bool isConnected = await printer.isConnected ?? false;
//     if (!isConnected) {
//       List<BluetoothDevice> devices = await printer.getBondedDevices();
//       if (devices.isNotEmpty)
//         await printer.connect(devices.first);
//       else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('No Bluetooth printer found!')));
//         return;
//       }
//     }

//     printer.printNewLine();
//     printer.printCustom("AL-SHIFA MEDICAL", 2, 1);
//     printer.printCustom("Invoice - $activeBill", 1, 1);
//     printer.printNewLine();
//     printer.printCustom("Customer: ${customerController.text}", 1, 0);
//     printer.printCustom("Counter: ${counterPersonController.text}", 1, 0);
//     printer.printNewLine();

//     for (var item in cart) {
//       printer.printLeftRight(
//           "${item['name']} x${item['qty']}",
//           "Rs.${((item['price'] as double) / (item['qty'] as int)).toStringAsFixed(2)}",
//           1);
//     }

//     printer.printNewLine();
//     printer.printLeftRight("Subtotal", "Rs.${subtotal.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Discount", "Rs.${discount.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Total", "Rs.${grandTotal.toStringAsFixed(2)}", 2);
//     printer.printNewLine();
//     printer.printCustom("THANK YOU FOR SHOPPING", 1, 1);
//     printer.printNewLine();
//     printer.paperCut();

//     viewsalesBox.add({
//       'billNo': activeBill,
//       'customer': customerController.text,
//       'counterPerson': counterPersonController.text,
//       'date': DateTime.now().toString(),
//       'items': cart,
//       'subtotal': subtotal,
//       'discount': discount,
//       'grandTotal': grandTotal,
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Invoice saved to sales history!')));
//   }

//   Future<void> _generatePdfInvoice() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         build: (context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text('AL-SHIFA MEDICAL',
//                   style: pw.TextStyle(
//                       fontSize: 24, fontWeight: pw.FontWeight.bold)),
//               pw.Text('Invoice - $activeBill',
//                   style: pw.TextStyle(fontSize: 18)),
//               pw.SizedBox(height: 10),
//               pw.Text('Customer: ${customerController.text}'),
//               pw.Text('Counter: ${counterPersonController.text}'),
//               pw.Text('Date: ${_formatDateTime(DateTime.now())}'),
//               pw.SizedBox(height: 10),
//               pw.Table.fromTextArray(
//                 headers: ['S.No', 'Medicine', 'Qty', 'Rate', 'Total'],
//                 data: List.generate(cart.length, (index) {
//                   final item = cart[index];
//                   return [
//                     '${index + 1}',
//                     item['name'],
//                     item['qty'].toString(),
//                     ((item['price'] as double) / (item['qty'] as int))
//                         .toStringAsFixed(2),
//                     (item['price'] as double).toStringAsFixed(2),
//                   ];
//                 }),
//               ),
//               pw.SizedBox(height: 10),
//               pw.Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//               pw.Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//               pw.Text('Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                   style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 20),
//               pw.Center(
//                   child: pw.Text('THANK YOU FOR SHOPPING',
//                       style: pw.TextStyle(
//                           fontSize: 16, fontWeight: pw.FontWeight.bold))),
//             ],
//           );
//         },
//       ),
//     );

//     await Printing.layoutPdf(onLayout: (format) async => pdf.save());
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:blue_thermal_printer/blue_thermal_printer.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:flutter/services.dart';

// class InvoiceScreen extends StatefulWidget {
//   const InvoiceScreen({super.key});

//   @override
//   State<InvoiceScreen> createState() => _InvoiceScreenState();
// }

// class _InvoiceScreenState extends State<InvoiceScreen> {
//   final Map<String, List<Map<String, dynamic>>> bills = {};
//   String activeBill = "Bill_1";

//   final Box availableBox = Hive.box('availableBox');
//   final Box viewsalesBox = Hive.box('viewsalesBox');

//   // Controllers
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController qtyController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController customerController = TextEditingController();
//   final TextEditingController discountPercentController =
//       TextEditingController();
//   final TextEditingController discountAmountController =
//       TextEditingController();
//   final TextEditingController counterPersonController = TextEditingController();

//   // Focus nodes for keyboard navigation
//   final FocusNode customerFocus = FocusNode();
//   final FocusNode nameFocus = FocusNode();
//   final FocusNode qtyFocus = FocusNode();
//   final FocusNode priceFocus = FocusNode();
//   final FocusNode discountPercentFocus = FocusNode();
//   final FocusNode discountAmountFocus = FocusNode();
//   final FocusNode counterPersonFocus = FocusNode();

//   final String ntnNo = '#1234677';
//   final String licenseNo = 'LIC-987654';

//   List<Map> filteredMedicines = [];
//   double currentPerTabletRate = 0.0;

//   final BlueThermalPrinter printer = BlueThermalPrinter.instance;

//   @override
//   void initState() {
//     super.initState();
//     bills[activeBill] = [];
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     qtyController.dispose();
//     priceController.dispose();
//     customerController.dispose();
//     discountPercentController.dispose();
//     discountAmountController.dispose();
//     counterPersonController.dispose();
//     customerFocus.dispose();
//     nameFocus.dispose();
//     qtyFocus.dispose();
//     priceFocus.dispose();
//     discountPercentFocus.dispose();
//     discountAmountFocus.dispose();
//     counterPersonFocus.dispose();
//     super.dispose();
//   }

//   List<Map<String, dynamic>> get cart => bills[activeBill] ?? [];

//   void addMedicine() {
//     final name = nameController.text.trim();
//     final int qty = int.tryParse(qtyController.text.trim()) ?? 1;
//     if (name.isEmpty) return;

//     final stock = availableBox.values.cast<Map>().firstWhere(
//           (m) =>
//               m["Medicine Name"].toString().toLowerCase() == name.toLowerCase(),
//           orElse: () => {},
//         );

//     if (stock.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Medicine not found in stock!')));
//       return;
//     }

//     final int packSize = int.tryParse(stock["Tablets"].toString()) ?? 1;
//     final double packPrice =
//         double.tryParse(stock["Pack Price"].toString()) ?? 0.0;
//     currentPerTabletRate = packSize > 0 ? packPrice / packSize : 0;
//     if (currentPerTabletRate <= 0) return;

//     setState(() {
//       cart.add({
//         'name': name,
//         'qty': qty,
//         'price': currentPerTabletRate * qty,
//       });
//       nameController.clear();
//       qtyController.clear();
//       priceController.clear();
//       currentPerTabletRate = 0.0;
//       filteredMedicines = [];
//       FocusScope.of(context).requestFocus(nameFocus); // back to medicine field
//     });
//   }

//   void _createNewBill() {
//     final newKey = "Bill_${bills.length + 1}";
//     setState(() {
//       bills[newKey] = [];
//       activeBill = newKey;
//     });
//   }

//   void _switchBill(String key) {
//     setState(() {
//       activeBill = key;
//     });
//   }

//   double get subtotal =>
//       cart.fold<double>(0, (sum, item) => sum + (item['price'] as double));

//   double get discount {
//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;

//     if (discountAmountInput > 0) return discountAmountInput.clamp(0, subtotal);
//     if (discountPercentInput > 0)
//       return subtotal * (discountPercentInput / 100).clamp(0, 1);
//     return 0;
//   }

//   double get grandTotal => (subtotal - discount).clamp(0, double.infinity);

//   String _formatDateTime(DateTime dt) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
//   }

//   Widget _keyboardTextField({
//     required TextEditingController controller,
//     required FocusNode focusNode,
//     FocusNode? nextFocus,
//     String? label,
//     bool readOnly = false,
//     TextInputType keyboardType = TextInputType.text,
//     void Function(String)? onChanged,
//     void Function()? onEnter,
//   }) {
//     return RawKeyboardListener(
//       focusNode: FocusNode(), // dummy node for keyboard events
//       onKey: (event) {
//         if (event is RawKeyDownEvent) {
//           if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
//               nextFocus != null) {
//             FocusScope.of(context).requestFocus(nextFocus);
//           } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
//             FocusScope.of(context).previousFocus();
//           } else if (event.logicalKey == LogicalKeyboardKey.enter) {
//             if (onEnter != null) onEnter();
//           }
//         }
//       },
//       child: TextField(
//         controller: controller,
//         focusNode: focusNode,
//         readOnly: readOnly,
//         keyboardType: keyboardType,
//         decoration: InputDecoration(labelText: label, isDense: true),
//         onChanged: onChanged,
//         onSubmitted: (_) {
//           if (onEnter != null) onEnter();
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice - $activeBill'),
//         centerTitle: true,
//         backgroundColor: Color(0xFF008000),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _switchBill,
//             itemBuilder: (context) => bills.keys
//                 .map((bill) => PopupMenuItem(
//                       value: bill,
//                       child: Text(bill == activeBill ? "$bill (Active)" : bill),
//                     ))
//                 .toList(),
//           ),
//           IconButton(
//               onPressed: _createNewBill,
//               icon: const Icon(Icons.add),
//               tooltip: "New Bill"),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Header
//             Row(
//               children: [
//                 const Expanded(
//                     child: Text('Al-Shifa Medical',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold))),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: const Text('الشفاء میڈیکل',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Wrap(
//               spacing: 16,
//               children: [
//                 Text('NTN: $ntnNo'),
//                 Text('License No: $licenseNo'),
//                 SizedBox(
//                   width: 240,
//                   child: _keyboardTextField(
//                     controller: customerController,
//                     focusNode: customerFocus,
//                     nextFocus: nameFocus,
//                     label: 'Customer Name',
//                   ),
//                 ),
//                 Text('Print Time: ${_formatDateTime(DateTime.now())}'),
//               ],
//             ),
//             const Divider(height: 24, thickness: 1),

//             // Medicine input row
//             Row(
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: Column(
//                     children: [
//                       _keyboardTextField(
//                         controller: nameController,
//                         focusNode: nameFocus,
//                         nextFocus: qtyFocus,
//                         label: 'Medicine',
//                         onChanged: (value) {
//                           setState(() {
//                             filteredMedicines = value.isEmpty
//                                 ? []
//                                 : availableBox.values
//                                     .where((stock) => stock["Medicine Name"]
//                                         .toString()
//                                         .toLowerCase()
//                                         .startsWith(value.toLowerCase()))
//                                     .cast<Map>()
//                                     .toList();
//                           });
//                         },
//                         onEnter: () =>
//                             FocusScope.of(context).requestFocus(qtyFocus),
//                       ),
//                       if (filteredMedicines.isNotEmpty)
//                         Container(
//                           height: 120,
//                           color: Colors.grey[200],
//                           child: ListView.builder(
//                             itemCount: filteredMedicines.length,
//                             itemBuilder: (context, index) {
//                               final stock = filteredMedicines[index];
//                               return ListTile(
//                                 title: Text(stock["Medicine Name"]),
//                                 subtitle: Text(
//                                     "Pack: ${stock["Tablets"]} | Price: Rs. ${stock["Pack Price"]}"),
//                                 onTap: () {
//                                   setState(() {
//                                     nameController.text =
//                                         stock["Medicine Name"];
//                                     final int packSize = int.tryParse(
//                                             stock["Tablets"].toString()) ??
//                                         1;
//                                     final double packPrice = double.tryParse(
//                                             stock["Pack Price"].toString()) ??
//                                         0.0;
//                                     currentPerTabletRate =
//                                         packSize > 0 ? packPrice / packSize : 0;
//                                     qtyController.text = '1';
//                                     priceController.text =
//                                         currentPerTabletRate.toStringAsFixed(2);
//                                     filteredMedicines = [];
//                                     FocusScope.of(context)
//                                         .requestFocus(qtyFocus);
//                                   });
//                                 },
//                               );
//                             },
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: _keyboardTextField(
//                     controller: qtyController,
//                     focusNode: qtyFocus,
//                     nextFocus: priceFocus,
//                     label: 'Qty',
//                     keyboardType: TextInputType.number,
//                     onChanged: (value) {
//                       final qty = int.tryParse(value) ?? 1;
//                       setState(() {
//                         priceController.text =
//                             (currentPerTabletRate * qty).toStringAsFixed(2);
//                       });
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: _keyboardTextField(
//                     controller: priceController,
//                     focusNode: priceFocus,
//                     readOnly: true,
//                     onEnter: addMedicine,
//                     label: 'Rate',
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.add, color: Colors.green),
//                   onPressed: addMedicine,
//                   tooltip: 'Add to cart',
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),

//             // Cart Table
//             Expanded(
//               child: SingleChildScrollView(
//                 child: DataTable(
//                   columns: const [
//                     DataColumn(label: Text('S.No')),
//                     DataColumn(label: Text('Medicine')),
//                     DataColumn(label: Text('Qty')),
//                     DataColumn(label: Text('Rate')),
//                     DataColumn(label: Text('Total')),
//                     DataColumn(label: Icon(Icons.delete, color: Colors.red)),
//                   ],
//                   rows: [
//                     for (int i = 0; i < cart.length; i++)
//                       DataRow(cells: [
//                         DataCell(Text('${i + 1}')),
//                         DataCell(Text(cart[i]['name'].toString())),
//                         DataCell(Text(cart[i]['qty'].toString())),
//                         DataCell(Text(((cart[i]['price'] as double) /
//                                 (cart[i]['qty'] as int))
//                             .toStringAsFixed(2))),
//                         DataCell(Text(
//                             (cart[i]['price'] as double).toStringAsFixed(2))),
//                         DataCell(IconButton(
//                             icon: const Icon(Icons.delete, color: Colors.red),
//                             onPressed: () {
//                               setState(() {
//                                 cart.removeAt(i);
//                               });
//                             })),
//                       ])
//                   ],
//                 ),
//               ),
//             ),

//             // Discounts & totals
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   width: 140,
//                   child: _keyboardTextField(
//                     controller: discountPercentController,
//                     focusNode: discountPercentFocus,
//                     nextFocus: discountAmountFocus,
//                     label: 'Discount %',
//                     keyboardType: TextInputType.number,
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 SizedBox(
//                   width: 160,
//                   child: _keyboardTextField(
//                     controller: discountAmountController,
//                     focusNode: discountAmountFocus,
//                     nextFocus: counterPersonFocus,
//                     label: 'Discount (Rs.)',
//                     keyboardType: TextInputType.number,
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//               ],
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                   Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//                   Text('Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 18)),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),
//             Row(
//               children: [
//                 SizedBox(
//                   width: 260,
//                   child: _keyboardTextField(
//                     controller: counterPersonController,
//                     focusNode: counterPersonFocus,
//                     nextFocus: nameFocus, // loop back to medicine
//                     label: 'Counter Person Name',
//                   ),
//                 ),
//                 const Spacer(),
//                 const Text('THANK YOU FOR SHOPPING',
//                     style:
//                         TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _printThermalInvoice,
//                   icon: const Icon(Icons.print),
//                   label: const Text('Print Invoice (Thermal)'),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _generatePdfInvoice,
//                   icon: const Icon(Icons.picture_as_pdf),
//                   label: const Text('Generate PDF'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _printThermalInvoice() async {
//     bool isConnected = await printer.isConnected ?? false;
//     if (!isConnected) {
//       List<BluetoothDevice> devices = await printer.getBondedDevices();
//       if (devices.isNotEmpty)
//         await printer.connect(devices.first);
//       else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('No Bluetooth printer found!')));
//         return;
//       }
//     }

//     printer.printNewLine();
//     printer.printCustom("AL-SHIFA MEDICAL", 2, 1);
//     printer.printCustom("Invoice - $activeBill", 1, 1);
//     printer.printNewLine();
//     printer.printCustom("Customer: ${customerController.text}", 1, 0);
//     printer.printCustom("Counter: ${counterPersonController.text}", 1, 0);
//     printer.printNewLine();

//     for (var item in cart) {
//       printer.printLeftRight(
//           "${item['name']} x${item['qty']}",
//           "Rs.${((item['price'] as double) / (item['qty'] as int)).toStringAsFixed(2)}",
//           1);
//     }

//     printer.printNewLine();
//     printer.printLeftRight("Subtotal", "Rs.${subtotal.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Discount", "Rs.${discount.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Total", "Rs.${grandTotal.toStringAsFixed(2)}", 2);
//     printer.printNewLine();
//     printer.printCustom("THANK YOU FOR SHOPPING", 1, 1);
//     printer.printNewLine();
//     printer.paperCut();

//     viewsalesBox.add({
//       'billNo': activeBill,
//       'customer': customerController.text,
//       'counterPerson': counterPersonController.text,
//       'date': DateTime.now().toString(),
//       'items': cart,
//       'subtotal': subtotal,
//       'discount': discount,
//       'grandTotal': grandTotal,
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Invoice saved to sales history!')));
//   }

//   Future<void> _generatePdfInvoice() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         build: (context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text('AL-SHIFA MEDICAL',
//                   style: pw.TextStyle(
//                       fontSize: 24, fontWeight: pw.FontWeight.bold)),
//               pw.Text('Invoice - $activeBill',
//                   style: pw.TextStyle(fontSize: 18)),
//               pw.SizedBox(height: 10),
//               pw.Text('Customer: ${customerController.text}'),
//               pw.Text('Counter: ${counterPersonController.text}'),
//               pw.Text('Date: ${_formatDateTime(DateTime.now())}'),
//               pw.SizedBox(height: 10),
//               pw.Table.fromTextArray(
//                 headers: ['S.No', 'Medicine', 'Qty', 'Rate', 'Total'],
//                 data: List.generate(cart.length, (index) {
//                   final item = cart[index];
//                   return [
//                     '${index + 1}',
//                     item['name'],
//                     item['qty'].toString(),
//                     ((item['price'] as double) / (item['qty'] as int))
//                         .toStringAsFixed(2),
//                     (item['price'] as double).toStringAsFixed(2),
//                   ];
//                 }),
//               ),
//               pw.SizedBox(height: 10),
//               pw.Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//               pw.Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//               pw.Text('Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                   style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 20),
//               pw.Center(
//                   child: pw.Text('THANK YOU FOR SHOPPING',
//                       style: pw.TextStyle(
//                           fontSize: 16, fontWeight: pw.FontWeight.bold))),
//             ],
//           );
//         },
//       ),
//     );

//     await Printing.layoutPdf(onLayout: (format) async => pdf.save());
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:blue_thermal_printer/blue_thermal_printer.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class InvoiceScreen extends StatefulWidget {
//   const InvoiceScreen({super.key});

//   @override
//   State<InvoiceScreen> createState() => _InvoiceScreenState();
// }

// class _InvoiceScreenState extends State<InvoiceScreen> {
//   final Map<String, List<Map<String, dynamic>>> bills = {};
//   String activeBill = "Bill_1";

//   final Box availableBox = Hive.box('availableBox');
//   final Box viewsalesBox = Hive.box('viewsalesBox');

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController qtyController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController customerController = TextEditingController();
//   final TextEditingController discountPercentController =
//       TextEditingController();
//   final TextEditingController discountAmountController =
//       TextEditingController();
//   final TextEditingController counterPersonController = TextEditingController();

//   final FocusNode nameFocus = FocusNode();
//   final FocusNode qtyFocus = FocusNode();
//   final FocusNode priceFocus = FocusNode();
//   final FocusNode customerFocus = FocusNode();
//   final FocusNode discountPercentFocus = FocusNode();
//   final FocusNode discountAmountFocus = FocusNode();
//   final FocusNode counterPersonFocus = FocusNode();

//   final String ntnNo = '#1234677';
//   final String licenseNo = 'LIC-987654';

//   List<Map> filteredMedicines = [];
//   double currentPerTabletRate = 0.0;

//   final BlueThermalPrinter printer = BlueThermalPrinter.instance;

//   @override
//   void initState() {
//     super.initState();
//     bills[activeBill] = [];
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     qtyController.dispose();
//     priceController.dispose();
//     customerController.dispose();
//     discountPercentController.dispose();
//     discountAmountController.dispose();
//     counterPersonController.dispose();
//     nameFocus.dispose();
//     qtyFocus.dispose();
//     priceFocus.dispose();
//     customerFocus.dispose();
//     discountPercentFocus.dispose();
//     discountAmountFocus.dispose();
//     counterPersonFocus.dispose();
//     super.dispose();
//   }

//   List<Map<String, dynamic>> get cart => bills[activeBill] ?? [];

//   void addMedicine() {
//     final name = nameController.text.trim();
//     final int qty = int.tryParse(qtyController.text.trim()) ?? 1;
//     if (name.isEmpty) return;

//     final stock = availableBox.values.cast<Map>().firstWhere(
//           (m) =>
//               m["Medicine Name"].toString().toLowerCase() == name.toLowerCase(),
//           orElse: () => {},
//         );

//     if (stock.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Medicine not found in stock!')));
//       return;
//     }

//     final int packSize = int.tryParse(stock["Tablets"].toString()) ?? 1;
//     final double packPrice =
//         double.tryParse(stock["Pack Price"].toString()) ?? 0.0;
//     currentPerTabletRate = packSize > 0 ? packPrice / packSize : 0;
//     if (currentPerTabletRate <= 0) return;

//     setState(() {
//       cart.add({
//         'name': name,
//         'qty': qty,
//         'price': currentPerTabletRate * qty,
//       });
//       nameController.clear();
//       qtyController.clear();
//       priceController.clear();
//       currentPerTabletRate = 0.0;
//       filteredMedicines = [];
//       nameFocus.requestFocus(); // Focus back to medicine for faster POS entry
//     });
//   }

//   void _createNewBill() {
//     final newKey = "Bill_${bills.length + 1}";
//     setState(() {
//       bills[newKey] = [];
//       activeBill = newKey;
//     });
//   }

//   void _switchBill(String key) {
//     setState(() {
//       activeBill = key;
//     });
//   }

//   double get subtotal =>
//       cart.fold<double>(0, (sum, item) => sum + (item['price'] as double));

//   double get discount {
//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;

//     if (discountAmountInput > 0) return discountAmountInput.clamp(0, subtotal);
//     if (discountPercentInput > 0)
//       return subtotal * (discountPercentInput / 100).clamp(0, 1);
//     return 0;
//   }

//   double get grandTotal => (subtotal - discount).clamp(0, double.infinity);

//   String _formatDateTime(DateTime dt) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
//   }

//   // Reusable TextField with full keyboard navigation
//   Widget _keyboardTextField({
//     required TextEditingController controller,
//     required FocusNode focusNode,
//     FocusNode? nextFocus,
//     FocusNode? prevFocus,
//     String? label,
//     TextInputType keyboardType = TextInputType.text,
//     bool readOnly = false,
//     void Function(String)? onChanged,
//     void Function()? onEnter,
//   }) {
//     // Use a separate FocusNode for RawKeyboardListener
//     final rawFocus = FocusNode();
//     return RawKeyboardListener(
//       focusNode: rawFocus,
//       onKey: (event) {
//         if (event is RawKeyDownEvent) {
//           if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
//               nextFocus != null) {
//             nextFocus.requestFocus();
//           } else if (event.logicalKey == LogicalKeyboardKey.arrowUp &&
//               prevFocus != null) {
//             prevFocus.requestFocus();
//           } else if (event.logicalKey == LogicalKeyboardKey.arrowRight &&
//               nextFocus != null) {
//             nextFocus.requestFocus();
//           } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft &&
//               prevFocus != null) {
//             prevFocus.requestFocus();
//           } else if (event.logicalKey == LogicalKeyboardKey.enter) {
//             if (onEnter != null) onEnter();
//           }
//         }
//       },
//       child: TextField(
//         controller: controller,
//         focusNode: focusNode, // Keep the original focus here
//         keyboardType: keyboardType,
//         readOnly: readOnly,
//         decoration: InputDecoration(labelText: label, isDense: true),
//         onChanged: onChanged,
//         onSubmitted: (_) {
//           if (onEnter != null) onEnter();
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice - $activeBill'),
//         centerTitle: true,
//         backgroundColor: const Color(0xFF008000),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _switchBill,
//             itemBuilder: (context) => bills.keys
//                 .map((bill) => PopupMenuItem(
//                       value: bill,
//                       child: Text(bill == activeBill ? "$bill (Active)" : bill),
//                     ))
//                 .toList(),
//           ),
//           IconButton(
//               onPressed: _createNewBill,
//               icon: const Icon(Icons.add),
//               tooltip: "New Bill"),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Header
//             Row(
//               children: [
//                 const Expanded(
//                   child: Text('Al-Shifa Medical',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: const Text('الشفاء میڈیکل',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Wrap(
//               spacing: 16,
//               children: [
//                 Text('NTN: $ntnNo'),
//                 Text('License No: $licenseNo'),
//                 SizedBox(
//                   width: 240,
//                   child: _keyboardTextField(
//                     controller: customerController,
//                     focusNode: customerFocus,
//                     nextFocus: nameFocus,
//                     label: 'Customer Name',
//                   ),
//                 ),
//                 Text('Print Time: ${_formatDateTime(DateTime.now())}'),
//               ],
//             ),
//             const Divider(height: 24, thickness: 1),

//             // Medicine Input Row
//             Row(
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: Column(
//                     children: [
//                       _keyboardTextField(
//                         controller: nameController,
//                         focusNode: nameFocus,
//                         nextFocus: qtyFocus,
//                         prevFocus: customerFocus,
//                         label: 'Medicine',
//                         onChanged: (value) {
//                           setState(() {
//                             filteredMedicines = value.isEmpty
//                                 ? []
//                                 : availableBox.values
//                                     .where((stock) => stock["Medicine Name"]
//                                         .toString()
//                                         .toLowerCase()
//                                         .startsWith(value.toLowerCase()))
//                                     .cast<Map>()
//                                     .toList();
//                           });
//                         },
//                         onEnter: () {
//                           if (filteredMedicines.isNotEmpty) {
//                             nameController.text =
//                                 filteredMedicines.first["Medicine Name"];
//                             qtyController.text = '1';
//                             final int packSize = int.tryParse(filteredMedicines
//                                     .first["Tablets"]
//                                     .toString()) ??
//                                 1;
//                             final double packPrice = double.tryParse(
//                                     filteredMedicines.first["Pack Price"]
//                                         .toString()) ??
//                                 0.0;
//                             currentPerTabletRate =
//                                 packSize > 0 ? packPrice / packSize : 0;
//                             priceController.text =
//                                 currentPerTabletRate.toStringAsFixed(2);
//                             filteredMedicines = [];
//                             qtyFocus.requestFocus();
//                           }
//                         },
//                       ),
//                       if (filteredMedicines.isNotEmpty)
//                         Container(
//                           height: 120,
//                           color: Colors.grey[200],
//                           child: ListView.builder(
//                             itemCount: filteredMedicines.length,
//                             itemBuilder: (context, index) {
//                               final stock = filteredMedicines[index];
//                               return ListTile(
//                                 title: Text(stock["Medicine Name"]),
//                                 subtitle: Text(
//                                     "Pack: ${stock["Tablets"]} | Price: Rs. ${stock["Pack Price"]}"),
//                                 onTap: () {
//                                   setState(() {
//                                     nameController.text =
//                                         stock["Medicine Name"];
//                                     final int packSize = int.tryParse(
//                                             stock["Tablets"].toString()) ??
//                                         1;
//                                     final double packPrice = double.tryParse(
//                                             stock["Pack Price"].toString()) ??
//                                         0.0;
//                                     currentPerTabletRate =
//                                         packSize > 0 ? packPrice / packSize : 0;
//                                     qtyController.text = '1';
//                                     priceController.text =
//                                         currentPerTabletRate.toStringAsFixed(2);
//                                     filteredMedicines = [];
//                                     qtyFocus.requestFocus();
//                                   });
//                                 },
//                               );
//                             },
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: _keyboardTextField(
//                     controller: qtyController,
//                     focusNode: qtyFocus,
//                     nextFocus: priceFocus,
//                     prevFocus: nameFocus,
//                     label: 'Qty',
//                     keyboardType: TextInputType.number,
//                     onChanged: (value) {
//                       final qty = int.tryParse(value) ?? 1;
//                       setState(() {
//                         priceController.text =
//                             (currentPerTabletRate * qty).toStringAsFixed(2);
//                       });
//                     },
//                     onEnter: addMedicine,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   flex: 1,
//                   child: _keyboardTextField(
//                     controller: priceController,
//                     focusNode: priceFocus,
//                     prevFocus: qtyFocus,
//                     label: 'Rate',
//                     readOnly: true,
//                     onEnter: addMedicine,
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.add, color: Colors.green),
//                   onPressed: addMedicine,
//                   tooltip: 'Add to cart',
//                 ),
//               ],
//             ),

//             const SizedBox(height: 16),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: DataTable(
//                   columns: const [
//                     DataColumn(label: Text('S.No')),
//                     DataColumn(label: Text('Medicine')),
//                     DataColumn(label: Text('Qty')),
//                     DataColumn(label: Text('Rate')),
//                     DataColumn(label: Text('Total')),
//                     DataColumn(label: Icon(Icons.delete, color: Colors.red)),
//                   ],
//                   rows: [
//                     for (int i = 0; i < cart.length; i++)
//                       DataRow(cells: [
//                         DataCell(Text('${i + 1}')),
//                         DataCell(Text(cart[i]['name'].toString())),
//                         DataCell(Text(cart[i]['qty'].toString())),
//                         DataCell(Text(((cart[i]['price'] as double) /
//                                 (cart[i]['qty'] as int))
//                             .toStringAsFixed(2))),
//                         DataCell(Text(
//                             (cart[i]['price'] as double).toStringAsFixed(2))),
//                         DataCell(IconButton(
//                           icon: const Icon(Icons.delete, color: Colors.red),
//                           onPressed: () {
//                             setState(() {
//                               cart.removeAt(i);
//                             });
//                           },
//                         )),
//                       ])
//                   ],
//                 ),
//               ),
//             ),

//             // Discount and totals row
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 SizedBox(
//                   width: 140,
//                   child: _keyboardTextField(
//                     controller: discountPercentController,
//                     focusNode: discountPercentFocus,
//                     nextFocus: discountAmountFocus,
//                     prevFocus: counterPersonFocus,
//                     keyboardType: TextInputType.number,
//                     label: 'Discount %',
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 SizedBox(
//                   width: 160,
//                   child: _keyboardTextField(
//                     controller: discountAmountController,
//                     focusNode: discountAmountFocus,
//                     nextFocus: counterPersonFocus,
//                     prevFocus: discountPercentFocus,
//                     keyboardType: TextInputType.number,
//                     label: 'Discount (Rs.)',
//                     onChanged: (_) => setState(() {}),
//                   ),
//                 ),
//               ],
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                   Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//                   Text('Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 18)),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),
//             Row(
//               children: [
//                 SizedBox(
//                   width: 260,
//                   child: _keyboardTextField(
//                     controller: counterPersonController,
//                     focusNode: counterPersonFocus,
//                     nextFocus: customerFocus,
//                     prevFocus: discountAmountFocus,
//                     label: 'Counter Person Name',
//                   ),
//                 ),
//                 const Spacer(),
//                 const Text('THANK YOU FOR SHOPPING',
//                     style:
//                         TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _printThermalInvoice,
//                   icon: const Icon(Icons.print),
//                   label: const Text('Print Invoice (Thermal)'),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _generatePdfInvoice,
//                   icon: const Icon(Icons.picture_as_pdf),
//                   label: const Text('Generate PDF'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // --- Printing and PDF functions remain the same ---
//   Future<void> _printThermalInvoice() async {
//     bool isConnected = await printer.isConnected ?? false;
//     if (!isConnected) {
//       List<BluetoothDevice> devices = await printer.getBondedDevices();
//       if (devices.isNotEmpty)
//         await printer.connect(devices.first);
//       else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('No Bluetooth printer found!')));
//         return;
//       }
//     }

//     printer.printNewLine();
//     printer.printCustom("AL-SHIFA MEDICAL", 2, 1);
//     printer.printCustom("Invoice - $activeBill", 1, 1);
//     printer.printNewLine();
//     printer.printCustom("Customer: ${customerController.text}", 1, 0);
//     printer.printCustom("Counter: ${counterPersonController.text}", 1, 0);
//     printer.printNewLine();

//     for (var item in cart) {
//       printer.printLeftRight(
//           "${item['name']} x${item['qty']}",
//           "Rs.${((item['price'] as double) / (item['qty'] as int)).toStringAsFixed(2)}",
//           1);
//     }

//     printer.printNewLine();
//     printer.printLeftRight("Subtotal", "Rs.${subtotal.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Discount", "Rs.${discount.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Total", "Rs.${grandTotal.toStringAsFixed(2)}", 2);
//     printer.printNewLine();
//     printer.printCustom("THANK YOU FOR SHOPPING", 1, 1);
//     printer.printNewLine();
//     printer.paperCut();

//     viewsalesBox.add({
//       'billNo': activeBill,
//       'customer': customerController.text,
//       'counterPerson': counterPersonController.text,
//       'date': DateTime.now().toString(),
//       'items': cart,
//       'subtotal': subtotal,
//       'discount': discount,
//       'grandTotal': grandTotal,
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Invoice saved to sales history!')));
//   }

//   Future<void> _generatePdfInvoice() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         build: (context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text('AL-SHIFA MEDICAL',
//                   style: pw.TextStyle(
//                       fontSize: 24, fontWeight: pw.FontWeight.bold)),
//               pw.Text('Invoice - $activeBill',
//                   style: pw.TextStyle(fontSize: 18)),
//               pw.SizedBox(height: 10),
//               pw.Text('Customer: ${customerController.text}'),
//               pw.Text('Counter: ${counterPersonController.text}'),
//               pw.Text('Date: ${_formatDateTime(DateTime.now())}'),
//               pw.SizedBox(height: 10),
//               pw.Table.fromTextArray(
//                 headers: ['S.No', 'Medicine', 'Qty', 'Rate', 'Total'],
//                 data: List.generate(cart.length, (index) {
//                   final item = cart[index];
//                   return [
//                     '${index + 1}',
//                     item['name'],
//                     item['qty'].toString(),
//                     ((item['price'] as double) / (item['qty'] as int))
//                         .toStringAsFixed(2),
//                     (item['price'] as double).toStringAsFixed(2),
//                   ];
//                 }),
//               ),
//               pw.SizedBox(height: 10),
//               pw.Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//               pw.Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//               pw.Text('Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                   style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 20),
//               pw.Center(
//                   child: pw.Text('THANK YOU FOR SHOPPING',
//                       style: pw.TextStyle(
//                           fontSize: 16, fontWeight: pw.FontWeight.bold))),
//             ],
//           );
//         },
//       ),
//     );

//     await Printing.layoutPdf(onLayout: (format) async => pdf.save());
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:blue_thermal_printer/blue_thermal_printer.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class InvoiceScreen extends StatefulWidget {
//   const InvoiceScreen({super.key});

//   @override
//   State<InvoiceScreen> createState() => _InvoiceScreenState();
// }

// class _InvoiceScreenState extends State<InvoiceScreen> {
//   final Map<String, List<Map<String, dynamic>>> bills = {};
//   String activeBill = "Bill_1";

//   final Box availableBox = Hive.box('availableBox');
//   final Box viewsalesBox = Hive.box('viewsalesBox');

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController qtyController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController customerController = TextEditingController();
//   final TextEditingController discountPercentController =
//       TextEditingController();
//   final TextEditingController discountAmountController =
//       TextEditingController();
//   final TextEditingController counterPersonController = TextEditingController();

//   final FocusNode nameFocus = FocusNode();
//   final FocusNode qtyFocus = FocusNode();
//   final FocusNode priceFocus = FocusNode();
//   final FocusNode customerFocus = FocusNode();
//   final FocusNode discountPercentFocus = FocusNode();
//   final FocusNode discountAmountFocus = FocusNode();
//   final FocusNode counterPersonFocus = FocusNode();

//   final String ntnNo = '#1234677';
//   final String licenseNo = 'LIC-987654';

//   List<Map> filteredMedicines = [];
//   double currentPerTabletRate = 0.0;
//   bool isManualRate = false;

//   final BlueThermalPrinter printer = BlueThermalPrinter.instance;

//   @override
//   void initState() {
//     super.initState();
//     bills[activeBill] = [];
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     qtyController.dispose();
//     priceController.dispose();
//     customerController.dispose();
//     discountPercentController.dispose();
//     discountAmountController.dispose();
//     counterPersonController.dispose();
//     nameFocus.dispose();
//     qtyFocus.dispose();
//     priceFocus.dispose();
//     customerFocus.dispose();
//     discountPercentFocus.dispose();
//     discountAmountFocus.dispose();
//     counterPersonFocus.dispose();
//     super.dispose();
//   }

//   List<Map<String, dynamic>> get cart => bills[activeBill] ?? [];

//   void addMedicine() {
//     final name = nameController.text.trim();
//     final int qty = int.tryParse(qtyController.text.trim()) ?? 1;
//     final double price = double.tryParse(priceController.text.trim()) ?? 0.0;

//     if (name.isEmpty || price <= 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Please fill all required fields!')));
//       return;
//     }

//     // If not manual rate, check stock
//     if (!isManualRate) {
//       final stock = availableBox.values.cast<Map>().firstWhere(
//             (m) =>
//                 m["Medicine Name"].toString().toLowerCase() ==
//                 name.toLowerCase(),
//             orElse: () => {},
//           );

//       if (stock.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//             content:
//                 Text('Medicine not found in stock! Use manual rate instead.')));
//         return;
//       }
//     }

//     setState(() {
//       cart.add({
//         'name': name,
//         'qty': qty,
//         'price': price * qty,
//         'unitPrice': price,
//       });
//       _clearInputs();
//       nameFocus.requestFocus(); // Focus back to medicine for faster POS entry
//     });
//   }

//   void _clearInputs() {
//     nameController.clear();
//     qtyController.clear();
//     priceController.clear();
//     currentPerTabletRate = 0.0;
//     filteredMedicines = [];
//     isManualRate = false;
//   }

//   void _createNewBill() {
//     final newKey = "Bill_${bills.length + 1}";
//     setState(() {
//       bills[newKey] = [];
//       activeBill = newKey;
//     });
//   }

//   void _switchBill(String key) {
//     setState(() {
//       activeBill = key;
//     });
//   }

//   double get subtotal =>
//       cart.fold<double>(0, (sum, item) => sum + (item['price'] as double));

//   double get discount {
//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;

//     if (discountAmountInput > 0) return discountAmountInput.clamp(0, subtotal);
//     if (discountPercentInput > 0)
//       return subtotal * (discountPercentInput / 100).clamp(0, 1);
//     return 0;
//   }

//   double get grandTotal => (subtotal - discount).clamp(0, double.infinity);

//   String _formatDateTime(DateTime dt) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
//   }

//   // Improved TextField with better keyboard navigation
//   Widget _keyboardTextField({
//     required TextEditingController controller,
//     required FocusNode focusNode,
//     FocusNode? nextFocus,
//     FocusNode? prevFocus,
//     String? label,
//     TextInputType keyboardType = TextInputType.text,
//     bool readOnly = false,
//     void Function(String)? onChanged,
//     void Function()? onEnter,
//   }) {
//     return KeyboardListener(
//       focusNode: FocusNode(),
//       onKeyEvent: (event) {
//         if (event is KeyDownEvent && focusNode.hasFocus) {
//           if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
//               nextFocus != null) {
//             nextFocus.requestFocus();
//           } else if (event.logicalKey == LogicalKeyboardKey.arrowUp &&
//               prevFocus != null) {
//             prevFocus.requestFocus();
//           } else if (event.logicalKey == LogicalKeyboardKey.tab &&
//               nextFocus != null) {
//             nextFocus.requestFocus();
//           } else if (event.logicalKey == LogicalKeyboardKey.enter &&
//               onEnter != null) {
//             onEnter();
//           }
//         }
//       },
//       child: TextField(
//         controller: controller,
//         focusNode: focusNode,
//         keyboardType: keyboardType,
//         readOnly: readOnly,
//         decoration: InputDecoration(
//           labelText: label,
//           isDense: true,
//           border: OutlineInputBorder(),
//           contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         ),
//         onChanged: onChanged,
//         onSubmitted: (_) {
//           if (onEnter != null) onEnter();
//         },
//       ),
//     );
//   }

//   void _selectMedicine(Map stock) {
//     setState(() {
//       nameController.text = stock["Medicine Name"];
//       final int packSize = int.tryParse(stock["Tablets"].toString()) ?? 1;
//       final double packPrice =
//           double.tryParse(stock["Pack Price"].toString()) ?? 0.0;
//       currentPerTabletRate = packSize > 0 ? packPrice / packSize : 0;
//       qtyController.text = '1';
//       priceController.text = currentPerTabletRate.toStringAsFixed(2);
//       filteredMedicines = [];
//       isManualRate = false;
//       qtyFocus.requestFocus();
//     });
//   }

//   Widget _buildMedicineDropdown() {
//     if (filteredMedicines.isEmpty) return const SizedBox.shrink();

//     return Container(
//       constraints: BoxConstraints(maxHeight: 150),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(4),
//         color: Colors.white,
//       ),
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: filteredMedicines.length,
//         itemBuilder: (context, index) {
//           final stock = filteredMedicines[index];
//           return InkWell(
//             onTap: () => _selectMedicine(stock),
//             child: Container(
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     stock["Medicine Name"],
//                     style: TextStyle(fontWeight: FontWeight.w500),
//                   ),
//                   Text(
//                     "Pack: ${stock["Tablets"]} | Price: Rs. ${stock["Pack Price"]}",
//                     style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice - $activeBill'),
//         centerTitle: true,
//         backgroundColor: const Color(0xFF008000),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _switchBill,
//             itemBuilder: (context) => bills.keys
//                 .map((bill) => PopupMenuItem(
//                       value: bill,
//                       child: Text(bill == activeBill ? "$bill (Active)" : bill),
//                     ))
//                 .toList(),
//           ),
//           IconButton(
//               onPressed: _createNewBill,
//               icon: const Icon(Icons.add),
//               tooltip: "New Bill"),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Header
//             Row(
//               children: [
//                 const Expanded(
//                   child: Text('Al-Shifa Medical',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: const Text('الشفاء میڈیکل',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             // Customer and business info
//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('NTN: $ntnNo'),
//                       Text('License No: $licenseNo'),
//                       Text('Print Time: ${_formatDateTime(DateTime.now())}'),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 240,
//                   child: _keyboardTextField(
//                     controller: customerController,
//                     focusNode: customerFocus,
//                     nextFocus: nameFocus,
//                     label: 'Customer Name',
//                   ),
//                 ),
//               ],
//             ),
//             const Divider(height: 24, thickness: 1),

//             // Medicine Input Section
//             Card(
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     // Medicine input row
//                     Row(
//                       children: [
//                         Expanded(
//                           flex: 3,
//                           child: Column(
//                             children: [
//                               _keyboardTextField(
//                                 controller: nameController,
//                                 focusNode: nameFocus,
//                                 nextFocus: qtyFocus,
//                                 prevFocus: customerFocus,
//                                 label: 'Medicine Name',
//                                 onChanged: (value) {
//                                   setState(() {
//                                     isManualRate = false;
//                                     filteredMedicines = value.isEmpty
//                                         ? []
//                                         : availableBox.values
//                                             .where((stock) =>
//                                                 stock["Medicine Name"]
//                                                     .toString()
//                                                     .toLowerCase()
//                                                     .contains(
//                                                         value.toLowerCase()))
//                                             .cast<Map>()
//                                             .toList();
//                                   });
//                                 },
//                                 onEnter: () {
//                                   if (filteredMedicines.isNotEmpty) {
//                                     _selectMedicine(filteredMedicines.first);
//                                   }
//                                 },
//                               ),
//                               SizedBox(height: 4),
//                               _buildMedicineDropdown(),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           flex: 1,
//                           child: _keyboardTextField(
//                             controller: qtyController,
//                             focusNode: qtyFocus,
//                             nextFocus: priceFocus,
//                             prevFocus: nameFocus,
//                             label: 'Quantity',
//                             keyboardType: TextInputType.number,
//                             onChanged: (value) {
//                               if (!isManualRate && currentPerTabletRate > 0) {
//                                 final qty = int.tryParse(value) ?? 1;
//                                 setState(() {
//                                   priceController.text =
//                                       (currentPerTabletRate * qty)
//                                           .toStringAsFixed(2);
//                                 });
//                               }
//                             },
//                             onEnter: addMedicine,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           flex: 1,
//                           child: _keyboardTextField(
//                             controller: priceController,
//                             focusNode: priceFocus,
//                             prevFocus: qtyFocus,
//                             label: 'Unit Rate (Rs.)',
//                             keyboardType: TextInputType.number,
//                             readOnly: !isManualRate && currentPerTabletRate > 0,
//                             onChanged: (value) {
//                               if (value.isNotEmpty) {
//                                 setState(() {
//                                   isManualRate = true;
//                                 });
//                               }
//                             },
//                             onEnter: addMedicine,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Column(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.add, color: Colors.green),
//                               onPressed: addMedicine,
//                               tooltip: 'Add to cart',
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.edit, color: Colors.blue),
//                               onPressed: () {
//                                 setState(() {
//                                   isManualRate = true;
//                                   priceController.clear();
//                                   priceFocus.requestFocus();
//                                 });
//                               },
//                               tooltip: 'Manual rate',
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),

//                     // Manual entry toggle
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: isManualRate,
//                           onChanged: (value) {
//                             setState(() {
//                               isManualRate = value ?? false;
//                               if (!isManualRate) {
//                                 priceController.clear();
//                               }
//                             });
//                           },
//                         ),
//                         Text('Manual Rate Entry'),
//                         Spacer(),
//                         if (currentPerTabletRate > 0 && !isManualRate)
//                           Text(
//                               'Auto Rate: Rs. ${currentPerTabletRate.toStringAsFixed(2)} per unit'),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             // Cart items table
//             Container(
//               constraints: BoxConstraints(maxHeight: 300),
//               child: SingleChildScrollView(
//                 child: DataTable(
//                   columnSpacing: 20,
//                   columns: const [
//                     DataColumn(label: Text('S.No')),
//                     DataColumn(label: Text('Medicine')),
//                     DataColumn(label: Text('Qty')),
//                     DataColumn(label: Text('Unit Rate')),
//                     DataColumn(label: Text('Total')),
//                     DataColumn(label: Text('Action')),
//                   ],
//                   rows: [
//                     for (int i = 0; i < cart.length; i++)
//                       DataRow(cells: [
//                         DataCell(Text('${i + 1}')),
//                         DataCell(
//                           Container(
//                             width: 120,
//                             child: Text(
//                               cart[i]['name'].toString(),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ),
//                         DataCell(Text(cart[i]['qty'].toString())),
//                         DataCell(Text(
//                             'Rs. ${(cart[i]['unitPrice'] as double).toStringAsFixed(2)}')),
//                         DataCell(Text(
//                             'Rs. ${(cart[i]['price'] as double).toStringAsFixed(2)}')),
//                         DataCell(
//                           Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                 icon: const Icon(Icons.edit,
//                                     color: Colors.blue, size: 18),
//                                 onPressed: () {
//                                   // Edit item functionality
//                                   setState(() {
//                                     nameController.text = cart[i]['name'];
//                                     qtyController.text =
//                                         cart[i]['qty'].toString();
//                                     priceController.text =
//                                         (cart[i]['unitPrice'] as double)
//                                             .toStringAsFixed(2);
//                                     isManualRate = true;
//                                     cart.removeAt(i);
//                                     nameFocus.requestFocus();
//                                   });
//                                 },
//                                 tooltip: 'Edit',
//                               ),
//                               IconButton(
//                                 icon: const Icon(Icons.delete,
//                                     color: Colors.red, size: 18),
//                                 onPressed: () {
//                                   setState(() {
//                                     cart.removeAt(i);
//                                   });
//                                 },
//                                 tooltip: 'Delete',
//                               ),
//                             ],
//                           ),
//                         ),
//                       ])
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             // Discount and totals section
//             Card(
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: _keyboardTextField(
//                             controller: discountPercentController,
//                             focusNode: discountPercentFocus,
//                             nextFocus: discountAmountFocus,
//                             keyboardType: TextInputType.number,
//                             label: 'Discount %',
//                             onChanged: (_) => setState(() {}),
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: _keyboardTextField(
//                             controller: discountAmountController,
//                             focusNode: discountAmountFocus,
//                             nextFocus: counterPersonFocus,
//                             prevFocus: discountPercentFocus,
//                             keyboardType: TextInputType.number,
//                             label: 'Discount Amount (Rs.)',
//                             onChanged: (_) => setState(() {}),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Items: ${cart.length}'),
//                             Text(
//                                 'Total Qty: ${cart.fold<int>(0, (sum, item) => sum + (item['qty'] as int))}'),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text(
//                                 'Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                             Text(
//                                 'Discount: Rs. ${discount.toStringAsFixed(2)}'),
//                             Text(
//                               'Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 18),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             // Counter person and footer
//             Row(
//               children: [
//                 Expanded(
//                   child: _keyboardTextField(
//                     controller: counterPersonController,
//                     focusNode: counterPersonFocus,
//                     nextFocus: customerFocus,
//                     prevFocus: discountAmountFocus,
//                     label: 'Counter Person Name',
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 const Text(
//                   'THANK YOU FOR SHOPPING',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 20),

//             // Action buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _printThermalInvoice,
//                   icon: const Icon(Icons.print),
//                   label: const Text('Print Invoice (Thermal)'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _generatePdfInvoice,
//                   icon: const Icon(Icons.picture_as_pdf),
//                   label: const Text('Generate PDF'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     setState(() {
//                       bills[activeBill] = [];
//                       _clearInputs();
//                       customerController.clear();
//                       counterPersonController.clear();
//                       discountPercentController.clear();
//                       discountAmountController.clear();
//                     });
//                   },
//                   icon: const Icon(Icons.clear),
//                   label: const Text('Clear All'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // --- Printing and PDF functions remain the same with minor updates ---
//   Future<void> _printThermalInvoice() async {
//     bool isConnected = await printer.isConnected ?? false;
//     if (!isConnected) {
//       List<BluetoothDevice> devices = await printer.getBondedDevices();
//       if (devices.isNotEmpty)
//         await printer.connect(devices.first);
//       else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('No Bluetooth printer found!')));
//         return;
//       }
//     }

//     printer.printNewLine();
//     printer.printCustom("AL-SHIFA MEDICAL", 2, 1);
//     printer.printCustom("Invoice - $activeBill", 1, 1);
//     printer.printNewLine();
//     printer.printCustom("Customer: ${customerController.text}", 1, 0);
//     printer.printCustom("Counter: ${counterPersonController.text}", 1, 0);
//     printer.printCustom("Date: ${_formatDateTime(DateTime.now())}", 1, 0);
//     printer.printNewLine();

//     for (var item in cart) {
//       printer.printLeftRight("${item['name']} x${item['qty']}",
//           "Rs.${(item['unitPrice'] as double).toStringAsFixed(2)}", 1);
//       printer.printLeftRight(
//           "", "Rs.${(item['price'] as double).toStringAsFixed(2)}", 1);
//     }

//     printer.printNewLine();
//     printer.printLeftRight("Subtotal", "Rs.${subtotal.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Discount", "Rs.${discount.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Total", "Rs.${grandTotal.toStringAsFixed(2)}", 2);
//     printer.printNewLine();
//     printer.printCustom("THANK YOU FOR SHOPPING", 1, 1);
//     printer.printNewLine();
//     printer.paperCut();

//     viewsalesBox.add({
//       'billNo': activeBill,
//       'customer': customerController.text,
//       'counterPerson': counterPersonController.text,
//       'date': DateTime.now().toString(),
//       'items': cart,
//       'subtotal': subtotal,
//       'discount': discount,
//       'grandTotal': grandTotal,
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Invoice saved to sales history!')));
//   }

//   Future<void> _generatePdfInvoice() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         build: (context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text('AL-SHIFA MEDICAL',
//                   style: pw.TextStyle(
//                       fontSize: 24, fontWeight: pw.FontWeight.bold)),
//               pw.Text('Invoice - $activeBill',
//                   style: pw.TextStyle(fontSize: 18)),
//               pw.SizedBox(height: 10),
//               pw.Text('Customer: ${customerController.text}'),
//               pw.Text('Counter: ${counterPersonController.text}'),
//               pw.Text('Date: ${_formatDateTime(DateTime.now())}'),
//               pw.SizedBox(height: 10),
//               pw.Table.fromTextArray(
//                 headers: ['S.No', 'Medicine', 'Qty', 'Unit Rate', 'Total'],
//                 data: List.generate(cart.length, (index) {
//                   final item = cart[index];
//                   return [
//                     '${index + 1}',
//                     item['name'],
//                     item['qty'].toString(),
//                     'Rs. ${(item['unitPrice'] as double).toStringAsFixed(2)}',
//                     'Rs. ${(item['price'] as double).toStringAsFixed(2)}',
//                   ];
//                 }),
//               ),
//               pw.SizedBox(height: 10),
//               pw.Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//               pw.Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//               pw.Text('Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                   style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 20),
//               pw.Center(
//                   child: pw.Text('THANK YOU FOR SHOPPING',
//                       style: pw.TextStyle(
//                           fontSize: 16, fontWeight: pw.FontWeight.bold))),
//             ],
//           );
//         },
//       ),
//     );

//     await Printing.layoutPdf(onLayout: (format) async => pdf.save());
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:blue_thermal_printer/blue_thermal_printer.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class InvoiceScreen extends StatefulWidget {
//   const InvoiceScreen({super.key});

//   @override
//   State<InvoiceScreen> createState() => _InvoiceScreenState();
// }

// class _InvoiceScreenState extends State<InvoiceScreen> {
//   final Map<String, List<Map<String, dynamic>>> bills = {};
//   String activeBill = "Bill_1";

//   final Box availableBox = Hive.box('availableBox');
//   final Box viewsalesBox = Hive.box('viewsalesBox');

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController qtyController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController customerController = TextEditingController();
//   final TextEditingController discountPercentController =
//       TextEditingController();
//   final TextEditingController discountAmountController =
//       TextEditingController();
//   final TextEditingController counterPersonController = TextEditingController();

//   final FocusNode nameFocus = FocusNode();
//   final FocusNode qtyFocus = FocusNode();
//   final FocusNode priceFocus = FocusNode();
//   final FocusNode customerFocus = FocusNode();
//   final FocusNode discountPercentFocus = FocusNode();
//   final FocusNode discountAmountFocus = FocusNode();
//   final FocusNode counterPersonFocus = FocusNode();

//   final String ntnNo = '#1234677';
//   final String licenseNo = 'LIC-987654';

//   List<Map> filteredMedicines = [];
//   double currentPerTabletRate = 0.0;
//   bool isManualRate = false;

//   final BlueThermalPrinter printer = BlueThermalPrinter.instance;

//   @override
//   void initState() {
//     super.initState();
//     bills[activeBill] = [];
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     qtyController.dispose();
//     priceController.dispose();
//     customerController.dispose();
//     discountPercentController.dispose();
//     discountAmountController.dispose();
//     counterPersonController.dispose();
//     nameFocus.dispose();
//     qtyFocus.dispose();
//     priceFocus.dispose();
//     customerFocus.dispose();
//     discountPercentFocus.dispose();
//     discountAmountFocus.dispose();
//     counterPersonFocus.dispose();
//     super.dispose();
//   }

//   List<Map<String, dynamic>> get cart => bills[activeBill] ?? [];

//   void addMedicine() {
//     final name = nameController.text.trim();
//     final int qty = int.tryParse(qtyController.text.trim()) ?? 1;
//     final double price = double.tryParse(priceController.text.trim()) ?? 0.0;

//     if (name.isEmpty || price <= 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Please fill all required fields!')));
//       return;
//     }

//     // If not manual rate, check stock
//     if (!isManualRate) {
//       final stock = availableBox.values.cast<Map>().firstWhere(
//             (m) =>
//                 m["Medicine Name"].toString().toLowerCase() ==
//                 name.toLowerCase(),
//             orElse: () => {},
//           );

//       if (stock.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//             content:
//                 Text('Medicine not found in stock! Use manual rate instead.')));
//         return;
//       }
//     }

//     setState(() {
//       cart.add({
//         'name': name,
//         'qty': qty,
//         'price': price * qty,
//         'unitPrice': price,
//       });
//       _clearInputs();
//       nameFocus.requestFocus(); // Focus back to medicine for faster POS entry
//     });
//   }

//   void _clearInputs() {
//     nameController.clear();
//     qtyController.clear();
//     priceController.clear();
//     currentPerTabletRate = 0.0;
//     filteredMedicines = [];
//     isManualRate = false;
//   }

//   void _createNewBill() {
//     final newKey = "Bill_${bills.length + 1}";
//     setState(() {
//       bills[newKey] = [];
//       activeBill = newKey;
//     });
//   }

//   void _switchBill(String key) {
//     setState(() {
//       activeBill = key;
//     });
//   }

//   double get subtotal =>
//       cart.fold<double>(0, (sum, item) => sum + (item['price'] as double));

//   double get discount {
//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;

//     if (discountAmountInput > 0) return discountAmountInput.clamp(0, subtotal);
//     if (discountPercentInput > 0)
//       return subtotal * (discountPercentInput / 100).clamp(0, 1);
//     return 0;
//   }

//   double get grandTotal => (subtotal - discount).clamp(0, double.infinity);

//   String _formatDateTime(DateTime dt) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
//   }

//   // Improved TextField with better keyboard navigation
//   Widget _keyboardTextField({
//     required TextEditingController controller,
//     required FocusNode focusNode,
//     FocusNode? nextFocus,
//     FocusNode? prevFocus,
//     String? label,
//     TextInputType keyboardType = TextInputType.text,
//     bool readOnly = false,
//     void Function(String)? onChanged,
//     void Function()? onEnter,
//   }) {
//     return KeyboardListener(
//       focusNode: FocusNode(),
//       onKeyEvent: (event) {
//         if (event is KeyDownEvent && focusNode.hasFocus) {
//           if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
//               nextFocus != null) {
//             nextFocus.requestFocus();
//           } else if (event.logicalKey == LogicalKeyboardKey.arrowUp &&
//               prevFocus != null) {
//             prevFocus.requestFocus();
//           } else if (event.logicalKey == LogicalKeyboardKey.tab &&
//               nextFocus != null) {
//             nextFocus.requestFocus();
//           } else if (event.logicalKey == LogicalKeyboardKey.enter &&
//               onEnter != null) {
//             onEnter();
//           }
//         }
//       },
//       child: TextField(
//         controller: controller,
//         focusNode: focusNode,
//         keyboardType: keyboardType,
//         readOnly: readOnly,
//         decoration: InputDecoration(
//           labelText: label,
//           isDense: true,
//           border: OutlineInputBorder(),
//           contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         ),
//         onChanged: onChanged,
//         onSubmitted: (_) {
//           if (onEnter != null) onEnter();
//         },
//       ),
//     );
//   }

//   void _selectMedicine(Map stock) {
//     setState(() {
//       nameController.text = stock["Medicine Name"];
//       final int packSize = int.tryParse(stock["Tablets"].toString()) ?? 1;
//       final double packPrice =
//           double.tryParse(stock["Pack Price"].toString()) ?? 0.0;
//       currentPerTabletRate = packSize > 0 ? packPrice / packSize : 0;
//       qtyController.text = '1';
//       priceController.text = currentPerTabletRate.toStringAsFixed(2);
//       filteredMedicines = [];
//       isManualRate = false;
//       qtyFocus.requestFocus();
//     });
//   }

//   Widget _buildMedicineDropdown() {
//     if (filteredMedicines.isEmpty) return const SizedBox.shrink();

//     return Container(
//       constraints: BoxConstraints(maxHeight: 150),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(4),
//         color: Colors.white,
//       ),
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: filteredMedicines.length,
//         itemBuilder: (context, index) {
//           final stock = filteredMedicines[index];
//           return InkWell(
//             onTap: () => _selectMedicine(stock),
//             child: Container(
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     stock["Medicine Name"],
//                     style: TextStyle(fontWeight: FontWeight.w500),
//                   ),
//                   Text(
//                     "Pack: ${stock["Tablets"]} | Price: Rs. ${stock["Pack Price"]}",
//                     style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice - $activeBill'),
//         centerTitle: true,
//         backgroundColor: const Color(0xFF008000),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _switchBill,
//             itemBuilder: (context) => bills.keys
//                 .map((bill) => PopupMenuItem(
//                       value: bill,
//                       child: Text(bill == activeBill ? "$bill (Active)" : bill),
//                     ))
//                 .toList(),
//           ),
//           IconButton(
//               onPressed: _createNewBill,
//               icon: const Icon(Icons.add),
//               tooltip: "New Bill"),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Header
//             Row(
//               children: [
//                 const Expanded(
//                   child: Text('Al-Shifa Medical',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: const Text('الشفاء میڈیکل',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             // Customer and business info
//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('NTN: $ntnNo'),
//                       Text('License No: $licenseNo'),
//                       Text('Print Time: ${_formatDateTime(DateTime.now())}'),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 240,
//                   child: _keyboardTextField(
//                     controller: customerController,
//                     focusNode: customerFocus,
//                     nextFocus: nameFocus,
//                     label: 'Customer Name',
//                   ),
//                 ),
//               ],
//             ),
//             const Divider(height: 24, thickness: 1),

//             // Medicine Input Section
//             Card(
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     // Medicine input row
//                     Row(
//                       children: [
//                         Expanded(
//                           flex: 3,
//                           child: Column(
//                             children: [
//                               _keyboardTextField(
//                                 controller: nameController,
//                                 focusNode: nameFocus,
//                                 nextFocus: qtyFocus,
//                                 prevFocus: customerFocus,
//                                 label: 'Medicine Name',
//                                 onChanged: (value) {
//                                   setState(() {
//                                     isManualRate = false;
//                                     filteredMedicines = value.isEmpty
//                                         ? []
//                                         : availableBox.values
//                                             .where((stock) =>
//                                                 stock["Medicine Name"]
//                                                     .toString()
//                                                     .toLowerCase()
//                                                     .contains(
//                                                         value.toLowerCase()))
//                                             .cast<Map>()
//                                             .toList();
//                                   });
//                                 },
//                                 onEnter: () {
//                                   if (filteredMedicines.isNotEmpty) {
//                                     _selectMedicine(filteredMedicines.first);
//                                   }
//                                 },
//                               ),
//                               SizedBox(height: 4),
//                               _buildMedicineDropdown(),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           flex: 1,
//                           child: _keyboardTextField(
//                             controller: qtyController,
//                             focusNode: qtyFocus,
//                             nextFocus: priceFocus,
//                             prevFocus: nameFocus,
//                             label: 'Quantity',
//                             keyboardType: TextInputType.number,
//                             onChanged: (value) {
//                               if (!isManualRate && currentPerTabletRate > 0) {
//                                 final qty = int.tryParse(value) ?? 1;
//                                 setState(() {
//                                   priceController.text =
//                                       (currentPerTabletRate * qty)
//                                           .toStringAsFixed(2);
//                                 });
//                               }
//                             },
//                             onEnter: addMedicine,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           flex: 1,
//                           child: _keyboardTextField(
//                             controller: priceController,
//                             focusNode: priceFocus,
//                             nextFocus: discountPercentFocus,
//                             prevFocus: qtyFocus,
//                             label: 'Unit Rate (Rs.)',
//                             keyboardType: TextInputType.number,
//                             readOnly: !isManualRate && currentPerTabletRate > 0,
//                             onChanged: (value) {
//                               if (value.isNotEmpty) {
//                                 setState(() {
//                                   isManualRate = true;
//                                 });
//                               }
//                             },
//                             onEnter: addMedicine,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Column(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.add, color: Colors.green),
//                               onPressed: addMedicine,
//                               tooltip: 'Add to cart',
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.edit, color: Colors.blue),
//                               onPressed: () {
//                                 setState(() {
//                                   isManualRate = true;
//                                   priceController.clear();
//                                   priceFocus.requestFocus();
//                                 });
//                               },
//                               tooltip: 'Manual rate',
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),

//                     // Manual entry toggle
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: isManualRate,
//                           onChanged: (value) {
//                             setState(() {
//                               isManualRate = value ?? false;
//                               if (!isManualRate) {
//                                 priceController.clear();
//                               }
//                             });
//                           },
//                         ),
//                         Text('Manual Rate Entry'),
//                         Spacer(),
//                         if (currentPerTabletRate > 0 && !isManualRate)
//                           Text(
//                               'Auto Rate: Rs. ${currentPerTabletRate.toStringAsFixed(2)} per unit'),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             // Cart items table
//             Container(
//               constraints: BoxConstraints(maxHeight: 300),
//               child: SingleChildScrollView(
//                 child: DataTable(
//                   columnSpacing: 20,
//                   columns: const [
//                     DataColumn(label: Text('S.No')),
//                     DataColumn(label: Text('Medicine')),
//                     DataColumn(label: Text('Qty')),
//                     DataColumn(label: Text('Unit Rate')),
//                     DataColumn(label: Text('Total')),
//                     DataColumn(label: Text('Action')),
//                   ],
//                   rows: [
//                     for (int i = 0; i < cart.length; i++)
//                       DataRow(cells: [
//                         DataCell(Text('${i + 1}')),
//                         DataCell(
//                           Container(
//                             width: 120,
//                             child: Text(
//                               cart[i]['name'].toString(),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ),
//                         DataCell(Text(cart[i]['qty'].toString())),
//                         DataCell(Text(
//                             'Rs. ${(cart[i]['unitPrice'] as double).toStringAsFixed(2)}')),
//                         DataCell(Text(
//                             'Rs. ${(cart[i]['price'] as double).toStringAsFixed(2)}')),
//                         DataCell(
//                           Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                 icon: const Icon(Icons.edit,
//                                     color: Colors.blue, size: 18),
//                                 onPressed: () {
//                                   // Edit item functionality
//                                   setState(() {
//                                     nameController.text = cart[i]['name'];
//                                     qtyController.text =
//                                         cart[i]['qty'].toString();
//                                     priceController.text =
//                                         (cart[i]['unitPrice'] as double)
//                                             .toStringAsFixed(2);
//                                     isManualRate = true;
//                                     cart.removeAt(i);
//                                     nameFocus.requestFocus();
//                                   });
//                                 },
//                                 tooltip: 'Edit',
//                               ),
//                               IconButton(
//                                 icon: const Icon(Icons.delete,
//                                     color: Colors.red, size: 18),
//                                 onPressed: () {
//                                   setState(() {
//                                     cart.removeAt(i);
//                                   });
//                                 },
//                                 tooltip: 'Delete',
//                               ),
//                             ],
//                           ),
//                         ),
//                       ])
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             // Discount and totals section
//             Card(
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: _keyboardTextField(
//                             controller: discountPercentController,
//                             focusNode: discountPercentFocus,
//                             nextFocus: discountAmountFocus,
//                             keyboardType: TextInputType.number,
//                             label: 'Discount %',
//                             onChanged: (_) => setState(() {}),
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: _keyboardTextField(
//                             controller: discountAmountController,
//                             focusNode: discountAmountFocus,
//                             nextFocus: counterPersonFocus,
//                             prevFocus: discountPercentFocus,
//                             keyboardType: TextInputType.number,
//                             label: 'Discount Amount (Rs.)',
//                             onChanged: (_) => setState(() {}),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Items: ${cart.length}'),
//                             Text(
//                                 'Total Qty: ${cart.fold<int>(0, (sum, item) => sum + (item['qty'] as int))}'),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text(
//                                 'Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                             Text(
//                                 'Discount: Rs. ${discount.toStringAsFixed(2)}'),
//                             Text(
//                               'Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 18),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             // Counter person and footer
//             Row(
//               children: [
//                 Expanded(
//                   child: _keyboardTextField(
//                     controller: counterPersonController,
//                     focusNode: counterPersonFocus,
//                     nextFocus: customerFocus,
//                     prevFocus: discountAmountFocus,
//                     label: 'Counter Person Name',
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 const Text(
//                   'THANK YOU FOR SHOPPING',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 20),

//             // Action buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _printThermalInvoice,
//                   icon: const Icon(Icons.print),
//                   label: const Text('Print Invoice (Thermal)'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _generatePdfInvoice,
//                   icon: const Icon(Icons.picture_as_pdf),
//                   label: const Text('Generate PDF'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     setState(() {
//                       bills[activeBill] = [];
//                       _clearInputs();
//                       customerController.clear();
//                       counterPersonController.clear();
//                       discountPercentController.clear();
//                       discountAmountController.clear();
//                     });
//                   },
//                   icon: const Icon(Icons.clear),
//                   label: const Text('Clear All'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // --- Printing and PDF functions remain the same with minor updates ---
//   Future<void> _printThermalInvoice() async {
//     bool isConnected = await printer.isConnected ?? false;
//     if (!isConnected) {
//       List<BluetoothDevice> devices = await printer.getBondedDevices();
//       if (devices.isNotEmpty)
//         await printer.connect(devices.first);
//       else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('No Bluetooth printer found!')));
//         return;
//       }
//     }

//     printer.printNewLine();
//     printer.printCustom("AL-SHIFA MEDICAL", 2, 1);
//     printer.printCustom("Invoice - $activeBill", 1, 1);
//     printer.printNewLine();
//     printer.printCustom("Customer: ${customerController.text}", 1, 0);
//     printer.printCustom("Counter: ${counterPersonController.text}", 1, 0);
//     printer.printCustom("Date: ${_formatDateTime(DateTime.now())}", 1, 0);
//     printer.printNewLine();

//     for (var item in cart) {
//       printer.printLeftRight("${item['name']} x${item['qty']}",
//           "Rs.${(item['unitPrice'] as double).toStringAsFixed(2)}", 1);
//       printer.printLeftRight(
//           "", "Rs.${(item['price'] as double).toStringAsFixed(2)}", 1);
//     }

//     printer.printNewLine();
//     printer.printLeftRight("Subtotal", "Rs.${subtotal.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Discount", "Rs.${discount.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Total", "Rs.${grandTotal.toStringAsFixed(2)}", 2);
//     printer.printNewLine();
//     printer.printCustom("THANK YOU FOR SHOPPING", 1, 1);
//     printer.printNewLine();
//     printer.paperCut();

//     viewsalesBox.add({
//       'billNo': activeBill,
//       'customer': customerController.text,
//       'counterPerson': counterPersonController.text,
//       'date': DateTime.now().toString(),
//       'items': cart,
//       'subtotal': subtotal,
//       'discount': discount,
//       'grandTotal': grandTotal,
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Invoice saved to sales history!')));
//   }

//   Future<void> _generatePdfInvoice() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         build: (context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text('AL-SHIFA MEDICAL',
//                   style: pw.TextStyle(
//                       fontSize: 24, fontWeight: pw.FontWeight.bold)),
//               pw.Text('Invoice - $activeBill',
//                   style: pw.TextStyle(fontSize: 18)),
//               pw.SizedBox(height: 10),
//               pw.Text('Customer: ${customerController.text}'),
//               pw.Text('Counter: ${counterPersonController.text}'),
//               pw.Text('Date: ${_formatDateTime(DateTime.now())}'),
//               pw.SizedBox(height: 10),
//               pw.Table.fromTextArray(
//                 headers: ['S.No', 'Medicine', 'Qty', 'Unit Rate', 'Total'],
//                 data: List.generate(cart.length, (index) {
//                   final item = cart[index];
//                   return [
//                     '${index + 1}',
//                     item['name'],
//                     item['qty'].toString(),
//                     'Rs. ${(item['unitPrice'] as double).toStringAsFixed(2)}',
//                     'Rs. ${(item['price'] as double).toStringAsFixed(2)}',
//                   ];
//                 }),
//               ),
//               pw.SizedBox(height: 10),
//               pw.Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//               pw.Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//               pw.Text('Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                   style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 20),
//               pw.Center(
//                   child: pw.Text('THANK YOU FOR SHOPPING',
//                       style: pw.TextStyle(
//                           fontSize: 16, fontWeight: pw.FontWeight.bold))),
//             ],
//           );
//         },
//       ),
//     );

//     await Printing.layoutPdf(onLayout: (format) async => pdf.save());
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:blue_thermal_printer/blue_thermal_printer.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class InvoiceScreen extends StatefulWidget {
//   const InvoiceScreen({super.key});

//   @override
//   State<InvoiceScreen> createState() => _InvoiceScreenState();
// }

// class _InvoiceScreenState extends State<InvoiceScreen> {
//   final Map<String, List<Map<String, dynamic>>> bills = {};
//   String activeBill = "Bill_1";

//   final Box availableBox = Hive.box('availableBox');
//   final Box viewsalesBox = Hive.box('viewsalesBox');

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController qtyController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController customerController = TextEditingController();
//   final TextEditingController discountPercentController = TextEditingController();
//   final TextEditingController discountAmountController = TextEditingController();
//   final TextEditingController counterPersonController = TextEditingController();

//   final FocusNode nameFocus = FocusNode();
//   final FocusNode qtyFocus = FocusNode();
//   final FocusNode priceFocus = FocusNode();
//   final FocusNode customerFocus = FocusNode();
//   final FocusNode discountPercentFocus = FocusNode();
//   final FocusNode discountAmountFocus = FocusNode();
//   final FocusNode counterPersonFocus = FocusNode();

//   final String ntnNo = '#1234677';
//   final String licenseNo = 'LIC-987654';

//   List<Map> filteredMedicines = [];
//   double currentPerTabletRate = 0.0;
//   bool isManualRate = false;

//   final BlueThermalPrinter printer = BlueThermalPrinter.instance;

//   @override
//   void initState() {
//     super.initState();
//     bills[activeBill] = [];
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     qtyController.dispose();
//     priceController.dispose();
//     customerController.dispose();
//     discountPercentController.dispose();
//     discountAmountController.dispose();
//     counterPersonController.dispose();
//     nameFocus.dispose();
//     qtyFocus.dispose();
//     priceFocus.dispose();
//     customerFocus.dispose();
//     discountPercentFocus.dispose();
//     discountAmountFocus.dispose();
//     counterPersonFocus.dispose();
//     super.dispose();
//   }

//   List<Map<String, dynamic>> get cart => bills[activeBill] ?? [];

//   void addMedicine() {
//     final name = nameController.text.trim();
//     final int qty = int.tryParse(qtyController.text.trim()) ?? 1;
//     final double price = double.tryParse(priceController.text.trim()) ?? 0.0;

//     if (name.isEmpty || price <= 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Please fill all required fields!')));
//       return;
//     }

//     // If not manual rate, check stock
//     if (!isManualRate) {
//       final stock = availableBox.values.cast<Map>().firstWhere(
//             (m) => m["Medicine Name"].toString().toLowerCase() == name.toLowerCase(),
//             orElse: () => {},
//           );

//       if (stock.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Medicine not found in stock! Use manual rate instead.')));
//         return;
//       }
//     }

//     setState(() {
//       cart.add({
//         'name': name,
//         'qty': qty,
//         'price': price * qty,
//         'unitPrice': price,
//       });
//       _clearInputs();
//       nameFocus.requestFocus(); // Focus back to medicine for faster POS entry
//     });
//   }

//   void _clearInputs() {
//     nameController.clear();
//     qtyController.clear();
//     priceController.clear();
//     currentPerTabletRate = 0.0;
//     filteredMedicines = [];
//     isManualRate = false;
//   }

//   void _createNewBill() {
//     final newKey = "Bill_${bills.length + 1}";
//     setState(() {
//       bills[newKey] = [];
//       activeBill = newKey;
//     });
//   }

//   void _switchBill(String key) {
//     setState(() {
//       activeBill = key;
//     });
//   }

//   double get subtotal =>
//       cart.fold<double>(0, (sum, item) => sum + (item['price'] as double));

//   double get discount {
//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;

//     if (discountAmountInput > 0) return discountAmountInput.clamp(0, subtotal);
//     if (discountPercentInput > 0)
//       return subtotal * (discountPercentInput / 100).clamp(0, 1);
//     return 0;
//   }

//   double get grandTotal => (subtotal - discount).clamp(0, double.infinity);

//   String _formatDateTime(DateTime dt) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
//   }

//   // Improved TextField with better keyboard navigation
//   Widget _keyboardTextField({
//     required TextEditingController controller,
//     required FocusNode focusNode,
//     FocusNode? nextFocus,
//     FocusNode? prevFocus,
//     String? label,
//     TextInputType keyboardType = TextInputType.text,
//     bool readOnly = false,
//     void Function(String)? onChanged,
//     void Function()? onEnter,
//   }) {
//     return KeyboardListener(
//       focusNode: FocusNode(),
//       onKeyEvent: (event) {
//         if (event is KeyDownEvent && focusNode.hasFocus) {
//           if (event.logicalKey == LogicalKeyboardKey.arrowDown && nextFocus != null) {
//             nextFocus.requestFocus();
//           } else if (event.logicalKey == LogicalKeyboardKey.arrowUp && prevFocus != null) {
//             prevFocus.requestFocus();
//           } else if (event.logicalKey == LogicalKeyboardKey.tab && nextFocus != null) {
//             nextFocus.requestFocus();
//           } else if (event.logicalKey == LogicalKeyboardKey.enter && onEnter != null) {
//             onEnter();
//           }
//         }
//       },
//       child: TextField(
//         controller: controller,
//         focusNode: focusNode,
//         keyboardType: keyboardType,
//         readOnly: readOnly,
//         decoration: InputDecoration(
//           labelText: label,
//           isDense: true,
//           border: OutlineInputBorder(),
//           contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         ),
//         onChanged: onChanged,
//         onSubmitted: (_) {
//           if (onEnter != null) onEnter();
//         },
//       ),
//     );
//   }

//   void _selectMedicine(Map stock) {
//     setState(() {
//       nameController.text = stock["Medicine Name"];
//       final int packSize = int.tryParse(stock["Tablets"].toString()) ?? 1;
//       final double packPrice = double.tryParse(stock["Pack Price"].toString()) ?? 0.0;
//       currentPerTabletRate = packSize > 0 ? packPrice / packSize : 0;
//       qtyController.text = '1';
//       priceController.text = currentPerTabletRate.toStringAsFixed(2);
//       filteredMedicines = [];
//       isManualRate = false;
//       qtyFocus.requestFocus();
//     });
//   }

//   Widget _buildMedicineDropdown() {
//     if (filteredMedicines.isEmpty) return const SizedBox.shrink();

//     return Container(
//       constraints: BoxConstraints(maxHeight: 150),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(4),
//         color: Colors.white,
//       ),
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: filteredMedicines.length,
//         itemBuilder: (context, index) {
//           final stock = filteredMedicines[index];
//           return InkWell(
//             onTap: () => _selectMedicine(stock),
//             child: Container(
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     stock["Medicine Name"],
//                     style: TextStyle(fontWeight: FontWeight.w500),
//                   ),
//                   Text(
//                     "Pack: ${stock["Tablets"]} | Price: Rs. ${stock["Pack Price"]}",
//                     style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice - $activeBill'),
//         centerTitle: true,
//         backgroundColor: const Color(0xFF008000),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _switchBill,
//             itemBuilder: (context) => bills.keys
//                 .map((bill) => PopupMenuItem(
//                       value: bill,
//                       child: Text(bill == activeBill ? "$bill (Active)" : bill),
//                     ))
//                 .toList(),
//           ),
//           IconButton(
//               onPressed: _createNewBill,
//               icon: const Icon(Icons.add),
//               tooltip: "New Bill"),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Header
//             Row(
//               children: [
//                 const Expanded(
//                   child: Text('Al-Shifa Medical',
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: const Text('الشفاء میڈیکل',
//                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             // Customer and business info
//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('NTN: $ntnNo'),
//                       Text('License No: $licenseNo'),
//                       Text('Print Time: ${_formatDateTime(DateTime.now())}'),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 240,
//                   child: _keyboardTextField(
//                     controller: customerController,
//                     focusNode: customerFocus,
//                     nextFocus: nameFocus,
//                     label: 'Customer Name',
//                   ),
//                 ),
//               ],
//             ),
//             const Divider(height: 24, thickness: 1),

//             // Medicine Input Section
//             Card(
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     // Medicine input row
//                     Row(
//                       children: [
//                         Expanded(
//                           flex: 3,
//                           child: Column(
//                             children: [
//                               _keyboardTextField(
//                                 controller: nameController,
//                                 focusNode: nameFocus,
//                                 nextFocus: qtyFocus,
//                                 prevFocus: customerFocus,
//                                 label: 'Medicine Name',
//                                 onChanged: (value) {
//                                   setState(() {
//                                     isManualRate = false;
//                                     filteredMedicines = value.isEmpty
//                                         ? []
//                                         : availableBox.values
//                                             .where((stock) => stock["Medicine Name"]
//                                                 .toString()
//                                                 .toLowerCase()
//                                                 .contains(value.toLowerCase()))
//                                             .cast<Map>()
//                                             .toList();
//                                   });
//                                 },
//                                 onEnter: () {
//                                   if (filteredMedicines.isNotEmpty) {
//                                     _selectMedicine(filteredMedicines.first);
//                                   }
//                                 },
//                               ),
//                               SizedBox(height: 4),
//                               _buildMedicineDropdown(),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           flex: 1,
//                           child: _keyboardTextField(
//                             controller: qtyController,
//                             focusNode: qtyFocus,
//                             nextFocus: priceFocus,
//                             prevFocus: nameFocus,
//                             label: 'Quantity',
//                             keyboardType: TextInputType.number,
//                             onChanged: (value) {
//                               if (!isManualRate && currentPerTabletRate > 0) {
//                                 final qty = int.tryParse(value) ?? 1;
//                                 setState(() {
//                                   priceController.text = (currentPerTabletRate * qty).toStringAsFixed(2);
//                                 });
//                               }
//                             },
//                             onEnter: addMedicine,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           flex: 1,
//                           child: _keyboardTextField(
//                             controller: priceController,
//                             focusNode: priceFocus,
//                             nextFocus: discountPercentFocus,
//                             prevFocus: qtyFocus,
//                             label: 'Unit Rate (Rs.)',
//                             keyboardType: TextInputType.number,
//                             readOnly: !isManualRate && currentPerTabletRate > 0,
//                             onChanged: (value) {
//                               if (value.isNotEmpty) {
//                                 setState(() {
//                                   isManualRate = true;
//                                 });
//                               }
//                             },
//                             onEnter: addMedicine,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Column(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.add, color: Colors.green),
//                               onPressed: addMedicine,
//                               tooltip: 'Add to cart',
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.edit, color: Colors.blue),
//                               onPressed: () {
//                                 setState(() {
//                                   isManualRate = true;
//                                   priceController.clear();
//                                   priceFocus.requestFocus();
//                                 });
//                               },
//                               tooltip: 'Manual rate',
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),

//                     // Manual entry toggle
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: isManualRate,
//                           onChanged: (value) {
//                             setState(() {
//                               isManualRate = value ?? false;
//                               if (!isManualRate) {
//                                 priceController.clear();
//                               }
//                             });
//                           },
//                         ),
//                         Text('Manual Rate Entry'),
//                         Spacer(),
//                         if (currentPerTabletRate > 0 && !isManualRate)
//                           Text('Auto Rate: Rs. ${currentPerTabletRate.toStringAsFixed(2)} per unit'),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             // Cart items table
//             Container(
//               constraints: BoxConstraints(maxHeight: 300),
//               child: SingleChildScrollView(
//                 child: DataTable(
//                   columnSpacing: 20,
//                   columns: const [
//                     DataColumn(label: Text('S.No')),
//                     DataColumn(label: Text('Medicine')),
//                     DataColumn(label: Text('Qty')),
//                     DataColumn(label: Text('Unit Rate')),
//                     DataColumn(label: Text('Total')),
//                     DataColumn(label: Text('Action')),
//                   ],
//                   rows: [
//                     for (int i = 0; i < cart.length; i++)
//                       DataRow(cells: [
//                         DataCell(Text('${i + 1}')),
//                         DataCell(
//                           Container(
//                             width: 120,
//                             child: Text(
//                               cart[i]['name'].toString(),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ),
//                         DataCell(Text(cart[i]['qty'].toString())),
//                         DataCell(Text('Rs. ${(cart[i]['unitPrice'] as double).toStringAsFixed(2)}')),
//                         DataCell(Text('Rs. ${(cart[i]['price'] as double).toStringAsFixed(2)}')),
//                         DataCell(
//                           Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                 icon: const Icon(Icons.edit, color: Colors.blue, size: 18),
//                                 onPressed: () {
//                                   // Edit item functionality
//                                   setState(() {
//                                     nameController.text = cart[i]['name'];
//                                     qtyController.text = cart[i]['qty'].toString();
//                                     priceController.text = (cart[i]['unitPrice'] as double).toStringAsFixed(2);
//                                     isManualRate = true;
//                                     cart.removeAt(i);
//                                     nameFocus.requestFocus();
//                                   });
//                                 },
//                                 tooltip: 'Edit',
//                               ),
//                               IconButton(
//                                 icon: const Icon(Icons.delete, color: Colors.red, size: 18),
//                                 onPressed: () {
//                                   setState(() {
//                                     cart.removeAt(i);
//                                   });
//                                 },
//                                 tooltip: 'Delete',
//                               ),
//                             ],
//                           ),
//                         ),
//                       ])
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             // Discount and totals section
//             Card(
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: _keyboardTextField(
//                             controller: discountPercentController,
//                             focusNode: discountPercentFocus,
//                             nextFocus: discountAmountFocus,
//                             keyboardType: TextInputType.number,
//                             label: 'Discount %',
//                             onChanged: (_) => setState(() {}),
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: _keyboardTextField(
//                             controller: discountAmountController,
//                             focusNode: discountAmountFocus,
//                             nextFocus: counterPersonFocus,
//                             prevFocus: discountPercentFocus,
//                             keyboardType: TextInputType.number,
//                             label: 'Discount Amount (Rs.)',
//                             onChanged: (_) => setState(() {}),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Items: ${cart.length}'),
//                             Text('Total Qty: ${cart.fold<int>(0, (sum, item) => sum + (item['qty'] as int))}'),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                             Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//                             Text(
//                               'Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             // Counter person and footer
//             Row(
//               children: [
//                 Expanded(
//                   child: _keyboardTextField(
//                     controller: counterPersonController,
//                     focusNode: counterPersonFocus,
//                     nextFocus: customerFocus,
//                     prevFocus: discountAmountFocus,
//                     rightFocus: customerFocus,
//                     leftFocus: discountAmountFocus,
//                     label: 'Counter Person Name',
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 const Text(
//                   'THANK YOU FOR SHOPPING',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 20),

//             // Action buttons
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _printThermalInvoice,
//                   icon: const Icon(Icons.print),
//                   label: const Text('Print Invoice (Thermal)'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _generatePdfInvoice,
//                   icon: const Icon(Icons.picture_as_pdf),
//                   label: const Text('Generate PDF'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     setState(() {
//                       bills[activeBill] = [];
//                       _clearInputs();
//                       customerController.clear();
//                       counterPersonController.clear();
//                       discountPercentController.clear();
//                       discountAmountController.clear();
//                     });
//                   },
//                   icon: const Icon(Icons.clear),
//                   label: const Text('Clear All'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // --- Printing and PDF functions remain the same with minor updates ---
//   Future<void> _printThermalInvoice() async {
//     bool isConnected = await printer.isConnected ?? false;
//     if (!isConnected) {
//       List<BluetoothDevice> devices = await printer.getBondedDevices();
//       if (devices.isNotEmpty)
//         await printer.connect(devices.first);
//       else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('No Bluetooth printer found!')));
//         return;
//       }
//     }

//     printer.printNewLine();
//     printer.printCustom("AL-SHIFA MEDICAL", 2, 1);
//     printer.printCustom("Invoice - $activeBill", 1, 1);
//     printer.printNewLine();
//     printer.printCustom("Customer: ${customerController.text}", 1, 0);
//     printer.printCustom("Counter: ${counterPersonController.text}", 1, 0);
//     printer.printCustom("Date: ${_formatDateTime(DateTime.now())}", 1, 0);
//     printer.printNewLine();

//     for (var item in cart) {
//       printer.printLeftRight(
//           "${item['name']} x${item['qty']}",
//           "Rs.${(item['unitPrice'] as double).toStringAsFixed(2)}",
//           1);
//       printer.printLeftRight("", "Rs.${(item['price'] as double).toStringAsFixed(2)}", 1);
//     }

//     printer.printNewLine();
//     printer.printLeftRight("Subtotal", "Rs.${subtotal.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Discount", "Rs.${discount.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Total", "Rs.${grandTotal.toStringAsFixed(2)}", 2);
//     printer.printNewLine();
//     printer.printCustom("THANK YOU FOR SHOPPING", 1, 1);
//     printer.printNewLine();
//     printer.paperCut();

//     viewsalesBox.add({
//       'billNo': activeBill,
//       'customer': customerController.text,
//       'counterPerson': counterPersonController.text,
//       'date': DateTime.now().toString(),
//       'items': cart,
//       'subtotal': subtotal,
//       'discount': discount,
//       'grandTotal': grandTotal,
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Invoice saved to sales history!')));
//   }

//   Future<void> _generatePdfInvoice() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         build: (context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text('AL-SHIFA MEDICAL',
//                   style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
//               pw.Text('Invoice - $activeBill', style: pw.TextStyle(fontSize: 18)),
//               pw.SizedBox(height: 10),
//               pw.Text('Customer: ${customerController.text}'),
//               pw.Text('Counter: ${counterPersonController.text}'),
//               pw.Text('Date: ${_formatDateTime(DateTime.now())}'),
//               pw.SizedBox(height: 10),
//               pw.Table.fromTextArray(
//                 headers: ['S.No', 'Medicine', 'Qty', 'Unit Rate', 'Total'],
//                 data: List.generate(cart.length, (index) {
//                   final item = cart[index];
//                   return [
//                     '${index + 1}',
//                     item['name'],
//                     item['qty'].toString(),
//                     'Rs. ${(item['unitPrice'] as double).toStringAsFixed(2)}',
//                     'Rs. ${(item['price'] as double).toStringAsFixed(2)}',
//                   ];
//                 }),
//               ),
//               pw.SizedBox(height: 10),
//               pw.Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//               pw.Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//               pw.Text('Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                   style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 20),
//               pw.Center(
//                   child: pw.Text('THANK YOU FOR SHOPPING',
//                       style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold))),
//             ],
//           );
//         },
//       ),
//     );

//     await Printing.layoutPdf(onLayout: (format) async => pdf.save());
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:blue_thermal_printer/blue_thermal_printer.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class InvoiceScreen extends StatefulWidget {
//   const InvoiceScreen({super.key});

//   @override
//   State<InvoiceScreen> createState() => _InvoiceScreenState();
// }

// class _InvoiceScreenState extends State<InvoiceScreen> {
//   final Map<String, List<Map<String, dynamic>>> bills = {};
//   String activeBill = "Bill_1";

//   final Box availableBox = Hive.box('availableBox');
//   final Box viewsalesBox = Hive.box('viewsalesBox');

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController qtyController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController customerController = TextEditingController();
//   final TextEditingController discountPercentController =
//       TextEditingController();
//   final TextEditingController discountAmountController =
//       TextEditingController();
//   final TextEditingController counterPersonController = TextEditingController();

//   final FocusNode nameFocus = FocusNode();
//   final FocusNode qtyFocus = FocusNode();
//   final FocusNode priceFocus = FocusNode();
//   final FocusNode customerFocus = FocusNode();
//   final FocusNode discountPercentFocus = FocusNode();
//   final FocusNode discountAmountFocus = FocusNode();
//   final FocusNode counterPersonFocus = FocusNode();

//   final String ntnNo = '#1234677';
//   final String licenseNo = 'LIC-987654';

//   List<Map> filteredMedicines = [];
//   double currentPerTabletRate = 0.0;
//   bool isManualRate = false;
//   int selectedMedicineIndex = -1;

//   final BlueThermalPrinter printer = BlueThermalPrinter.instance;

//   @override
//   void initState() {
//     super.initState();
//     bills[activeBill] = [];
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     qtyController.dispose();
//     priceController.dispose();
//     customerController.dispose();
//     discountPercentController.dispose();
//     discountAmountController.dispose();
//     counterPersonController.dispose();
//     nameFocus.dispose();
//     qtyFocus.dispose();
//     priceFocus.dispose();
//     customerFocus.dispose();
//     discountPercentFocus.dispose();
//     discountAmountFocus.dispose();
//     counterPersonFocus.dispose();
//     super.dispose();
//   }

//   List<Map<String, dynamic>> get cart => bills[activeBill] ?? [];

//   void addMedicine() {
//     final name = nameController.text.trim();
//     final int qty = int.tryParse(qtyController.text.trim()) ?? 1;
//     final double price = double.tryParse(priceController.text.trim()) ?? 0.0;

//     if (name.isEmpty || price <= 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Please fill all required fields!')));
//       return;
//     }

//     // If not manual rate, check stock
//     if (!isManualRate) {
//       final stock = availableBox.values.cast<Map>().firstWhere(
//             (m) =>
//                 m["Medicine Name"].toString().toLowerCase() ==
//                 name.toLowerCase(),
//             orElse: () => {},
//           );

//       if (stock.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//             content:
//                 Text('Medicine not found in stock! Use manual rate instead.')));
//         return;
//       }
//     }

//     setState(() {
//       cart.add({
//         'name': name,
//         'qty': qty,
//         'price': price * qty,
//         'unitPrice': price,
//       });
//       _clearInputs();
//       nameFocus.requestFocus();
//     });
//   }

//   void _clearInputs() {
//     nameController.clear();
//     qtyController.clear();
//     priceController.clear();
//     currentPerTabletRate = 0.0;
//     filteredMedicines = [];
//     selectedMedicineIndex = -1;
//     isManualRate = false;
//   }

//   void _createNewBill() {
//     final newKey = "Bill_${bills.length + 1}";
//     setState(() {
//       bills[newKey] = [];
//       activeBill = newKey;
//     });
//   }

//   void _switchBill(String key) {
//     setState(() {
//       activeBill = key;
//     });
//   }

//   double get subtotal =>
//       cart.fold<double>(0, (sum, item) => sum + (item['price'] as double));

//   double get discount {
//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;

//     if (discountAmountInput > 0) return discountAmountInput.clamp(0, subtotal);
//     if (discountPercentInput > 0)
//       return subtotal * (discountPercentInput / 100).clamp(0, 1);
//     return 0;
//   }

//   double get grandTotal => (subtotal - discount).clamp(0, double.infinity);

//   String _formatDateTime(DateTime dt) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
//   }

//   Widget _keyboardTextField({
//     required TextEditingController controller,
//     required FocusNode focusNode,
//     FocusNode? nextFocus,
//     FocusNode? prevFocus,
//     FocusNode? rightFocus,
//     FocusNode? leftFocus,
//     String? label,
//     TextInputType keyboardType = TextInputType.text,
//     bool readOnly = false,
//     void Function(String)? onChanged,
//     void Function()? onEnter,
//     bool isMedicineField = false,
//   }) {
//     return KeyboardListener(
//       focusNode: FocusNode(),
//       onKeyEvent: (event) {
//         if (event is KeyDownEvent && focusNode.hasFocus) {
//           if (isMedicineField && filteredMedicines.isNotEmpty) {
//             if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
//               setState(() {
//                 selectedMedicineIndex =
//                     (selectedMedicineIndex + 1) % filteredMedicines.length;
//               });
//               return;
//             } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
//               setState(() {
//                 selectedMedicineIndex = selectedMedicineIndex <= 0
//                     ? filteredMedicines.length - 1
//                     : selectedMedicineIndex - 1;
//               });
//               return;
//             } else if (event.logicalKey == LogicalKeyboardKey.enter) {
//               if (selectedMedicineIndex >= 0 &&
//                   selectedMedicineIndex < filteredMedicines.length) {
//                 _selectMedicine(filteredMedicines[selectedMedicineIndex]);
//               }
//               return;
//             } else if (event.logicalKey == LogicalKeyboardKey.escape) {
//               setState(() {
//                 filteredMedicines = [];
//                 selectedMedicineIndex = -1;
//               });
//               return;
//             } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
//               if (rightFocus != null) {
//                 rightFocus.requestFocus();
//               } else if (nextFocus != null) {
//                 nextFocus.requestFocus();
//               }
//               return;
//             } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
//               if (leftFocus != null) {
//                 leftFocus.requestFocus();
//               } else if (prevFocus != null) {
//                 prevFocus.requestFocus();
//               }
//               return;
//             }
//           }

//           if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
//             if (rightFocus != null) {
//               rightFocus.requestFocus();
//             } else if (nextFocus != null) {
//               nextFocus.requestFocus();
//             }
//           } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
//             if (leftFocus != null) {
//               leftFocus.requestFocus();
//             } else if (prevFocus != null) {
//               prevFocus.requestFocus();
//             }
//           } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
//             if (nextFocus != null) {
//               nextFocus.requestFocus();
//             }
//           } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
//             if (prevFocus != null) {
//               prevFocus.requestFocus();
//             }
//           } else if (event.logicalKey == LogicalKeyboardKey.tab) {
//             if (nextFocus != null) {
//               nextFocus.requestFocus();
//             }
//           } else if (event.logicalKey == LogicalKeyboardKey.enter &&
//               onEnter != null) {
//             onEnter();
//           }
//         }
//       },
//       child: TextField(
//         controller: controller,
//         focusNode: focusNode,
//         keyboardType: keyboardType,
//         readOnly: readOnly,
//         decoration: InputDecoration(
//           labelText: label,
//           isDense: true,
//           border: OutlineInputBorder(),
//           contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           suffixIcon: isMedicineField && filteredMedicines.isNotEmpty
//               ? Icon(Icons.keyboard_arrow_down)
//               : null,
//           helperText: isMedicineField
//               ? '↑↓: Navigate, →: Next field, Enter: Select, Esc: Close'
//               : null,
//           helperMaxLines: 2,
//         ),
//         onChanged: onChanged,
//         onSubmitted: (_) {
//           if (onEnter != null) onEnter();
//         },
//       ),
//     );
//   }

//   void _selectMedicine(Map stock) {
//     setState(() {
//       nameController.text = stock["Medicine Name"];
//       final int packSize = int.tryParse(stock["Tablets"].toString()) ?? 1;
//       final double packPrice =
//           double.tryParse(stock["Pack Price"].toString()) ?? 0.0;
//       currentPerTabletRate = packSize > 0 ? packPrice / packSize : 0;
//       qtyController.text = '1';
//       priceController.text = currentPerTabletRate.toStringAsFixed(2);
//       filteredMedicines = [];
//       selectedMedicineIndex = -1;
//       isManualRate = false;
//       qtyFocus.requestFocus();
//     });
//   }

//   Widget _buildMedicineDropdown() {
//     if (filteredMedicines.isEmpty) return const SizedBox.shrink();

//     return Container(
//       constraints: BoxConstraints(maxHeight: 200),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(4),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: filteredMedicines.length,
//         itemBuilder: (context, index) {
//           final stock = filteredMedicines[index];
//           final bool isSelected = index == selectedMedicineIndex;

//           return InkWell(
//             onTap: () => _selectMedicine(stock),
//             onHover: (hovering) {
//               if (hovering) {
//                 setState(() {
//                   selectedMedicineIndex = index;
//                 });
//               }
//             },
//             child: Container(
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: isSelected ? Colors.blue.shade100 : Colors.transparent,
//                 border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           stock["Medicine Name"],
//                           style: TextStyle(
//                             fontWeight:
//                                 isSelected ? FontWeight.w600 : FontWeight.w500,
//                             color: isSelected
//                                 ? Colors.blue.shade800
//                                 : Colors.black,
//                           ),
//                         ),
//                         Text(
//                           "Pack: ${stock["Tablets"]} tablets | Price: Rs. ${stock["Pack Price"]}",
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: isSelected
//                                 ? Colors.blue.shade600
//                                 : Colors.grey[600],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   if (isSelected)
//                     Icon(
//                       Icons.keyboard_arrow_right,
//                       color: Colors.blue.shade600,
//                     ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice - $activeBill'),
//         centerTitle: true,
//         backgroundColor: const Color(0xFF008000),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _switchBill,
//             itemBuilder: (context) => bills.keys
//                 .map((bill) => PopupMenuItem(
//                       value: bill,
//                       child: Text(bill == activeBill ? "$bill (Active)" : bill),
//                     ))
//                 .toList(),
//           ),
//           IconButton(
//               onPressed: _createNewBill,
//               icon: const Icon(Icons.add),
//               tooltip: "New Bill"),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Header
//             Row(
//               children: [
//                 const Expanded(
//                   child: Text('Al-Shifa Medical',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: const Text('الشفاء میڈیکل',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('NTN: $ntnNo'),
//                       Text('License No: $licenseNo'),
//                       Text('Print Time: ${_formatDateTime(DateTime.now())}'),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 240,
//                   child: _keyboardTextField(
//                     controller: customerController,
//                     focusNode: customerFocus,
//                     nextFocus: nameFocus,
//                     rightFocus: nameFocus,
//                     leftFocus: counterPersonFocus,
//                     label: 'Customer Name',
//                   ),
//                 ),
//               ],
//             ),
//             const Divider(height: 24, thickness: 1),

//             Card(
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           flex: 3,
//                           child: Column(
//                             children: [
//                               _keyboardTextField(
//                                 controller: nameController,
//                                 focusNode: nameFocus,
//                                 nextFocus: qtyFocus,
//                                 prevFocus: customerFocus,
//                                 rightFocus: qtyFocus,
//                                 leftFocus: customerFocus,
//                                 label: 'Medicine Name',
//                                 isMedicineField: true,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     isManualRate = false;
//                                     selectedMedicineIndex = -1;
//                                     filteredMedicines = value.isEmpty
//                                         ? []
//                                         : availableBox.values
//                                             .where((stock) =>
//                                                 stock["Medicine Name"]
//                                                     .toString()
//                                                     .toLowerCase()
//                                                     .contains(
//                                                         value.toLowerCase()))
//                                             .cast<Map>()
//                                             .toList();
//                                     if (filteredMedicines.isNotEmpty) {
//                                       selectedMedicineIndex =
//                                           0; // Auto-select first item
//                                     }
//                                   });
//                                 },
//                                 onEnter: () {
//                                   if (filteredMedicines.isNotEmpty &&
//                                       selectedMedicineIndex >= 0) {
//                                     _selectMedicine(filteredMedicines[
//                                         selectedMedicineIndex]);
//                                   } else {
//                                     // If no suggestions, move to next field
//                                     qtyFocus.requestFocus();
//                                   }
//                                 },
//                               ),
//                               SizedBox(height: 4),
//                               _buildMedicineDropdown(),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           flex: 1,
//                           child: _keyboardTextField(
//                             controller: qtyController,
//                             focusNode: qtyFocus,
//                             nextFocus: priceFocus,
//                             prevFocus: nameFocus,
//                             rightFocus: priceFocus,
//                             leftFocus: nameFocus,
//                             label: 'Quantity',
//                             keyboardType: TextInputType.number,
//                             onChanged: (value) {
//                               if (!isManualRate && currentPerTabletRate > 0) {
//                                 final qty = int.tryParse(value) ?? 1;
//                                 setState(() {
//                                   priceController.text =
//                                       (currentPerTabletRate * qty)
//                                           .toStringAsFixed(2);
//                                 });
//                               }
//                             },
//                             onEnter: addMedicine,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           flex: 1,
//                           child: _keyboardTextField(
//                             controller: priceController,
//                             focusNode: priceFocus,
//                             nextFocus: discountPercentFocus,
//                             prevFocus: qtyFocus,
//                             rightFocus: discountPercentFocus,
//                             leftFocus: qtyFocus,
//                             label: 'Unit Rate (Rs.)',
//                             keyboardType: TextInputType.number,
//                             readOnly: !isManualRate && currentPerTabletRate > 0,
//                             onChanged: (value) {
//                               if (value.isNotEmpty) {
//                                 setState(() {
//                                   isManualRate = true;
//                                 });
//                               }
//                             },
//                             onEnter: addMedicine,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Column(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.add, color: Colors.green),
//                               onPressed: addMedicine,
//                               tooltip: 'Add to cart',
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.edit, color: Colors.blue),
//                               onPressed: () {
//                                 setState(() {
//                                   isManualRate = true;
//                                   priceController.clear();
//                                   priceFocus.requestFocus();
//                                 });
//                               },
//                               tooltip: 'Manual rate',
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),

//                     // Manual entry toggle
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: isManualRate,
//                           onChanged: (value) {
//                             setState(() {
//                               isManualRate = value ?? false;
//                               if (!isManualRate) {
//                                 priceController.clear();
//                               }
//                             });
//                           },
//                         ),
//                         Text('Manual Rate Entry'),
//                         Spacer(),
//                         if (currentPerTabletRate > 0 && !isManualRate)
//                           Text(
//                               'Auto Rate: Rs. ${currentPerTabletRate.toStringAsFixed(2)} per unit'),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             Container(
//               constraints: BoxConstraints(maxHeight: 300),
//               child: SingleChildScrollView(
//                 child: DataTable(
//                   columnSpacing: 20,
//                   columns: const [
//                     DataColumn(label: Text('S.No')),
//                     DataColumn(label: Text('Medicine')),
//                     DataColumn(label: Text('Qty')),
//                     DataColumn(label: Text('Unit Rate')),
//                     DataColumn(label: Text('Total')),
//                     DataColumn(label: Text('Action')),
//                   ],
//                   rows: [
//                     for (int i = 0; i < cart.length; i++)
//                       DataRow(cells: [
//                         DataCell(Text('${i + 1}')),
//                         DataCell(
//                           Container(
//                             width: 120,
//                             child: Text(
//                               cart[i]['name'].toString(),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ),
//                         DataCell(Text(cart[i]['qty'].toString())),
//                         DataCell(Text(
//                             'Rs. ${(cart[i]['unitPrice'] as double).toStringAsFixed(2)}')),
//                         DataCell(Text(
//                             'Rs. ${(cart[i]['price'] as double).toStringAsFixed(2)}')),
//                         DataCell(
//                           Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                 icon: const Icon(Icons.edit,
//                                     color: Colors.blue, size: 18),
//                                 onPressed: () {
//                                   setState(() {
//                                     nameController.text = cart[i]['name'];
//                                     qtyController.text =
//                                         cart[i]['qty'].toString();
//                                     priceController.text =
//                                         (cart[i]['unitPrice'] as double)
//                                             .toStringAsFixed(2);
//                                     isManualRate = true;
//                                     cart.removeAt(i);
//                                     nameFocus.requestFocus();
//                                   });
//                                 },
//                                 tooltip: 'Edit',
//                               ),
//                               IconButton(
//                                 icon: const Icon(Icons.delete,
//                                     color: Colors.red, size: 18),
//                                 onPressed: () {
//                                   setState(() {
//                                     cart.removeAt(i);
//                                   });
//                                 },
//                                 tooltip: 'Delete',
//                               ),
//                             ],
//                           ),
//                         ),
//                       ])
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             Card(
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: _keyboardTextField(
//                             controller: discountPercentController,
//                             focusNode: discountPercentFocus,
//                             nextFocus: discountAmountFocus,
//                             prevFocus: priceFocus,
//                             rightFocus: discountAmountFocus,
//                             leftFocus: priceFocus,
//                             keyboardType: TextInputType.number,
//                             label: 'Discount %',
//                             onChanged: (_) => setState(() {}),
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: _keyboardTextField(
//                             controller: discountAmountController,
//                             focusNode: discountAmountFocus,
//                             nextFocus: counterPersonFocus,
//                             prevFocus: discountPercentFocus,
//                             rightFocus: counterPersonFocus,
//                             leftFocus: discountPercentFocus,
//                             keyboardType: TextInputType.number,
//                             label: 'Discount Amount (Rs.)',
//                             onChanged: (_) => setState(() {}),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Items: ${cart.length}'),
//                             Text(
//                                 'Total Qty: ${cart.fold<int>(0, (sum, item) => sum + (item['qty'] as int))}'),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text(
//                                 'Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                             Text(
//                                 'Discount: Rs. ${discount.toStringAsFixed(2)}'),
//                             Text(
//                               'Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 18),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             Row(
//               children: [
//                 Expanded(
//                   child: _keyboardTextField(
//                     controller: counterPersonController,
//                     focusNode: counterPersonFocus,
//                     nextFocus: customerFocus,
//                     prevFocus: discountAmountFocus,
//                     rightFocus: customerFocus,
//                     leftFocus: discountAmountFocus,
//                     label: 'Counter Person Name',
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 const Text(
//                   'THANK YOU FOR SHOPPING',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 20),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _printThermalInvoice,
//                   icon: const Icon(Icons.print),
//                   label: const Text('Print Invoice (Thermal)'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _generatePdfInvoice,
//                   icon: const Icon(Icons.picture_as_pdf),
//                   label: const Text('Generate PDF'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     setState(() {
//                       bills[activeBill] = [];
//                       _clearInputs();
//                       customerController.clear();
//                       counterPersonController.clear();
//                       discountPercentController.clear();
//                       discountAmountController.clear();
//                     });
//                   },
//                   icon: const Icon(Icons.clear),
//                   label: const Text('Clear All'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _printThermalInvoice() async {
//     bool isConnected = await printer.isConnected ?? false;
//     if (!isConnected) {
//       List<BluetoothDevice> devices = await printer.getBondedDevices();
//       if (devices.isNotEmpty)
//         await printer.connect(devices.first);
//       else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('No Bluetooth printer found!')));
//         return;
//       }
//     }

//     printer.printNewLine();
//     printer.printCustom("AL-SHIFA MEDICAL", 2, 1);
//     printer.printCustom("Invoice - $activeBill", 1, 1);
//     printer.printNewLine();
//     printer.printCustom("Customer: ${customerController.text}", 1, 0);
//     printer.printCustom("Counter: ${counterPersonController.text}", 1, 0);
//     printer.printCustom("Date: ${_formatDateTime(DateTime.now())}", 1, 0);
//     printer.printNewLine();

//     for (var item in cart) {
//       printer.printLeftRight("${item['name']} x${item['qty']}",
//           "Rs.${(item['unitPrice'] as double).toStringAsFixed(2)}", 1);
//       printer.printLeftRight(
//           "", "Rs.${(item['price'] as double).toStringAsFixed(2)}", 1);
//     }

//     printer.printNewLine();
//     printer.printLeftRight("Subtotal", "Rs.${subtotal.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Discount", "Rs.${discount.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Total", "Rs.${grandTotal.toStringAsFixed(2)}", 2);
//     printer.printNewLine();
//     printer.printCustom("THANK YOU FOR SHOPPING", 1, 1);
//     printer.printNewLine();
//     printer.paperCut();

//     viewsalesBox.add({
//       'billNo': activeBill,
//       'customer': customerController.text,
//       'counterPerson': counterPersonController.text,
//       'date': DateTime.now().toString(),
//       'items': cart,
//       'subtotal': subtotal,
//       'discount': discount,
//       'grandTotal': grandTotal,
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Invoice saved to sales history!')));
//   }

//   Future<void> _generatePdfInvoice() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         build: (context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text('AL-SHIFA MEDICAL',
//                   style: pw.TextStyle(
//                       fontSize: 24, fontWeight: pw.FontWeight.bold)),
//               pw.Text('Invoice - $activeBill',
//                   style: pw.TextStyle(fontSize: 18)),
//               pw.SizedBox(height: 10),
//               pw.Text('Customer: ${customerController.text}'),
//               pw.Text('Counter: ${counterPersonController.text}'),
//               pw.Text('Date: ${_formatDateTime(DateTime.now())}'),
//               pw.SizedBox(height: 10),
//               pw.Table.fromTextArray(
//                 headers: ['S.No', 'Medicine', 'Qty', 'Unit Rate', 'Total'],
//                 data: List.generate(cart.length, (index) {
//                   final item = cart[index];
//                   return [
//                     '${index + 1}',
//                     item['name'],
//                     item['qty'].toString(),
//                     'Rs. ${(item['unitPrice'] as double).toStringAsFixed(2)}',
//                     'Rs. ${(item['price'] as double).toStringAsFixed(2)}',
//                   ];
//                 }),
//               ),
//               pw.SizedBox(height: 10),
//               pw.Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//               pw.Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//               pw.Text('Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                   style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 20),
//               pw.Center(
//                   child: pw.Text('THANK YOU FOR SHOPPING',
//                       style: pw.TextStyle(
//                           fontSize: 16, fontWeight: pw.FontWeight.bold))),
//             ],
//           );
//         },
//       ),
//     );

//     await Printing.layoutPdf(onLayout: (format) async => pdf.save());
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:blue_thermal_printer/blue_thermal_printer.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class InvoiceScreen extends StatefulWidget {
//   const InvoiceScreen({super.key});

//   @override
//   State<InvoiceScreen> createState() => _InvoiceScreenState();
// }

// class _InvoiceScreenState extends State<InvoiceScreen> {
//   final Map<String, List<Map<String, dynamic>>> bills = {};
//   String activeBill = "Bill_1";

//   final Box availableBox = Hive.box('availableBox');
//   final Box viewsalesBox = Hive.box('viewsalesBox');

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController qtyController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController customerController = TextEditingController();
//   final TextEditingController discountPercentController =
//       TextEditingController();
//   final TextEditingController discountAmountController =
//       TextEditingController();
//   final TextEditingController counterPersonController = TextEditingController();

//   final FocusNode nameFocus = FocusNode();
//   final FocusNode qtyFocus = FocusNode();
//   final FocusNode priceFocus = FocusNode();
//   final FocusNode customerFocus = FocusNode();
//   final FocusNode discountPercentFocus = FocusNode();
//   final FocusNode discountAmountFocus = FocusNode();
//   final FocusNode counterPersonFocus = FocusNode();

//   final String ntnNo = '#1234677';
//   final String licenseNo = 'LIC-987654';

//   List<Map> filteredMedicines = [];
//   double currentPerTabletRate = 0.0;
//   bool isManualRate = false;
//   int selectedMedicineIndex = -1;

//   final BlueThermalPrinter printer = BlueThermalPrinter.instance;

//   @override
//   void initState() {
//     super.initState();
//     bills[activeBill] = [];
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     qtyController.dispose();
//     priceController.dispose();
//     customerController.dispose();
//     discountPercentController.dispose();
//     discountAmountController.dispose();
//     counterPersonController.dispose();
//     nameFocus.dispose();
//     qtyFocus.dispose();
//     priceFocus.dispose();
//     customerFocus.dispose();
//     discountPercentFocus.dispose();
//     discountAmountFocus.dispose();
//     counterPersonFocus.dispose();
//     super.dispose();
//   }

//   List<Map<String, dynamic>> get cart => bills[activeBill] ?? [];

//   void addMedicine() {
//     final name = nameController.text.trim();
//     final int qty = int.tryParse(qtyController.text.trim()) ?? 1;
//     final double price = double.tryParse(priceController.text.trim()) ?? 0.0;

//     if (name.isEmpty || price <= 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Please fill all required fields!')));
//       return;
//     }

//     if (!isManualRate) {
//       final stock = availableBox.values.cast<Map>().firstWhere(
//             (m) =>
//                 m["Medicine Name"].toString().toLowerCase() ==
//                 name.toLowerCase(),
//             orElse: () => {},
//           );

//       if (stock.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//             content:
//                 Text('Medicine not found in stock! Use manual rate instead.')));
//         return;
//       }
//     }

//     setState(() {
//       cart.add({
//         'name': name,
//         'qty': qty,
//         'price': price * qty,
//         'unitPrice': price,
//       });
//       _clearInputs();
//       nameFocus.requestFocus();
//     });
//   }

//   void _clearInputs() {
//     nameController.clear();
//     qtyController.clear();
//     priceController.clear();
//     currentPerTabletRate = 0.0;
//     filteredMedicines = [];
//     selectedMedicineIndex = -1;
//     isManualRate = false;
//   }

//   void _createNewBill() {
//     final newKey = "Bill_${bills.length + 1}";
//     setState(() {
//       bills[newKey] = [];
//       activeBill = newKey;
//     });
//   }

//   void _switchBill(String key) {
//     setState(() {
//       activeBill = key;
//     });
//   }

//   double get subtotal =>
//       cart.fold<double>(0, (sum, item) => sum + (item['price'] as double));

//   double get discount {
//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;

//     if (discountAmountInput > 0) return discountAmountInput.clamp(0, subtotal);
//     if (discountPercentInput > 0)
//       return subtotal * (discountPercentInput / 100).clamp(0, 1);
//     return 0;
//   }

//   double get grandTotal => (subtotal - discount).clamp(0, double.infinity);

//   String _formatDateTime(DateTime dt) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
//   }

//   Widget _keyboardTextField({
//     required TextEditingController controller,
//     required FocusNode focusNode,
//     FocusNode? nextFocus,
//     FocusNode? prevFocus,
//     FocusNode? rightFocus,
//     FocusNode? leftFocus,
//     String? label,
//     TextInputType keyboardType = TextInputType.text,
//     bool readOnly = false,
//     void Function(String)? onChanged,
//     void Function()? onEnter,
//     bool isMedicineField = false,
//   }) {
//     return KeyboardListener(
//       focusNode: FocusNode(),
//       onKeyEvent: (event) {
//         if (event is KeyDownEvent && focusNode.hasFocus) {
//           if (isMedicineField && filteredMedicines.isNotEmpty) {
//             if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
//               setState(() {
//                 selectedMedicineIndex =
//                     (selectedMedicineIndex + 1) % filteredMedicines.length;
//               });
//               return;
//             } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
//               setState(() {
//                 selectedMedicineIndex = selectedMedicineIndex <= 0
//                     ? filteredMedicines.length - 1
//                     : selectedMedicineIndex - 1;
//               });
//               return;
//             } else if (event.logicalKey == LogicalKeyboardKey.enter) {
//               if (selectedMedicineIndex >= 0 &&
//                   selectedMedicineIndex < filteredMedicines.length) {
//                 _selectMedicine(filteredMedicines[selectedMedicineIndex]);
//                 qtyFocus
//                     .requestFocus(); // ✅ Go to quantity field, don’t add directly
//               }
//               return;
//             } else if (event.logicalKey == LogicalKeyboardKey.escape) {
//               setState(() {
//                 filteredMedicines = [];
//                 selectedMedicineIndex = -1;
//               });
//               return;
//             }
//           }
//           if (event.logicalKey == LogicalKeyboardKey.enter && onEnter != null) {
//             onEnter();
//           }
//         }
//       },
//       child: TextField(
//         controller: controller,
//         focusNode: focusNode,
//         keyboardType: keyboardType,
//         readOnly: readOnly,
//         decoration: InputDecoration(
//           labelText: label,
//           isDense: true,
//           border: OutlineInputBorder(),
//           contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           suffixIcon: isMedicineField && filteredMedicines.isNotEmpty
//               ? Icon(Icons.keyboard_arrow_down)
//               : null,
//           helperText: isMedicineField
//               ? '↑↓: Navigate, Enter: Select (then enter Qty), Esc: Close'
//               : null,
//           helperMaxLines: 2,
//         ),
//         onChanged: onChanged,
//         onSubmitted: (_) {
//           if (onEnter != null) onEnter();
//         },
//       ),
//     );
//   }

//   void _selectMedicine(Map stock) {
//     setState(() {
//       nameController.text = stock["Medicine Name"];
//       final int packSize = int.tryParse(stock["Tablets"].toString()) ?? 1;
//       final double packPrice =
//           double.tryParse(stock["Pack Price"].toString()) ?? 0.0;
//       currentPerTabletRate = packSize > 0 ? packPrice / packSize : 0;
//       qtyController.text = ''; // ✅ Clear qty, wait for user input
//       priceController.text = '';
//       filteredMedicines = [];
//       selectedMedicineIndex = -1;
//       isManualRate = false;
//     });
//   }

//   Widget _buildMedicineDropdown() {
//     if (filteredMedicines.isEmpty) return const SizedBox.shrink();

//     return Container(
//       constraints: BoxConstraints(maxHeight: 200),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(4),
//         color: Colors.white,
//       ),
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: filteredMedicines.length,
//         itemBuilder: (context, index) {
//           final stock = filteredMedicines[index];
//           final bool isSelected = index == selectedMedicineIndex;

//           return InkWell(
//             onTap: () {
//               _selectMedicine(stock);
//               qtyFocus.requestFocus(); // ✅ Focus qty on mouse tap too
//             },
//             child: Container(
//               padding: EdgeInsets.all(12),
//               color: isSelected ? Colors.blue.shade100 : null,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(stock["Medicine Name"]),
//                         Text(
//                             "Pack: ${stock["Tablets"]}, Rs. ${stock["Pack Price"]}"),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice - $activeBill'),
//         centerTitle: true,
//         backgroundColor: const Color(0xFF008000),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _switchBill,
//             itemBuilder: (context) => bills.keys
//                 .map((bill) => PopupMenuItem(
//                       value: bill,
//                       child: Text(bill == activeBill ? "$bill (Active)" : bill),
//                     ))
//                 .toList(),
//           ),
//           IconButton(
//               onPressed: _createNewBill,
//               icon: const Icon(Icons.add),
//               tooltip: "New Bill"),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Header
//             Row(
//               children: [
//                 const Expanded(
//                   child: Text('Al-Shifa Medical',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: const Text('الشفاء میڈیکل',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('NTN: $ntnNo'),
//                       Text('License No: $licenseNo'),
//                       Text('Print Time: ${_formatDateTime(DateTime.now())}'),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 240,
//                   child: _keyboardTextField(
//                     controller: customerController,
//                     focusNode: customerFocus,
//                     nextFocus: nameFocus,
//                     rightFocus: nameFocus,
//                     leftFocus: counterPersonFocus,
//                     label: 'Customer Name',
//                   ),
//                 ),
//               ],
//             ),
//             const Divider(height: 24, thickness: 1),

//             Card(
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           flex: 3,
//                           child: Column(
//                             children: [
//                               _keyboardTextField(
//                                 controller: nameController,
//                                 focusNode: nameFocus,
//                                 nextFocus: qtyFocus,
//                                 prevFocus: customerFocus,
//                                 rightFocus: qtyFocus,
//                                 leftFocus: customerFocus,
//                                 label: 'Medicine Name',
//                                 isMedicineField: true,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     isManualRate = false;
//                                     selectedMedicineIndex = -1;
//                                     filteredMedicines = value.isEmpty
//                                         ? []
//                                         : availableBox.values
//                                             .where((stock) =>
//                                                 stock["Medicine Name"]
//                                                     .toString()
//                                                     .toLowerCase()
//                                                     .contains(
//                                                         value.toLowerCase()))
//                                             .cast<Map>()
//                                             .toList();
//                                     if (filteredMedicines.isNotEmpty) {
//                                       selectedMedicineIndex =
//                                           0; // Auto-select first item
//                                     }
//                                   });
//                                 },
//                                 onEnter: () {
//                                   if (filteredMedicines.isNotEmpty &&
//                                       selectedMedicineIndex >= 0) {
//                                     _selectMedicine(filteredMedicines[
//                                         selectedMedicineIndex]);
//                                   } else {
//                                     // If no suggestions, move to next field
//                                     qtyFocus.requestFocus();
//                                   }
//                                 },
//                               ),
//                               SizedBox(height: 4),
//                               _buildMedicineDropdown(),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           flex: 1,
//                           child: _keyboardTextField(
//                             controller: qtyController,
//                             focusNode: qtyFocus,
//                             nextFocus: priceFocus,
//                             prevFocus: nameFocus,
//                             rightFocus: priceFocus,
//                             leftFocus: nameFocus,
//                             label: 'Quantity',
//                             keyboardType: TextInputType.number,
//                             onChanged: (value) {
//                               if (!isManualRate && currentPerTabletRate > 0) {
//                                 final qty = int.tryParse(value) ?? 1;
//                                 setState(() {
//                                   priceController.text =
//                                       (currentPerTabletRate * qty)
//                                           .toStringAsFixed(2);
//                                 });
//                               }
//                             },
//                             onEnter: addMedicine,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           flex: 1,
//                           child: _keyboardTextField(
//                             controller: priceController,
//                             focusNode: priceFocus,
//                             nextFocus: discountPercentFocus,
//                             prevFocus: qtyFocus,
//                             rightFocus: discountPercentFocus,
//                             leftFocus: qtyFocus,
//                             label: 'Unit Rate (Rs.)',
//                             keyboardType: TextInputType.number,
//                             readOnly: !isManualRate && currentPerTabletRate > 0,
//                             onChanged: (value) {
//                               if (value.isNotEmpty) {
//                                 setState(() {
//                                   isManualRate = true;
//                                 });
//                               }
//                             },
//                             onEnter: addMedicine,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Column(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.add, color: Colors.green),
//                               onPressed: addMedicine,
//                               tooltip: 'Add to cart',
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.edit, color: Colors.blue),
//                               onPressed: () {
//                                 setState(() {
//                                   isManualRate = true;
//                                   priceController.clear();
//                                   priceFocus.requestFocus();
//                                 });
//                               },
//                               tooltip: 'Manual rate',
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),

//                     // Manual entry toggle
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: isManualRate,
//                           onChanged: (value) {
//                             setState(() {
//                               isManualRate = value ?? false;
//                               if (!isManualRate) {
//                                 priceController.clear();
//                               }
//                             });
//                           },
//                         ),
//                         Text('Manual Rate Entry'),
//                         Spacer(),
//                         if (currentPerTabletRate > 0 && !isManualRate)
//                           Text(
//                               'Auto Rate: Rs. ${currentPerTabletRate.toStringAsFixed(2)} per unit'),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             Container(
//               constraints: BoxConstraints(maxHeight: 300),
//               child: SingleChildScrollView(
//                 child: DataTable(
//                   columnSpacing: 20,
//                   columns: const [
//                     DataColumn(label: Text('S.No')),
//                     DataColumn(label: Text('Medicine')),
//                     DataColumn(label: Text('Qty')),
//                     DataColumn(label: Text('Unit Rate')),
//                     DataColumn(label: Text('Total')),
//                     DataColumn(label: Text('Action')),
//                   ],
//                   rows: [
//                     for (int i = 0; i < cart.length; i++)
//                       DataRow(cells: [
//                         DataCell(Text('${i + 1}')),
//                         DataCell(
//                           Container(
//                             width: 120,
//                             child: Text(
//                               cart[i]['name'].toString(),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ),
//                         DataCell(Text(cart[i]['qty'].toString())),
//                         DataCell(Text(
//                             'Rs. ${(cart[i]['unitPrice'] as double).toStringAsFixed(2)}')),
//                         DataCell(Text(
//                             'Rs. ${(cart[i]['price'] as double).toStringAsFixed(2)}')),
//                         DataCell(
//                           Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                 icon: const Icon(Icons.edit,
//                                     color: Colors.blue, size: 18),
//                                 onPressed: () {
//                                   setState(() {
//                                     nameController.text = cart[i]['name'];
//                                     qtyController.text =
//                                         cart[i]['qty'].toString();
//                                     priceController.text =
//                                         (cart[i]['unitPrice'] as double)
//                                             .toStringAsFixed(2);
//                                     isManualRate = true;
//                                     cart.removeAt(i);
//                                     nameFocus.requestFocus();
//                                   });
//                                 },
//                                 tooltip: 'Edit',
//                               ),
//                               IconButton(
//                                 icon: const Icon(Icons.delete,
//                                     color: Colors.red, size: 18),
//                                 onPressed: () {
//                                   setState(() {
//                                     cart.removeAt(i);
//                                   });
//                                 },
//                                 tooltip: 'Delete',
//                               ),
//                             ],
//                           ),
//                         ),
//                       ])
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             Card(
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: _keyboardTextField(
//                             controller: discountPercentController,
//                             focusNode: discountPercentFocus,
//                             nextFocus: discountAmountFocus,
//                             prevFocus: priceFocus,
//                             rightFocus: discountAmountFocus,
//                             leftFocus: priceFocus,
//                             keyboardType: TextInputType.number,
//                             label: 'Discount %',
//                             onChanged: (_) => setState(() {}),
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: _keyboardTextField(
//                             controller: discountAmountController,
//                             focusNode: discountAmountFocus,
//                             nextFocus: counterPersonFocus,
//                             prevFocus: discountPercentFocus,
//                             rightFocus: counterPersonFocus,
//                             leftFocus: discountPercentFocus,
//                             keyboardType: TextInputType.number,
//                             label: 'Discount Amount (Rs.)',
//                             onChanged: (_) => setState(() {}),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Items: ${cart.length}'),
//                             Text(
//                                 'Total Qty: ${cart.fold<int>(0, (sum, item) => sum + (item['qty'] as int))}'),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text(
//                                 'Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                             Text(
//                                 'Discount: Rs. ${discount.toStringAsFixed(2)}'),
//                             Text(
//                               'Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 18),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             Row(
//               children: [
//                 Expanded(
//                   child: _keyboardTextField(
//                     controller: counterPersonController,
//                     focusNode: counterPersonFocus,
//                     nextFocus: customerFocus,
//                     prevFocus: discountAmountFocus,
//                     rightFocus: customerFocus,
//                     leftFocus: discountAmountFocus,
//                     label: 'Counter Person Name',
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 const Text(
//                   'THANK YOU FOR SHOPPING',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 20),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _printThermalInvoice,
//                   icon: const Icon(Icons.print),
//                   label: const Text('Print Invoice (Thermal)'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _generatePdfInvoice,
//                   icon: const Icon(Icons.picture_as_pdf),
//                   label: const Text('Generate PDF'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     setState(() {
//                       bills[activeBill] = [];
//                       _clearInputs();
//                       customerController.clear();
//                       counterPersonController.clear();
//                       discountPercentController.clear();
//                       discountAmountController.clear();
//                     });
//                   },
//                   icon: const Icon(Icons.clear),
//                   label: const Text('Clear All'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _printThermalInvoice() async {
//     bool isConnected = await printer.isConnected ?? false;
//     if (!isConnected) {
//       List<BluetoothDevice> devices = await printer.getBondedDevices();
//       if (devices.isNotEmpty)
//         await printer.connect(devices.first);
//       else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('No Bluetooth printer found!')));
//         return;
//       }
//     }

//     printer.printNewLine();
//     printer.printCustom("AL-SHIFA MEDICAL", 2, 1);
//     printer.printCustom("Invoice - $activeBill", 1, 1);
//     printer.printNewLine();
//     printer.printCustom("Customer: ${customerController.text}", 1, 0);
//     printer.printCustom("Counter: ${counterPersonController.text}", 1, 0);
//     printer.printCustom("Date: ${_formatDateTime(DateTime.now())}", 1, 0);
//     printer.printNewLine();

//     for (var item in cart) {
//       printer.printLeftRight("${item['name']} x${item['qty']}",
//           "Rs.${(item['unitPrice'] as double).toStringAsFixed(2)}", 1);
//       printer.printLeftRight(
//           "", "Rs.${(item['price'] as double).toStringAsFixed(2)}", 1);
//     }

//     printer.printNewLine();
//     printer.printLeftRight("Subtotal", "Rs.${subtotal.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Discount", "Rs.${discount.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Total", "Rs.${grandTotal.toStringAsFixed(2)}", 2);
//     printer.printNewLine();
//     printer.printCustom("THANK YOU FOR SHOPPING", 1, 1);
//     printer.printNewLine();
//     printer.paperCut();

//     viewsalesBox.add({
//       'billNo': activeBill,
//       'customer': customerController.text,
//       'counterPerson': counterPersonController.text,
//       'date': DateTime.now().toString(),
//       'items': cart,
//       'subtotal': subtotal,
//       'discount': discount,
//       'grandTotal': grandTotal,
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Invoice saved to sales history!')));
//   }

//   Future<void> _generatePdfInvoice() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         build: (context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text('AL-SHIFA MEDICAL',
//                   style: pw.TextStyle(
//                       fontSize: 24, fontWeight: pw.FontWeight.bold)),
//               pw.Text('Invoice - $activeBill',
//                   style: pw.TextStyle(fontSize: 18)),
//               pw.SizedBox(height: 10),
//               pw.Text('Customer: ${customerController.text}'),
//               pw.Text('Counter: ${counterPersonController.text}'),
//               pw.Text('Date: ${_formatDateTime(DateTime.now())}'),
//               pw.SizedBox(height: 10),
//               pw.Table.fromTextArray(
//                 headers: ['S.No', 'Medicine', 'Qty', 'Unit Rate', 'Total'],
//                 data: List.generate(cart.length, (index) {
//                   final item = cart[index];
//                   return [
//                     '${index + 1}',
//                     item['name'],
//                     item['qty'].toString(),
//                     'Rs. ${(item['unitPrice'] as double).toStringAsFixed(2)}',
//                     'Rs. ${(item['price'] as double).toStringAsFixed(2)}',
//                   ];
//                 }),
//               ),
//               pw.SizedBox(height: 10),
//               pw.Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//               pw.Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//               pw.Text('Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                   style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 20),
//               pw.Center(
//                   child: pw.Text('THANK YOU FOR SHOPPING',
//                       style: pw.TextStyle(
//                           fontSize: 16, fontWeight: pw.FontWeight.bold))),
//             ],
//           );
//         },
//       ),
//     );

//     await Printing.layoutPdf(onLayout: (format) async => pdf.save());
//   }
// }// import 'package:flutter/material.dart';

// class Alldistributor extends StatefulWidget {
//   const Alldistributor({super.key});

//   @override
//   State<Alldistributor> createState() => _AlldistributorState();
// }

// class _AlldistributorState extends State<Alldistributor> {
//   static const String routeName = '/alldistributor';
//   List<Map<String, dynamic>> distributor = [

//   ];
//   void _adddDistributor() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final nameController = TextEditingController();
//         final mangerNameController = TextEditingController();
//         final managerNumberController = TextEditingController();
//         final bookingMan1NumberController = TextEditingController();
//         final bookingMan2NumberController = TextEditingController();
//         final bookingManName1Controller = TextEditingController();
//         final bookingManName2Controller = TextEditingController();
//         final supplyManNameController = TextEditingController();
//         final supplyManNumberController = TextEditingController();
//         return AlertDialog(
//           title: const Text('Add Distributor'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,

//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Distributor Name',
//                 ),
//               ),
//               TextField(
//                 controller: mangerNameController,
//                 decoration: const InputDecoration(labelText: 'Manager Name'),
//               ),
//               TextField(
//                 controller: managerNumberController,
//                 decoration: const InputDecoration(labelText: 'Manager Number'),
//               ),
//               TextField(
//                 controller: bookingManName1Controller,
//                 decoration: const InputDecoration(labelText: "Booking Man1"),
//               ),
//               TextField(
//                 controller: bookingMan1NumberController,
//                 decoration: const InputDecoration(
//                   labelText: "Booking 1 Number",
//                 ),
//               ),
//               TextField(
//                 controller: bookingManName2Controller,
//                 decoration: const InputDecoration(labelText: "Booking Man2"),
//               ),
//               TextField(
//                 controller: bookingMan2NumberController,
//                 decoration: const InputDecoration(
//                   labelText: "Booking 2 Number",
//                 ),
//               ),
//               TextField(
//                 controller: supplyManNameController,
//                 decoration: const InputDecoration(labelText: "Supply Man Name"),
//               ),
//               TextField(
//                 controller: supplyManNumberController,
//                 decoration: const InputDecoration(
//                   labelText: "Supply Man Number",
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     distributor.add({
//                       "Name": nameController.text,
//                       "ManagerName": mangerNameController.text,
//                       "ManagerNumber": managerNumberController.text,
//                       "BookingMan1": bookingManName1Controller.text,
//                       "BookingMan1Number": bookingMan1NumberController.text,
//                       "BookingMan2": bookingManName2Controller.text,
//                       "BookingMan2Number": bookingMan2NumberController.text,
//                       "SupplyManName": supplyManNameController.text,
//                       "SupplyManNumber": supplyManNumberController.text,
//                     });
//                   });
//                   Navigator.pop(context);
//                 },
//                 child: Text('Add '),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void editDistributor(Map<String, dynamic> distributor) {
//     final nameController = TextEditingController(text: distributor['Name']);
//     final managerNameController = TextEditingController(
//       text: distributor['ManagerName'],
//     );
//     final managerNumberController = TextEditingController(
//       text: distributor['ManagerNumber'],
//     );
//     final bookingManName1Controller = TextEditingController(
//       text: distributor['BookingMan1'],
//     );
//     final bookingMan1NumberController = TextEditingController(
//       text: distributor['BookingMan1Number'],
//     );
//     final bookingManName2Controller = TextEditingController(
//       text: distributor['BookingMan2'],
//     );
//     final bookingMan2NumberController = TextEditingController(
//       text: distributor['BookingMan2Number'],
//     );
//     final supplyManNameController = TextEditingController(
//       text: distributor['SupplyManName'],
//     );
//     final supplyManNumberController = TextEditingController(
//       text: distributor['SupplyManNumber'],
//     );
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Edit Distributor "),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Distributor Name',
//                 ),
//               ),
//               TextField(
//                 controller: managerNameController,
//                 decoration: const InputDecoration(labelText: 'Manager Name'),
//               ),
//               TextField(
//                 controller: managerNumberController,
//                 decoration: const InputDecoration(labelText: 'Manager Number'),
//               ),
//               TextField(
//                 controller: bookingManName1Controller,
//                 decoration: const InputDecoration(labelText: "Booking Man1"),
//               ),
//               TextField(
//                 controller: bookingMan1NumberController,
//                 decoration: const InputDecoration(
//                   labelText: "Booking 1 Number",
//                 ),
//               ),
//               TextField(
//                 controller: bookingManName2Controller,
//                 decoration: const InputDecoration(labelText: "Booking Man2"),
//               ),
//               TextField(
//                 controller: bookingMan2NumberController,
//                 decoration: const InputDecoration(
//                   labelText: "Booking 2 Number",
//                 ),
//               ),
//               TextField(
//                 controller: supplyManNameController,
//                 decoration: const InputDecoration(labelText: "Supply Man Name"),
//               ),
//               TextField(
//                 controller: supplyManNumberController,
//                 decoration: const InputDecoration(
//                   labelText: "Supply Man Number",
//                 ),
//               ),
//               SizedBox(height: 15),

//               Row(
//                 children: [
//                   ElevatedButton(onPressed: () {}, child: Text("Cancel")),
//                   SizedBox(width: 15),
//                   ElevatedButton(
//                     onPressed: () {
//                       distributor["Name"] =
//                           nameController.text.isEmpty
//                               ? null
//                               : nameController.text;
//                       distributor["ManagerName"] =
//                           managerNameController.text.isEmpty
//                               ? null
//                               : managerNameController.text;
//                       distributor["ManagerNumber"] =
//                           managerNumberController.text.isEmpty
//                               ? null
//                               : managerNumberController.text;
//                       distributor["BookingMan1"] =
//                           bookingManName1Controller.text.isEmpty
//                               ? null
//                               : bookingManName1Controller.text;
//                       distributor["BookingMan1Number"] =
//                           bookingMan1NumberController.text.isEmpty
//                               ? null
//                               : bookingMan1NumberController.text;
//                       distributor["BookingMan2"] =
//                           bookingManName2Controller.text.isEmpty
//                               ? null
//                               : bookingManName2Controller.text;
//                       distributor["BookingMan2Number"] =
//                           bookingMan2NumberController.text.isEmpty
//                               ? null
//                               : bookingMan2NumberController.text;
//                       distributor["SupplyManName"] =
//                           supplyManNameController.text.isEmpty
//                               ? null
//                               : supplyManNameController.text;
//                       distributor["SupplyManNumber"] =
//                           supplyManNumberController.text.isEmpty
//                               ? null
//                               : supplyManNumberController.text;

//                       setState(() {});
//                       Navigator.pop(context);
//                     },
//                     child: Text("Update"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(" Distributions"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 _adddDistributor();
//               },

//               child: const Text("+ Add Distributor"),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: DataTable(
//                   columns: const [
//                     DataColumn(label: Text("Name")),
//                     DataColumn(label: Text("Manager Name")),
//                     DataColumn(label: Text("Manager Number")),
//                     DataColumn(label: Text("Booking Man1")),
//                     DataColumn(label: Text("Booking Man1 Number")),
//                     DataColumn(label: Text("Booking Man2")),
//                     DataColumn(label: Text("Booking Man2 Number")),
//                     DataColumn(label: Text("Supply Man Name")),
//                     DataColumn(label: Text("Supply Man Number")),
//                     DataColumn(label: Text("Actions")),
//                   ],
//                   rows: [
//                     ...distributor.map(
//                       (distributor) => DataRow(
//                         cells: [
//                           DataCell(Text(distributor["Name"] ?? "")),
//                           DataCell(Text(distributor["ManagerName"] ?? "")),
//                           DataCell(Text(distributor["ManagerNumber"] ?? "")),
//                           DataCell(Text(distributor["BookingMan1"] ?? "")),
//                           DataCell(
//                             Text(distributor["BookingMan1Number"] ?? ""),
//                           ),
//                           DataCell(Text(distributor["BookingMan2"] ?? "")),
//                           DataCell(
//                             Text(distributor["BookingMan2Number"] ?? ""),
//                           ),
//                           DataCell(Text(distributor["SupplyManName"] ?? "")),
//                           DataCell(Text(distributor["SupplyManNumber"] ?? "")),
//                           DataCell(
//                             Row(
//                               children: [
//                                 IconButton(
//                                   icon: const Icon(
//                                     Icons.edit,
//                                     color: Colors.blue,
//                                   ),
//                                   onPressed: () {
//                                     editDistributor(distributor);
//                                   },
//                                 ),
//                                 IconButton(
//                                   icon: const Icon(
//                                     Icons.delete,
//                                     color: Colors.red,
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                      this. distributor.remove(distributor);
//                                     });
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart'; // ✅ Added for Hive

// class Alldistributor extends StatefulWidget {
//   const Alldistributor({super.key});

//   @override
//   State<Alldistributor> createState() => _AlldistributorState();
// }

// class _AlldistributorState extends State<Alldistributor> {
//   static const String routeName = '/alldistributor';

//   // ❌ Removed the in-memory list
//   // List<Map<String, dynamic>> distributor = [];

//   // ✅ Use Hive box instead
//   final distributorBox = Hive.box('distributorBox');

//   // ---------------- ADD Distributor ----------------
//   void _adddDistributor() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final nameController = TextEditingController();
//         final mangerNameController = TextEditingController();
//         final managerNumberController = TextEditingController();
//         final bookingMan1NumberController = TextEditingController();
//         final bookingMan2NumberController = TextEditingController();
//         final bookingManName1Controller = TextEditingController();
//         final bookingManName2Controller = TextEditingController();
//         final supplyManNameController = TextEditingController();
//         final supplyManNumberController = TextEditingController();
//         return AlertDialog(
//           title: const Text('Add Distributor'),
//           content: SingleChildScrollView(
//             // ✅ added to avoid overflow
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                     controller: nameController,
//                     decoration:
//                         const InputDecoration(labelText: 'Distributor Name')),
//                 TextField(
//                     controller: mangerNameController,
//                     decoration:
//                         const InputDecoration(labelText: 'Manager Name')),
//                 TextField(
//                     controller: managerNumberController,
//                     decoration:
//                         const InputDecoration(labelText: 'Manager Number')),
//                 TextField(
//                     controller: bookingManName1Controller,
//                     decoration:
//                         const InputDecoration(labelText: "Booking Man1")),
//                 TextField(
//                     controller: bookingMan1NumberController,
//                     decoration:
//                         const InputDecoration(labelText: "Booking 1 Number")),
//                 TextField(
//                     controller: bookingManName2Controller,
//                     decoration:
//                         const InputDecoration(labelText: "Booking Man2")),
//                 TextField(
//                     controller: bookingMan2NumberController,
//                     decoration:
//                         const InputDecoration(labelText: "Booking 2 Number")),
//                 TextField(
//                     controller: supplyManNameController,
//                     decoration:
//                         const InputDecoration(labelText: "Supply Man Name")),
//                 TextField(
//                     controller: supplyManNumberController,
//                     decoration:
//                         const InputDecoration(labelText: "Supply Man Number")),
//                 ElevatedButton(
//                   onPressed: () {
//                     // ✅ Save distributor in Hive
//                     distributorBox.add({
//                       "Name": nameController.text,
//                       "ManagerName": mangerNameController.text,
//                       "ManagerNumber": managerNumberController.text,
//                       "BookingMan1": bookingManName1Controller.text,
//                       "BookingMan1Number": bookingMan1NumberController.text,
//                       "BookingMan2": bookingManName2Controller.text,
//                       "BookingMan2Number": bookingMan2NumberController.text,
//                       "SupplyManName": supplyManNameController.text,
//                       "SupplyManNumber": supplyManNumberController.text,
//                     });

//                     Navigator.pop(context);
//                     setState(() {}); // refresh UI
//                   },
//                   child: const Text('Add'),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // ---------------- EDIT Distributor ----------------
//   void editDistributor(dynamic key, Map distributor) {
//     final nameController = TextEditingController(text: distributor['Name']);
//     final managerNameController =
//         TextEditingController(text: distributor['ManagerName']);
//     final managerNumberController =
//         TextEditingController(text: distributor['ManagerNumber']);
//     final bookingManName1Controller =
//         TextEditingController(text: distributor['BookingMan1']);
//     final bookingMan1NumberController =
//         TextEditingController(text: distributor['BookingMan1Number']);
//     final bookingManName2Controller =
//         TextEditingController(text: distributor['BookingMan2']);
//     final bookingMan2NumberController =
//         TextEditingController(text: distributor['BookingMan2Number']);
//     final supplyManNameController =
//         TextEditingController(text: distributor['SupplyManName']);
//     final supplyManNumberController =
//         TextEditingController(text: distributor['SupplyManNumber']);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Distributor"),
//           content: SingleChildScrollView(
//             // ✅ added to avoid overflow
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                     controller: nameController,
//                     decoration:
//                         const InputDecoration(labelText: 'Distributor Name')),
//                 TextField(
//                     controller: managerNameController,
//                     decoration:
//                         const InputDecoration(labelText: 'Manager Name')),
//                 TextField(
//                     controller: managerNumberController,
//                     decoration:
//                         const InputDecoration(labelText: 'Manager Number')),
//                 TextField(
//                     controller: bookingManName1Controller,
//                     decoration:
//                         const InputDecoration(labelText: "Booking Man1")),
//                 TextField(
//                     controller: bookingMan1NumberController,
//                     decoration:
//                         const InputDecoration(labelText: "Booking 1 Number")),
//                 TextField(
//                     controller: bookingManName2Controller,
//                     decoration:
//                         const InputDecoration(labelText: "Booking Man2")),
//                 TextField(
//                     controller: bookingMan2NumberController,
//                     decoration:
//                         const InputDecoration(labelText: "Booking 2 Number")),
//                 TextField(
//                     controller: supplyManNameController,
//                     decoration:
//                         const InputDecoration(labelText: "Supply Man Name")),
//                 TextField(
//                     controller: supplyManNumberController,
//                     decoration:
//                         const InputDecoration(labelText: "Supply Man Number")),
//                 const SizedBox(height: 15),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text("Cancel")),
//                     const SizedBox(width: 15),
//                     ElevatedButton(
//                       onPressed: () {
//                         // ✅ Update distributor in Hive
//                         distributorBox.put(key, {
//                           "Name": nameController.text,
//                           "ManagerName": managerNameController.text,
//                           "ManagerNumber": managerNumberController.text,
//                           "BookingMan1": bookingManName1Controller.text,
//                           "BookingMan1Number": bookingMan1NumberController.text,
//                           "BookingMan2": bookingManName2Controller.text,
//                           "BookingMan2Number": bookingMan2NumberController.text,
//                           "SupplyManName": supplyManNameController.text,
//                           "SupplyManNumber": supplyManNumberController.text,
//                         });
//                         setState(() {});
//                         Navigator.pop(context);
//                       },
//                       child: const Text("Update"),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // ---------------- UI ----------------
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Distributors"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 _adddDistributor();
//               },
//               child: const Text("+ Add Distributor"),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: ValueListenableBuilder(
//                   // ✅ Listen to Hive box changes
//                   valueListenable: distributorBox.listenable(),
//                   builder: (context, Box box, _) {
//                     return DataTable(
//                       columns: const [
//                         DataColumn(label: Text("Name")),
//                         DataColumn(label: Text("Manager Name")),
//                         DataColumn(label: Text("Manager Number")),
//                         DataColumn(label: Text("Booking Man1")),
//                         DataColumn(label: Text("Booking Man1 Number")),
//                         DataColumn(label: Text("Booking Man2")),
//                         DataColumn(label: Text("Booking Man2 Number")),
//                         DataColumn(label: Text("Supply Man Name")),
//                         DataColumn(label: Text("Supply Man Number")),
//                         DataColumn(label: Text("Actions")),
//                       ],
//                       rows: [
//                         ...box.keys.map((key) {
//                           final distributor = box.get(key) as Map;
//                           return DataRow(
//                             cells: [
//                               DataCell(Text(distributor["Name"] ?? "")),
//                               DataCell(Text(distributor["ManagerName"] ?? "")),
//                               DataCell(
//                                   Text(distributor["ManagerNumber"] ?? "")),
//                               DataCell(Text(distributor["BookingMan1"] ?? "")),
//                               DataCell(
//                                   Text(distributor["BookingMan1Number"] ?? "")),
//                               DataCell(Text(distributor["BookingMan2"] ?? "")),
//                               DataCell(
//                                   Text(distributor["BookingMan2Number"] ?? "")),
//                               DataCell(
//                                   Text(distributor["SupplyManName"] ?? "")),
//                               DataCell(
//                                   Text(distributor["SupplyManNumber"] ?? "")),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.edit,
//                                           color: Colors.blue),
//                                       onPressed: () =>
//                                           editDistributor(key, distributor),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.delete,
//                                           color: Colors.red),
//                                       onPressed: () {
//                                         distributorBox
//                                             .delete(key); // ✅ Delete from Hive
//                                         setState(() {});
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class Alldistributor extends StatefulWidget {
//   const Alldistributor({super.key});

//   @override
//   State<Alldistributor> createState() => _AlldistributorState();
// }

// class _AlldistributorState extends State<Alldistributor> {
//   static const String routeName = '/alldistributor';

//   final distributorBox = Hive.box('distributorBox');

//   // ---------------- ADD Distributor ----------------
//   void _addDistributor() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final nameController = TextEditingController();
//         final managerNameController = TextEditingController();
//         final managerNumberController = TextEditingController();
//         final bookingMan1Controller = TextEditingController();
//         final bookingMan1NumberController = TextEditingController();
//         final bookingMan2Controller = TextEditingController();
//         final bookingMan2NumberController = TextEditingController();
//         final supplyManNameController = TextEditingController();
//         final supplyManNumberController = TextEditingController();

//         return AlertDialog(
//           title: const Text('Add Distributor'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: nameController,
//                   decoration:
//                       const InputDecoration(labelText: 'Distributor Name'),
//                 ),
//                 TextField(
//                   controller: managerNameController,
//                   decoration: const InputDecoration(labelText: 'Manager Name'),
//                 ),
//                 TextField(
//                   controller: managerNumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Manager Number'),
//                 ),
//                 TextField(
//                   controller: bookingMan1Controller,
//                   decoration: const InputDecoration(labelText: 'Booking Man1'),
//                 ),
//                 TextField(
//                   controller: bookingMan1NumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Booking 1 Number'),
//                 ),
//                 TextField(
//                   controller: bookingMan2Controller,
//                   decoration: const InputDecoration(labelText: 'Booking Man2'),
//                 ),
//                 TextField(
//                   controller: bookingMan2NumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Booking 2 Number'),
//                 ),
//                 TextField(
//                   controller: supplyManNameController,
//                   decoration:
//                       const InputDecoration(labelText: 'Supply Man Name'),
//                 ),
//                 TextField(
//                   controller: supplyManNumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Supply Man Number'),
//                 ),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     distributorBox.add({
//                       "Name": nameController.text,
//                       "ManagerName": managerNameController.text,
//                       "ManagerNumber": managerNumberController.text,
//                       "BookingMan1": bookingMan1Controller.text,
//                       "BookingMan1Number": bookingMan1NumberController.text,
//                       "BookingMan2": bookingMan2Controller.text,
//                       "BookingMan2Number": bookingMan2NumberController.text,
//                       "SupplyManName": supplyManNameController.text,
//                       "SupplyManNumber": supplyManNumberController.text,
//                     });
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Add'),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // ---------------- EDIT Distributor ----------------
//   void _editDistributor(dynamic key, Map distributor) {
//     final nameController = TextEditingController(text: distributor['Name']);
//     final managerNameController =
//         TextEditingController(text: distributor['ManagerName']);
//     final managerNumberController =
//         TextEditingController(text: distributor['ManagerNumber']);
//     final bookingMan1Controller =
//         TextEditingController(text: distributor['BookingMan1']);
//     final bookingMan1NumberController =
//         TextEditingController(text: distributor['BookingMan1Number']);
//     final bookingMan2Controller =
//         TextEditingController(text: distributor['BookingMan2']);
//     final bookingMan2NumberController =
//         TextEditingController(text: distributor['BookingMan2Number']);
//     final supplyManNameController =
//         TextEditingController(text: distributor['SupplyManName']);
//     final supplyManNumberController =
//         TextEditingController(text: distributor['SupplyManNumber']);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Distributor"),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: nameController,
//                   decoration:
//                       const InputDecoration(labelText: 'Distributor Name'),
//                 ),
//                 TextField(
//                   controller: managerNameController,
//                   decoration: const InputDecoration(labelText: 'Manager Name'),
//                 ),
//                 TextField(
//                   controller: managerNumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Manager Number'),
//                 ),
//                 TextField(
//                   controller: bookingMan1Controller,
//                   decoration: const InputDecoration(labelText: 'Booking Man1'),
//                 ),
//                 TextField(
//                   controller: bookingMan1NumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Booking 1 Number'),
//                 ),
//                 TextField(
//                   controller: bookingMan2Controller,
//                   decoration: const InputDecoration(labelText: 'Booking Man2'),
//                 ),
//                 TextField(
//                   controller: bookingMan2NumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Booking 2 Number'),
//                 ),
//                 TextField(
//                   controller: supplyManNameController,
//                   decoration:
//                       const InputDecoration(labelText: 'Supply Man Name'),
//                 ),
//                 TextField(
//                   controller: supplyManNumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Supply Man Number'),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text("Cancel")),
//                     const SizedBox(width: 10),
//                     ElevatedButton(
//                         onPressed: () {
//                           distributorBox.put(key, {
//                             "Name": nameController.text,
//                             "ManagerName": managerNameController.text,
//                             "ManagerNumber": managerNumberController.text,
//                             "BookingMan1": bookingMan1Controller.text,
//                             "BookingMan1Number":
//                                 bookingMan1NumberController.text,
//                             "BookingMan2": bookingMan2Controller.text,
//                             "BookingMan2Number":
//                                 bookingMan2NumberController.text,
//                             "SupplyManName": supplyManNameController.text,
//                             "SupplyManNumber": supplyManNumberController.text,
//                           });
//                           Navigator.pop(context);
//                         },
//                         child: const Text("Update")),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // ---------------- DELETE Distributor ----------------
//   void _deleteDistributor(dynamic key) {
//     distributorBox.delete(key);
//   }

//   // ---------------- UI ----------------
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Distributors"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _addDistributor,
//               child: const Text("+ Add Distributor"),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ValueListenableBuilder(
//                     valueListenable: distributorBox.listenable(),
//                     builder: (context, Box box, _) {
//                       if (box.isEmpty) {
//                         return const Center(
//                             child: Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text("No Distributors Added"),
//                         ));
//                       }

//                       return DataTable(
//                         columns: const [
//                           DataColumn(label: Text("Name")),
//                           DataColumn(label: Text("Manager Name")),
//                           DataColumn(label: Text("Manager Number")),
//                           DataColumn(label: Text("Booking Man1")),
//                           DataColumn(label: Text("Booking Man1 Number")),
//                           DataColumn(label: Text("Booking Man2")),
//                           DataColumn(label: Text("Booking Man2 Number")),
//                           DataColumn(label: Text("Supply Man Name")),
//                           DataColumn(label: Text("Supply Man Number")),
//                           DataColumn(label: Text("Actions")),
//                         ],
//                         rows: box.keys.map((key) {
//                           final distributor = box.get(key) as Map;
//                           return DataRow(
//                             cells: [
//                               DataCell(Text(distributor["Name"] ?? "")),
//                               DataCell(Text(distributor["ManagerName"] ?? "")),
//                               DataCell(
//                                   Text(distributor["ManagerNumber"] ?? "")),
//                               DataCell(Text(distributor["BookingMan1"] ?? "")),
//                               DataCell(
//                                   Text(distributor["BookingMan1Number"] ?? "")),
//                               DataCell(Text(distributor["BookingMan2"] ?? "")),
//                               DataCell(
//                                   Text(distributor["BookingMan2Number"] ?? "")),
//                               DataCell(
//                                   Text(distributor["SupplyManName"] ?? "")),
//                               DataCell(
//                                   Text(distributor["SupplyManNumber"] ?? "")),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.edit,
//                                           color: Colors.blue),
//                                       onPressed: () =>
//                                           _editDistributor(key, distributor),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.delete,
//                                           color: Colors.red),
//                                       onPressed: () => _deleteDistributor(key),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class Alldistributor extends StatefulWidget {
//   const Alldistributor({super.key});

//   @override
//   State<Alldistributor> createState() => _AlldistributorState();
// }

// class _AlldistributorState extends State<Alldistributor> {
//   final nameFocus = FocusNode();
//   final managerNameFocus = FocusNode();
//   final managerNumberFocus = FocusNode();
//   final bookingMan1Focus = FocusNode();
//   final bookingMan1NumberFocus = FocusNode();
//   final bookingMan2Focus = FocusNode();
//   final bookingMan2NumberFocus = FocusNode();
//   final supplyManNameFocus = FocusNode();
//   final supplyManNumberFocus = FocusNode();

//   static const String routeName = '/alldistributor';

//   final distributorBox = Hive.box('distributorBox');

//   // ---------------- ADD Distributor ----------------
//   void _addDistributor() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final nameController = TextEditingController();
//         final managerNameController = TextEditingController();
//         final managerNumberController = TextEditingController();
//         final bookingMan1Controller = TextEditingController();
//         final bookingMan1NumberController = TextEditingController();
//         final bookingMan2Controller = TextEditingController();
//         final bookingMan2NumberController = TextEditingController();
//         final supplyManNameController = TextEditingController();
//         final supplyManNumberController = TextEditingController();

//         return AlertDialog(
//           title: const Text('Add Distributor'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   focusNode: nameFocus,
//                   controller: nameController,
//                   decoration:
//                       const InputDecoration(labelText: 'Distributor Name'),
//                 ),
//                 TextField(
//                   focusNode: managerNameFocus,
//                   controller: managerNameController,
//                   decoration: const InputDecoration(labelText: 'Manager Name'),
//                 ),
//                 TextField(
//                   focusNode: managerNumberFocus,
//                   controller: managerNumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Manager Number'),
//                 ),
//                 TextField(
//                   focusNode: bookingMan1Focus,
//                   controller: bookingMan1Controller,
//                   decoration: const InputDecoration(labelText: 'Booking Man1'),
//                 ),
//                 TextField(
//                   focusNode: bookingMan1NumberFocus,
//                   controller: bookingMan1NumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Booking 1 Number'),
//                 ),
//                 TextField(
//                   focusNode: bookingMan2Focus,
//                   controller: bookingMan2Controller,
//                   decoration: const InputDecoration(labelText: 'Booking Man2'),
//                 ),
//                 TextField(
//                   focusNode: bookingMan2NumberFocus,
//                   controller: bookingMan2NumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Booking 2 Number'),
//                 ),
//                 TextField(
//                   focusNode: supplyManNameFocus,
//                   controller: supplyManNameController,
//                   decoration:
//                       const InputDecoration(labelText: 'Supply Man Name'),
//                 ),
//                 TextField(
//                   focusNode: supplyManNumberFocus,
//                   controller: supplyManNumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Supply Man Number'),
//                 ),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     distributorBox.add({
//                       "Name": nameController.text,
//                       "ManagerName": managerNameController.text,
//                       "ManagerNumber": managerNumberController.text,
//                       "BookingMan1": bookingMan1Controller.text,
//                       "BookingMan1Number": bookingMan1NumberController.text,
//                       "BookingMan2": bookingMan2Controller.text,
//                       "BookingMan2Number": bookingMan2NumberController.text,
//                       "SupplyManName": supplyManNameController.text,
//                       "SupplyManNumber": supplyManNumberController.text,
//                     });
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Add'),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // ---------------- EDIT Distributor ----------------
//   void _editDistributor(dynamic key, Map distributor) {
//     final nameController = TextEditingController(text: distributor['Name']);
//     final managerNameController =
//         TextEditingController(text: distributor['ManagerName']);
//     final managerNumberController =
//         TextEditingController(text: distributor['ManagerNumber']);
//     final bookingMan1Controller =
//         TextEditingController(text: distributor['BookingMan1']);
//     final bookingMan1NumberController =
//         TextEditingController(text: distributor['BookingMan1Number']);
//     final bookingMan2Controller =
//         TextEditingController(text: distributor['BookingMan2']);
//     final bookingMan2NumberController =
//         TextEditingController(text: distributor['BookingMan2Number']);
//     final supplyManNameController =
//         TextEditingController(text: distributor['SupplyManName']);
//     final supplyManNumberController =
//         TextEditingController(text: distributor['SupplyManNumber']);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Distributor"),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: nameController,
//                   decoration:
//                       const InputDecoration(labelText: 'Distributor Name'),
//                 ),
//                 TextField(
//                   controller: managerNameController,
//                   decoration: const InputDecoration(labelText: 'Manager Name'),
//                 ),
//                 TextField(
//                   controller: managerNumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Manager Number'),
//                 ),
//                 TextField(
//                   controller: bookingMan1Controller,
//                   decoration: const InputDecoration(labelText: 'Booking Man1'),
//                 ),
//                 TextField(
//                   controller: bookingMan1NumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Booking 1 Number'),
//                 ),
//                 TextField(
//                   controller: bookingMan2Controller,
//                   decoration: const InputDecoration(labelText: 'Booking Man2'),
//                 ),
//                 TextField(
//                   controller: bookingMan2NumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Booking 2 Number'),
//                 ),
//                 TextField(
//                   controller: supplyManNameController,
//                   decoration:
//                       const InputDecoration(labelText: 'Supply Man Name'),
//                 ),
//                 TextField(
//                   controller: supplyManNumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Supply Man Number'),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text("Cancel")),
//                     const SizedBox(width: 10),
//                     ElevatedButton(
//                         onPressed: () {
//                           distributorBox.put(key, {
//                             "Name": nameController.text,
//                             "ManagerName": managerNameController.text,
//                             "ManagerNumber": managerNumberController.text,
//                             "BookingMan1": bookingMan1Controller.text,
//                             "BookingMan1Number":
//                                 bookingMan1NumberController.text,
//                             "BookingMan2": bookingMan2Controller.text,
//                             "BookingMan2Number":
//                                 bookingMan2NumberController.text,
//                             "SupplyManName": supplyManNameController.text,
//                             "SupplyManNumber": supplyManNumberController.text,
//                           });
//                           Navigator.pop(context);
//                         },
//                         child: const Text("Update")),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // ---------------- DELETE Distributor ----------------
//   void _deleteDistributor(dynamic key) {
//     distributorBox.delete(key);
//   }

//   // ---------------- UI ----------------
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Distributors"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _addDistributor,
//               child: const Text("+ Add Distributor"),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ValueListenableBuilder(
//                     valueListenable: distributorBox.listenable(),
//                     builder: (context, Box box, _) {
//                       if (box.isEmpty) {
//                         return const Center(
//                             child: Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Text("No Distributors Added"),
//                         ));
//                       }

//                       return DataTable(
//                         columns: const [
//                           DataColumn(label: Text("Name")),
//                           DataColumn(label: Text("Manager Name")),
//                           DataColumn(label: Text("Manager Number")),
//                           DataColumn(label: Text("Booking Man1")),
//                           DataColumn(label: Text("Booking Man1 Number")),
//                           DataColumn(label: Text("Booking Man2")),
//                           DataColumn(label: Text("Booking Man2 Number")),
//                           DataColumn(label: Text("Supply Man Name")),
//                           DataColumn(label: Text("Supply Man Number")),
//                           DataColumn(label: Text("Actions")),
//                         ],
//                         rows: box.keys.map((key) {
//                           final distributor = box.get(key) as Map;
//                           return DataRow(
//                             cells: [
//                               DataCell(Text(distributor["Name"] ?? "")),
//                               DataCell(Text(distributor["ManagerName"] ?? "")),
//                               DataCell(
//                                   Text(distributor["ManagerNumber"] ?? "")),
//                               DataCell(Text(distributor["BookingMan1"] ?? "")),
//                               DataCell(
//                                   Text(distributor["BookingMan1Number"] ?? "")),
//                               DataCell(Text(distributor["BookingMan2"] ?? "")),
//                               DataCell(
//                                   Text(distributor["BookingMan2Number"] ?? "")),
//                               DataCell(
//                                   Text(distributor["SupplyManName"] ?? "")),
//                               DataCell(
//                                   Text(distributor["SupplyManNumber"] ?? "")),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.edit,
//                                           color: Colors.blue),
//                                       onPressed: () =>
//                                           _editDistributor(key, distributor),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.delete,
//                                           color: Colors.red),
//                                       onPressed: () => _deleteDistributor(key),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class Alldistributor extends StatefulWidget {
//   const Alldistributor({super.key});

//   @override
//   State<Alldistributor> createState() => _AlldistributorState();
// }

// class _AlldistributorState extends State<Alldistributor> {
//   // ---------------- FOCUS NODES for keyboard navigation ----------------
//   final nameFocus = FocusNode();
//   final managerNameFocus = FocusNode();
//   final managerNumberFocus = FocusNode();
//   final bookingMan1Focus = FocusNode();
//   final bookingMan1NumberFocus = FocusNode();
//   final bookingMan2Focus = FocusNode();
//   final bookingMan2NumberFocus = FocusNode();
//   final supplyManNameFocus = FocusNode();
//   final supplyManNumberFocus = FocusNode();

//   static const String routeName = '/alldistributor';
//   final distributorBox = Hive.box('distributorBox');

//   // ---------------- ADD Distributor ----------------
//   void _addDistributor() {
//     final nameController = TextEditingController();
//     final managerNameController = TextEditingController();
//     final managerNumberController = TextEditingController();
//     final bookingMan1Controller = TextEditingController();
//     final bookingMan1NumberController = TextEditingController();
//     final bookingMan2Controller = TextEditingController();
//     final bookingMan2NumberController = TextEditingController();
//     final supplyManNameController = TextEditingController();
//     final supplyManNumberController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add Distributor'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // ------------------ FOCUS + ENTER NAVIGATION ------------------
//                 TextField(
//                   focusNode: nameFocus,
//                   controller: nameController,
//                   decoration:
//                       const InputDecoration(labelText: 'Distributor Name'),
//                   textInputAction: TextInputAction.next,
//                   onSubmitted: (_) =>
//                       FocusScope.of(context).requestFocus(managerNameFocus),
//                 ),
//                 TextField(
//                   focusNode: managerNameFocus,
//                   controller: managerNameController,
//                   decoration: const InputDecoration(labelText: 'Manager Name'),
//                   textInputAction: TextInputAction.next,
//                   onSubmitted: (_) =>
//                       FocusScope.of(context).requestFocus(managerNumberFocus),
//                 ),
//                 TextField(
//                   focusNode: managerNumberFocus,
//                   controller: managerNumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Manager Number'),
//                   textInputAction: TextInputAction.next,
//                   onSubmitted: (_) =>
//                       FocusScope.of(context).requestFocus(bookingMan1Focus),
//                 ),
//                 TextField(
//                   focusNode: bookingMan1Focus,
//                   controller: bookingMan1Controller,
//                   decoration: const InputDecoration(labelText: 'Booking Man1'),
//                   textInputAction: TextInputAction.next,
//                   onSubmitted: (_) => FocusScope.of(context)
//                       .requestFocus(bookingMan1NumberFocus),
//                 ),
//                 TextField(
//                   focusNode: bookingMan1NumberFocus,
//                   controller: bookingMan1NumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Booking 1 Number'),
//                   textInputAction: TextInputAction.next,
//                   onSubmitted: (_) =>
//                       FocusScope.of(context).requestFocus(bookingMan2Focus),
//                 ),
//                 TextField(
//                   focusNode: bookingMan2Focus,
//                   controller: bookingMan2Controller,
//                   decoration: const InputDecoration(labelText: 'Booking Man2'),
//                   textInputAction: TextInputAction.next,
//                   onSubmitted: (_) => FocusScope.of(context)
//                       .requestFocus(bookingMan2NumberFocus),
//                 ),
//                 TextField(
//                   focusNode: bookingMan2NumberFocus,
//                   controller: bookingMan2NumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Booking 2 Number'),
//                   textInputAction: TextInputAction.next,
//                   onSubmitted: (_) =>
//                       FocusScope.of(context).requestFocus(supplyManNameFocus),
//                 ),
//                 TextField(
//                   focusNode: supplyManNameFocus,
//                   controller: supplyManNameController,
//                   decoration:
//                       const InputDecoration(labelText: 'Supply Man Name'),
//                   textInputAction: TextInputAction.next,
//                   onSubmitted: (_) =>
//                       FocusScope.of(context).requestFocus(supplyManNumberFocus),
//                 ),
//                 TextField(
//                   focusNode: supplyManNumberFocus,
//                   controller: supplyManNumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Supply Man Number'),
//                   textInputAction: TextInputAction.done,
//                   onSubmitted: (_) {
//                     // ✅ Press Enter on last field triggers Add
//                     distributorBox.add({
//                       "Name": nameController.text,
//                       "ManagerName": managerNameController.text,
//                       "ManagerNumber": managerNumberController.text,
//                       "BookingMan1": bookingMan1Controller.text,
//                       "BookingMan1Number": bookingMan1NumberController.text,
//                       "BookingMan2": bookingMan2Controller.text,
//                       "BookingMan2Number": bookingMan2NumberController.text,
//                       "SupplyManName": supplyManNameController.text,
//                       "SupplyManNumber": supplyManNumberController.text,
//                     });
//                     Navigator.pop(context);
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     distributorBox.add({
//                       "Name": nameController.text,
//                       "ManagerName": managerNameController.text,
//                       "ManagerNumber": managerNumberController.text,
//                       "BookingMan1": bookingMan1Controller.text,
//                       "BookingMan1Number": bookingMan1NumberController.text,
//                       "BookingMan2": bookingMan2Controller.text,
//                       "BookingMan2Number": bookingMan2NumberController.text,
//                       "SupplyManName": supplyManNameController.text,
//                       "SupplyManNumber": supplyManNumberController.text,
//                     });
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Add'),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // ---------------- EDIT Distributor (same focus feature can be added) ----------------
//   void _editDistributor(dynamic key, Map distributor) {
//     final nameController = TextEditingController(text: distributor['Name']);
//     final managerNameController =
//         TextEditingController(text: distributor['ManagerName']);
//     final managerNumberController =
//         TextEditingController(text: distributor['ManagerNumber']);
//     final bookingMan1Controller =
//         TextEditingController(text: distributor['BookingMan1']);
//     final bookingMan1NumberController =
//         TextEditingController(text: distributor['BookingMan1Number']);
//     final bookingMan2Controller =
//         TextEditingController(text: distributor['BookingMan2']);
//     final bookingMan2NumberController =
//         TextEditingController(text: distributor['BookingMan2Number']);
//     final supplyManNameController =
//         TextEditingController(text: distributor['SupplyManName']);
//     final supplyManNumberController =
//         TextEditingController(text: distributor['SupplyManNumber']);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Distributor"),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Can add focus + onSubmitted here like Add
//                 TextField(
//                   controller: nameController,
//                   decoration:
//                       const InputDecoration(labelText: 'Distributor Name'),
//                 ),
//                 TextField(
//                   controller: managerNameController,
//                   decoration: const InputDecoration(labelText: 'Manager Name'),
//                 ),
//                 TextField(
//                   controller: managerNumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Manager Number'),
//                 ),
//                 TextField(
//                   controller: bookingMan1Controller,
//                   decoration: const InputDecoration(labelText: 'Booking Man1'),
//                 ),
//                 TextField(
//                   controller: bookingMan1NumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Booking 1 Number'),
//                 ),
//                 TextField(
//                   controller: bookingMan2Controller,
//                   decoration: const InputDecoration(labelText: 'Booking Man2'),
//                 ),
//                 TextField(
//                   controller: bookingMan2NumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Booking 2 Number'),
//                 ),
//                 TextField(
//                   controller: supplyManNameController,
//                   decoration:
//                       const InputDecoration(labelText: 'Supply Man Name'),
//                 ),
//                 TextField(
//                   controller: supplyManNumberController,
//                   decoration:
//                       const InputDecoration(labelText: 'Supply Man Number'),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text("Cancel")),
//                     const SizedBox(width: 10),
//                     ElevatedButton(
//                         onPressed: () {
//                           distributorBox.put(key, {
//                             "Name": nameController.text,
//                             "ManagerName": managerNameController.text,
//                             "ManagerNumber": managerNumberController.text,
//                             "BookingMan1": bookingMan1Controller.text,
//                             "BookingMan1Number":
//                                 bookingMan1NumberController.text,
//                             "BookingMan2": bookingMan2Controller.text,
//                             "BookingMan2Number":
//                                 bookingMan2NumberController.text,
//                             "SupplyManName": supplyManNameController.text,
//                             "SupplyManNumber": supplyManNumberController.text,
//                           });
//                           Navigator.pop(context);
//                         },
//                         child: const Text("Update")),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _deleteDistributor(dynamic key) {
//     distributorBox.delete(key);
//   }

//   // ---------------- UI ----------------
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Distributors"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _addDistributor,
//               child: const Text("+ Add Distributor"),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ValueListenableBuilder(
//                     valueListenable: distributorBox.listenable(),
//                     builder: (context, Box box, _) {
//                       if (box.isEmpty) {
//                         return const Center(
//                           child: Padding(
//                             padding: EdgeInsets.all(16.0),
//                             child: Text("No Distributors Added"),
//                           ),
//                         );
//                       }
//                       return DataTable(
//                         columns: const [
//                           DataColumn(label: Text("Name")),
//                           DataColumn(label: Text("Manager Name")),
//                           DataColumn(label: Text("Manager Number")),
//                           DataColumn(label: Text("Booking Man1")),
//                           DataColumn(label: Text("Booking Man1 Number")),
//                           DataColumn(label: Text("Booking Man2")),
//                           DataColumn(label: Text("Booking Man2 Number")),
//                           DataColumn(label: Text("Supply Man Name")),
//                           DataColumn(label: Text("Supply Man Number")),
//                           DataColumn(label: Text("Actions")),
//                         ],
//                         rows: box.keys.map((key) {
//                           final distributor = box.get(key) as Map;
//                           return DataRow(
//                             cells: [
//                               DataCell(Text(distributor["Name"] ?? "")),
//                               DataCell(Text(distributor["ManagerName"] ?? "")),
//                               DataCell(
//                                   Text(distributor["ManagerNumber"] ?? "")),
//                               DataCell(Text(distributor["BookingMan1"] ?? "")),
//                               DataCell(
//                                   Text(distributor["BookingMan1Number"] ?? "")),
//                               DataCell(Text(distributor["BookingMan2"] ?? "")),
//                               DataCell(
//                                   Text(distributor["BookingMan2Number"] ?? "")),
//                               DataCell(
//                                   Text(distributor["SupplyManName"] ?? "")),
//                               DataCell(
//                                   Text(distributor["SupplyManNumber"] ?? "")),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.edit,
//                                           color: Colors.blue),
//                                       onPressed: () =>
//                                           _editDistributor(key, distributor),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.delete,
//                                           color: Colors.red),
//                                       onPressed: () => _deleteDistributor(key),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//}

// void _addInvoice() {
//   final fieldNames = [
//     'Customer Name',
//     'Invoice Number',
//     'Product Name',
//     'Quantity',
//     'Price',
//     'Discount',
//     'Total',
//   ];

//   final controllers =
//       List.generate(fieldNames.length, (_) => TextEditingController());
//   final focusNodes = List.generate(fieldNames.length, (_) => FocusNode());

//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: const Text('Add Invoice'),
//         content: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: List.generate(fieldNames.length, (index) {
//               return TextField(
//                 controller: controllers[index],
//                 focusNode: focusNodes[index],
//                 decoration: InputDecoration(labelText: fieldNames[index]),
//                 keyboardType: (fieldNames[index] == 'Quantity' ||
//                         fieldNames[index] == 'Price' ||
//                         fieldNames[index] == 'Discount' ||
//                         fieldNames[index] == 'Total')
//                     ? TextInputType.number
//                     : TextInputType.text,
//                 textInputAction: index == fieldNames.length - 1
//                     ? TextInputAction.done
//                     : TextInputAction.next,
//                 onSubmitted: (_) {
//                   if (index < fieldNames.length - 1) {
//                     FocusScope.of(context).requestFocus(focusNodes[index + 1]);
//                   } else {
//                     // Last field: save invoice
//                     final data = Map.fromIterables(
//                         fieldNames, controllers.map((c) => c.text));
//                     invoiceBox.add(data);
//                     Navigator.pop(context);
//                   }
//                 },
//               );
//             }),
//           ),
//         ),
//         actions: [
//           ElevatedButton(
//             onPressed: () {
//               final data =
//                   Map.fromIterables(fieldNames, controllers.map((c) => c.text));
//               invoiceBox.add(data);
//               Navigator.pop(context);
//             },
//             child: const Text('Add'),
//           ),
//         ],
//       );
//     },
//   );
// }

//

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:flutter/services.dart';

// class Alldistributor extends StatefulWidget {
//   const Alldistributor({super.key});

//   @override
//   State<Alldistributor> createState() => _AlldistributorState();
// }

// class _AlldistributorState extends State<Alldistributor> {
//   final nameFocus = FocusNode();
//   final managerNameFocus = FocusNode();
//   final managerNumberFocus = FocusNode();
//   final bookingMan1Focus = FocusNode();
//   final bookingMan1NumberFocus = FocusNode();
//   final bookingMan2Focus = FocusNode();
//   final bookingMan2NumberFocus = FocusNode();
//   final supplyManNameFocus = FocusNode();
//   final supplyManNumberFocus = FocusNode();

// //  static const String routeName = '/alldistributor';
//   final distributorBox = Hive.box('distributorBox');

//   void _addDistributor() {
//     final nameController = TextEditingController();
//     final managerNameController = TextEditingController();
//     final managerNumberController = TextEditingController();
//     final bookingMan1Controller = TextEditingController();
//     final bookingMan1NumberController = TextEditingController();
//     final bookingMan2Controller = TextEditingController();
//     final bookingMan2NumberController = TextEditingController();
//     final supplyManNameController = TextEditingController();
//     final supplyManNumberController = TextEditingController();

//     // All focus nodes in order
//     // final focusNodes = [
//     //   nameFocus,
//     //   managerNameFocus,
//     //   managerNumberFocus,
//     //   bookingMan1Focus,
//     //   bookingMan1NumberFocus,
//     //   bookingMan2Focus,
//     //   bookingMan2NumberFocus,
//     //   supplyManNameFocus,
//     //   supplyManNumberFocus,
//     // ];

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.zero,
//           ),
//           title: const Text('Add Distributor'),
//           content: RawKeyboardListener(
//             focusNode: FocusNode(),
//             onKey: (RawKeyEvent event) {
//               if (event is RawKeyDownEvent) {
//                 if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
//                   FocusScope.of(context).nextFocus();
//                 } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
//                   FocusScope.of(context).previousFocus();
//                 }
//               }
//             },
//             child: FocusTraversalGroup(
//               policy: OrderedTraversalPolicy(),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     // ---------------- FIELDS ----------------
//                     TextField(
//                       focusNode: nameFocus,
//                       controller: nameController,
//                       decoration:
//                           const InputDecoration(labelText: 'Distributor Name'),
//                       textInputAction: TextInputAction.next,
//                       onSubmitted: (_) =>
//                           FocusScope.of(context).requestFocus(managerNameFocus),
//                     ),
//                     TextField(
//                       focusNode: managerNameFocus,
//                       controller: managerNameController,
//                       decoration:
//                           const InputDecoration(labelText: 'Manager Name'),
//                       textInputAction: TextInputAction.next,
//                       onSubmitted: (_) => FocusScope.of(context)
//                           .requestFocus(managerNumberFocus),
//                     ),
//                     TextField(
//                       focusNode: managerNumberFocus,
//                       controller: managerNumberController,
//                       decoration:
//                           const InputDecoration(labelText: 'Manager Number'),
//                       textInputAction: TextInputAction.next,
//                       onSubmitted: (_) =>
//                           FocusScope.of(context).requestFocus(bookingMan1Focus),
//                     ),
//                     TextField(
//                       focusNode: bookingMan1Focus,
//                       controller: bookingMan1Controller,
//                       decoration:
//                           const InputDecoration(labelText: 'Booking Man1'),
//                       textInputAction: TextInputAction.next,
//                       onSubmitted: (_) => FocusScope.of(context)
//                           .requestFocus(bookingMan1NumberFocus),
//                     ),
//                     TextField(
//                       focusNode: bookingMan1NumberFocus,
//                       controller: bookingMan1NumberController,
//                       decoration:
//                           const InputDecoration(labelText: 'Booking 1 Number'),
//                       textInputAction: TextInputAction.next,
//                       onSubmitted: (_) =>
//                           FocusScope.of(context).requestFocus(bookingMan2Focus),
//                     ),
//                     TextField(
//                       focusNode: bookingMan2Focus,
//                       controller: bookingMan2Controller,
//                       decoration:
//                           const InputDecoration(labelText: 'Booking Man2'),
//                       textInputAction: TextInputAction.next,
//                       onSubmitted: (_) => FocusScope.of(context)
//                           .requestFocus(bookingMan2NumberFocus),
//                     ),
//                     TextField(
//                       focusNode: bookingMan2NumberFocus,
//                       controller: bookingMan2NumberController,
//                       decoration:
//                           const InputDecoration(labelText: 'Booking 2 Number'),
//                       textInputAction: TextInputAction.next,
//                       onSubmitted: (_) => FocusScope.of(context)
//                           .requestFocus(supplyManNameFocus),
//                     ),
//                     TextField(
//                       focusNode: supplyManNameFocus,
//                       controller: supplyManNameController,
//                       decoration:
//                           const InputDecoration(labelText: 'Supply Man Name'),
//                       textInputAction: TextInputAction.next,
//                       onSubmitted: (_) => FocusScope.of(context)
//                           .requestFocus(supplyManNumberFocus),
//                     ),
//                     TextField(
//                       focusNode: supplyManNumberFocus,
//                       controller: supplyManNumberController,
//                       decoration:
//                           const InputDecoration(labelText: 'Supply Man Number'),
//                       textInputAction: TextInputAction.done,
//                       onSubmitted: (_) {
//                         _saveDistributor(
//                           nameController,
//                           managerNameController,
//                           managerNumberController,
//                           bookingMan1Controller,
//                           bookingMan1NumberController,
//                           bookingMan2Controller,
//                           bookingMan2NumberController,
//                           supplyManNameController,
//                           supplyManNumberController,
//                         );
//                         Navigator.pop(context);
//                       },
//                     ),
//                     const SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: () {
//                         _saveDistributor(
//                           nameController,
//                           managerNameController,
//                           managerNumberController,
//                           bookingMan1Controller,
//                           bookingMan1NumberController,
//                           bookingMan2Controller,
//                           bookingMan2NumberController,
//                           supplyManNameController,
//                           supplyManNumberController,
//                         );
//                         Navigator.pop(context);
//                       },
//                       child: const Text('Add'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _saveDistributor(
//     TextEditingController nameController,
//     TextEditingController managerNameController,
//     TextEditingController managerNumberController,
//     TextEditingController bookingMan1Controller,
//     TextEditingController bookingMan1NumberController,
//     TextEditingController bookingMan2Controller,
//     TextEditingController bookingMan2NumberController,
//     TextEditingController supplyManNameController,
//     TextEditingController supplyManNumberController,
//   ) {
//     distributorBox.add({
//       "Name": nameController.text,
//       "ManagerName": managerNameController.text,
//       "ManagerNumber": managerNumberController.text,
//       "BookingMan1": bookingMan1Controller.text,
//       "BookingMan1Number": bookingMan1NumberController.text,
//       "BookingMan2": bookingMan2Controller.text,
//       "BookingMan2Number": bookingMan2NumberController.text,
//       "SupplyManName": supplyManNameController.text,
//       "SupplyManNumber": supplyManNumberController.text,
//     });
//   }

//   void _editDistributor(dynamic key, Map distributor) {
//     final nameController = TextEditingController(text: distributor['Name']);
//     final managerNameController =
//         TextEditingController(text: distributor['ManagerName']);
//     final managerNumberController =
//         TextEditingController(text: distributor['ManagerNumber']);
//     final bookingMan1Controller =
//         TextEditingController(text: distributor['BookingMan1']);
//     final bookingMan1NumberController =
//         TextEditingController(text: distributor['BookingMan1Number']);
//     final bookingMan2Controller =
//         TextEditingController(text: distributor['BookingMan2']);
//     final bookingMan2NumberController =
//         TextEditingController(text: distributor['BookingMan2Number']);
//     final supplyManNameController =
//         TextEditingController(text: distributor['SupplyManName']);
//     final supplyManNumberController =
//         TextEditingController(text: distributor['SupplyManNumber']);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.zero, // 🔥 make square
//           ),
//           title: const Text("Edit Distributor"),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                     controller: nameController,
//                     decoration:
//                         const InputDecoration(labelText: 'Distributor Name')),
//                 TextField(
//                     controller: managerNameController,
//                     decoration:
//                         const InputDecoration(labelText: 'Manager Name')),
//                 TextField(
//                     controller: managerNumberController,
//                     decoration:
//                         const InputDecoration(labelText: 'Manager Number')),
//                 TextField(
//                     controller: bookingMan1Controller,
//                     decoration:
//                         const InputDecoration(labelText: 'Booking Man1')),
//                 TextField(
//                     controller: bookingMan1NumberController,
//                     decoration:
//                         const InputDecoration(labelText: 'Booking 1 Number')),
//                 TextField(
//                     controller: bookingMan2Controller,
//                     decoration:
//                         const InputDecoration(labelText: 'Booking Man2')),
//                 TextField(
//                     controller: bookingMan2NumberController,
//                     decoration:
//                         const InputDecoration(labelText: 'Booking 2 Number')),
//                 TextField(
//                     controller: supplyManNameController,
//                     decoration:
//                         const InputDecoration(labelText: 'Supply Man Name')),
//                 TextField(
//                     controller: supplyManNumberController,
//                     decoration:
//                         const InputDecoration(labelText: 'Supply Man Number')),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text("Cancel")),
//                     const SizedBox(width: 10),
//                     ElevatedButton(
//                         onPressed: () {
//                           distributorBox.put(key, {
//                             "Name": nameController.text,
//                             "ManagerName": managerNameController.text,
//                             "ManagerNumber": managerNumberController.text,
//                             "BookingMan1": bookingMan1Controller.text,
//                             "BookingMan1Number":
//                                 bookingMan1NumberController.text,
//                             "BookingMan2": bookingMan2Controller.text,
//                             "BookingMan2Number":
//                                 bookingMan2NumberController.text,
//                             "SupplyManName": supplyManNameController.text,
//                             "SupplyManNumber": supplyManNumberController.text,
//                           });
//                           Navigator.pop(context);
//                         },
//                         child: const Text("Update")),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _deleteDistributor(dynamic key) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Are you sure?"),
//           content: const Text("This distributor will be deleted permanently."),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context), // Cancel
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 distributorBox.delete(key);
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Distributor deleted')),
//                 );
//               },
//               child: const Text("Delete"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text("Distributors"),
//           centerTitle: true,
//           backgroundColor: Colors.green),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//                 onPressed: _addDistributor,
//                 child: const Text("+ Add Distributor")),
//             const SizedBox(height: 10),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ValueListenableBuilder(
//                     valueListenable: distributorBox.listenable(),
//                     builder: (context, Box box, _) {
//                       if (box.isEmpty) {
//                         return const Center(
//                             child: Padding(
//                                 padding: EdgeInsets.all(16.0),
//                                 child: Text("No Distributors Added")));
//                       }
//                       return DataTable(
//                         columns: const [
//                           DataColumn(label: Text("Name")),
//                           DataColumn(label: Text("Manager Name")),
//                           DataColumn(label: Text("Manager Number")),
//                           DataColumn(label: Text("Booking Man1")),
//                           DataColumn(label: Text("Booking Man1 Number")),
//                           DataColumn(label: Text("Booking Man2")),
//                           DataColumn(label: Text("Booking Man2 Number")),
//                           DataColumn(label: Text("Supply Man Name")),
//                           DataColumn(label: Text("Supply Man Number")),
//                           DataColumn(label: Text("Actions")),
//                         ],
//                         rows: box.keys.map((key) {
//                           final distributor = box.get(key) as Map;
//                           return DataRow(cells: [
//                             DataCell(Text(distributor["Name"] ?? "")),
//                             DataCell(Text(distributor["ManagerName"] ?? "")),
//                             DataCell(Text(distributor["ManagerNumber"] ?? "")),
//                             DataCell(Text(distributor["BookingMan1"] ?? "")),
//                             DataCell(
//                                 Text(distributor["BookingMan1Number"] ?? "")),
//                             DataCell(Text(distributor["BookingMan2"] ?? "")),
//                             DataCell(
//                                 Text(distributor["BookingMan2Number"] ?? "")),
//                             DataCell(Text(distributor["SupplyManName"] ?? "")),
//                             DataCell(
//                                 Text(distributor["SupplyManNumber"] ?? "")),
//                             DataCell(Row(children: [
//                               IconButton(
//                                   icon: const Icon(Icons.edit,
//                                       color: Colors.blue),
//                                   onPressed: () =>
//                                       _editDistributor(key, distributor)),
//                               IconButton(
//                                   icon: const Icon(Icons.delete,
//                                       color: Colors.red),
//                                   onPressed: () => _deleteDistributor(key)),
//                             ])),
//                           ]);
//                         }).toList(),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }// // import 'package:flutter/material.dart';

// // class Schedule extends StatefulWidget {
// //   const Schedule({super.key});

// //   @override
// //   State<Schedule> createState() => _AddScheduleState();
// // }

// // class _AddScheduleState extends State<Schedule> {
// //   static const String routeName = '/schedule';
// //   List<Map<String, dynamic>> schedule = [];
// //   void _adddSchedule() {
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         final nameController = TextEditingController();
// //         final dayController = TextEditingController();

// //         return AlertDialog(
// //           title: const Text('Add Schedule'),
// //           content: Column(
// //             mainAxisSize: MainAxisSize.min,

// //             children: [
// //               TextField(
// //                 controller: nameController,
// //                 decoration: const InputDecoration(
// //                   labelText: 'Distributor Name',
// //                 ),
// //               ),
// //               TextField(
// //                 controller: dayController,
// //                 decoration: const InputDecoration(labelText: 'Day'),
// //               ),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   setState(() {
// //                     schedule.add({
// //                       "Name": nameController.text,
// //                       "Day": dayController.text,
// //                     });
// //                   });
// //                   Navigator.pop(context);
// //                 },
// //                 child: Text('Add '),
// //               ),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   void editSchedule(Map<String, dynamic> schedule) {
// //     final nameController = TextEditingController(text: schedule['Name']);
// //     final dayController = TextEditingController(text: schedule['Day']);

// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: Text("Edit Schedule "),
// //           content: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               TextField(
// //                 controller: nameController,
// //                 decoration: const InputDecoration(labelText: 'Schedule Name'),
// //               ),

// //               TextField(
// //                 controller: dayController,
// //                 decoration: InputDecoration(labelText: "Day"),
// //               ),
// //               SizedBox(height: 15),

// //               Row(
// //                 children: [
// //                   ElevatedButton(
// //                     onPressed: () {
// //                       Navigator.pop(context);
// //                     },
// //                     child: Text("Cancel"),
// //                   ),
// //                   SizedBox(width: 15),
// //                   ElevatedButton(
// //                     onPressed: () {
// //                       schedule["Name"] =
// //                           nameController.text.isEmpty
// //                               ? null
// //                               : nameController.text;

// //                       schedule["Day"] =
// //                           dayController.text.isEmpty
// //                               ? null
// //                               : dayController.text;

// //                       setState(() {});
// //                       Navigator.pop(context);
// //                     },
// //                     child: Text("Update"),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(" Booking Schedule"),
// //         backgroundColor: Colors.green,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             ElevatedButton(
// //               onPressed: () {
// //                 _adddSchedule();
// //               },

// //               child: const Text("+ Add schedule"),
// //             ),
// //             Expanded(
// //               child: SingleChildScrollView(
// //                 scrollDirection: Axis.horizontal,
// //                 child: DataTable(
// //                   columns: const [
// //                     DataColumn(label: Text("Name")),
// //                     DataColumn(label: Text("Day")),

// //                     DataColumn(label: Text("Actions")),
// //                   ],
// //                   rows: [
// //                     ...schedule.map(
// //                       (schedule) => DataRow(
// //                         cells: [
// //                           DataCell(Text(schedule["Name"] ?? "")),
// //                           DataCell(Text(schedule["Day"] ?? "")),
// //                           DataCell(
// //                             Row(
// //                               children: [
// //                                 IconButton(
// //                                   icon: const Icon(
// //                                     Icons.edit,
// //                                     color: Colors.blue,
// //                                   ),
// //                                   onPressed: () {
// //                                     editSchedule(schedule);
// //                                   },
// //                                 ),
// //                                 IconButton(
// //                                   icon: const Icon(
// //                                     Icons.delete,
// //                                     color: Colors.red,
// //                                   ),
// //                                   onPressed: () {
// //                                     setState(() {
// //                                       this.schedule.remove(schedule);
// //                                     });
// //                                   },
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// // import 'package:flutter/material.dart';
// // import 'package:hive_flutter/hive_flutter.dart';

// // class SchedulePage extends StatefulWidget {
// //   const SchedulePage({super.key});

// //   @override
// //   State<SchedulePage> createState() => _SchedulePageState();
// // }

// // class _SchedulePageState extends State<SchedulePage> {
// //   static const String routeName = '/schedule';

// //   late Box scheduleBox;

// //   @override
// //   void initState() {
// //     super.initState();
// //     scheduleBox = Hive.box('scheduleBox'); // ✅ must match main.dart
// //   }

// //   void _addSchedule() {
// //     final nameController = TextEditingController();
// //     final dayController = TextEditingController();

// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: const Text('Add Schedule'),
// //           content: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               TextField(
// //                 controller: nameController,
// //                 decoration:
// //                     const InputDecoration(labelText: "Distributor Name"),
// //               ),
// //               TextField(
// //                 controller: dayController,
// //                 decoration: const InputDecoration(labelText: "Day"),
// //               ),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   final newSchedule = {
// //                     'name': nameController.text,
// //                     'day': dayController.text,
// //                   };
// //                   scheduleBox.add(newSchedule); // ✅ save map
// //                   Navigator.pop(context); // no need for setState
// //                 },
// //                 child: const Text("Add"),
// //               )
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   void _editSchedule(int key, Map schedule) {
// //     final nameController = TextEditingController(text: schedule['name']);
// //     final dayController = TextEditingController(text: schedule['day']);

// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: const Text("Edit Schedule"),
// //           content: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               TextField(
// //                 controller: nameController,
// //                 decoration:
// //                     const InputDecoration(labelText: "Distributor Name"),
// //               ),
// //               TextField(
// //                 controller: dayController,
// //                 decoration: const InputDecoration(labelText: "Day"),
// //               ),
// //               Row(
// //                 children: [
// //                   ElevatedButton(
// //                     onPressed: () => Navigator.pop(context),
// //                     child: const Text("Cancel"),
// //                   ),
// //                   const SizedBox(width: 10),
// //                   ElevatedButton(
// //                     onPressed: () {
// //                       final updatedSchedule = {
// //                         'name': nameController.text,
// //                         'day': dayController.text,
// //                       };
// //                       scheduleBox.put(key, updatedSchedule); // ✅ update map
// //                       Navigator.pop(context);
// //                     },
// //                     child: const Text("Update"),
// //                   ),
// //                 ],
// //               )
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Booking Schedule"),
// //         backgroundColor: Colors.green,
// //       ),
// //       body: Column(
// //         children: [
// //           ElevatedButton(
// //             onPressed: _addSchedule,
// //             child: const Text("+ Add Schedule"),
// //           ),
// //           Expanded(
// //             child: ValueListenableBuilder(
// //               valueListenable: scheduleBox.listenable(),
// //               builder: (context, Box box, _) {
// //                 if (box.isEmpty) {
// //                   return const Center(child: Text("No schedules available"));
// //                 }

// //                 final keys = box.keys.toList();

// //                 return SingleChildScrollView(
// //                   scrollDirection: Axis.horizontal,
// //                   child: DataTable(
// //                     columns: const [
// //                       DataColumn(label: Text("Name")),
// //                       DataColumn(label: Text("Day")),
// //                       DataColumn(label: Text("Actions")),
// //                     ],
// //                     rows: keys.map((key) {
// //                       final schedule = box.get(key) as Map;
// //                       return DataRow(
// //                         cells: [
// //                           DataCell(Text(schedule['name'] ?? "")),
// //                           DataCell(Text(schedule['day'] ?? "")),
// //                           DataCell(
// //                             Row(
// //                               children: [
// //                                 IconButton(
// //                                   icon: const Icon(Icons.edit,
// //                                       color: Colors.blue),
// //                                   onPressed: () => _editSchedule(key, schedule),
// //                                 ),
// //                                 IconButton(
// //                                   icon: const Icon(Icons.delete,
// //                                       color: Colors.red),
// //                                   onPressed: () => scheduleBox.delete(key),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ],
// //                       );
// //                     }).toList(),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:software/reuseable_widget/focus_node.dart';

// class SchedulePage extends StatefulWidget {
//   const SchedulePage({super.key});

//   @override
//   State<SchedulePage> createState() => _SchedulePageState();
// }

// class _SchedulePageState extends State<SchedulePage> {
//   static const String routeName = '/schedule';

//   late Box scheduleBox;

//   @override
//   void initState() {
//     super.initState();
//     scheduleBox = Hive.box('scheduleBox');
//   }

//   // ---------------- ADD Schedule ----------------
//   void _addSchedule() {
//     // final nameController = TextEditingController();
//     // final dayController = TextEditingController();
//     final fieldNames = ["Distribution Name", "Day"];
//     final Controller = {
//       for (var name in fieldNames) name: TextEditingController(),
//     };

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add Schedule'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // TextField(
//                 //   controller: nameController,
//                 //   decoration:
//                 //       const InputDecoration(labelText: "Distributor Name"),
//                 // ),
//                 // TextField(
//                 //   controller: dayController,
//                 //   decoration: const InputDecoration(labelText: "Day"),
//                 // ),
//                 // const SizedBox(height: 10),
//                 // ElevatedButton(
//                 //   onPressed: () {
//                 //     final newSchedule = {
//                 //       'name': nameController.text,
//                 //       'day': dayController.text,
//                 //     };

//             })

//                     scheduleBox.add(newSchedule);
//                     Navigator.pop(context);
//                   },
//                   //child: const Text("Add"),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // ---------------- EDIT Schedule ----------------
//   void _editSchedule(int key, Map schedule) {
//     final nameController = TextEditingController(text: schedule['name']);
//     final dayController = TextEditingController(text: schedule['day']);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Schedule"),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: nameController,
//                   decoration:
//                       const InputDecoration(labelText: "Distributor Name"),
//                 ),
//                 TextField(
//                   controller: dayController,
//                   decoration: const InputDecoration(labelText: "Day"),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text("Cancel")),
//                     const SizedBox(width: 10),
//                     ElevatedButton(
//                       onPressed: () {
//                         final updatedSchedule = {
//                           'name': nameController.text,
//                           'day': dayController.text,
//                         };
//                         scheduleBox.put(key, updatedSchedule);
//                         Navigator.pop(context);
//                       },
//                       child: const Text("Update"),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // ---------------- DELETE Schedule ----------------
//   void _deleteSchedule(int key) {
//     scheduleBox.delete(key);
//   }

//   // ---------------- UI ----------------
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Booking Schedule"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _addSchedule,
//               child: const Text("+ Add Schedule"),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ValueListenableBuilder(
//                     valueListenable: scheduleBox.listenable(),
//                     builder: (context, Box box, _) {
//                       if (box.isEmpty) {
//                         return const Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Center(child: Text("No schedules available")),
//                         );
//                       }

//                       return DataTable(
//                         columns: const [
//                           DataColumn(label: Text("Distributor Name")),
//                           DataColumn(label: Text("Day")),
//                           DataColumn(label: Text("Actions")),
//                         ],
//                         rows: box.keys.map((key) {
//                           final schedule = box.get(key) as Map;
//                           return DataRow(
//                             cells: [
//                               DataCell(Text(schedule['name'] ?? "")),
//                               DataCell(Text(schedule['day'] ?? "")),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.edit,
//                                           color: Colors.blue),
//                                       onPressed: () =>
//                                           _editSchedule(key, schedule),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.delete,
//                                           color: Colors.red),
//                                       onPressed: () => _deleteSchedule(key),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:software/reuseable_widget/dynamic_form.dart'; // import your widget

// class SchedulePage extends StatefulWidget {
//   const SchedulePage({super.key});

//   @override
//   State<SchedulePage> createState() => _SchedulePageState();
// }

// class _SchedulePageState extends State<SchedulePage> {
//   // static const String routeName = '/schedule';
//   late Box scheduleBox;

//   @override
//   void initState() {
//     super.initState();
//     scheduleBox = Hive.box('scheduleBox');
//   }

//   // ---------------- ADD Schedule ----------------
//   void _addSchedule() {
//     final fieldNames = ["Distributor Name", "Day"];

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add Schedule'),
//           content: DynamicForm(
//             fieldNames: fieldNames,
//             onSubmit: (values) {
//               final newSchedule = {
//                 'name': values["Distributor Name"] ?? "",
//                 'day': values["Day"] ?? "",
//               };
//               scheduleBox.add(newSchedule);
//             },
//           ),
//         );
//       },
//     );
//   }

//   // ---------------- EDIT Schedule ----------------
//   void _editSchedule(int key, Map schedule) {
//     final fieldNames = ["Distributor Name", "Day"];

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Schedule"),
//           content: DynamicForm(
//             fieldNames: fieldNames,
//             onSubmit: (values) {
//               final updatedSchedule = {
//                 'name': values["Distributor Name"] ?? "",
//                 'day': values["Day"] ?? "",
//               };
//               scheduleBox.put(key, updatedSchedule);
//             },
//           ),
//         );
//       },
//     );
//   }

//   // ---------------- DELETE Schedule ----------------
//   void _deleteSchedule(int key) {
//     scheduleBox.delete(key);
//   }

//   // ---------------- UI ----------------
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Booking Schedule"),
//         centerTitle: true,
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _addSchedule,
//               child: const Text("+ Add Schedule"),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ValueListenableBuilder(
//                     valueListenable: scheduleBox.listenable(),
//                     builder: (context, Box box, _) {
//                       if (box.isEmpty) {
//                         return const Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Center(child: Text("No schedules available")),
//                         );
//                       }

//                       return DataTable(
//                         columns: const [
//                           DataColumn(label: Text("Distributor Name")),
//                           DataColumn(label: Text("Day")),
//                           DataColumn(label: Text("Actions")),
//                         ],
//                         rows: box.keys.map((key) {
//                           final schedule = box.get(key) as Map;
//                           return DataRow(
//                             cells: [
//                               DataCell(Text(schedule['name'] ?? "")),
//                               DataCell(Text(schedule['day'] ?? "")),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.edit,
//                                           color: Colors.blue),
//                                       onPressed: () =>
//                                           _editSchedule(key, schedule),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.delete,
//                                           color: Colors.red),
//                                       onPressed: () => _deleteSchedule(key),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:software/reuseable_widget/dynamic_form.dart';

// class SchedulePage extends StatefulWidget {
//   const SchedulePage({super.key});

//   @override
//   State<SchedulePage> createState() => _SchedulePageState();
// }

// class _SchedulePageState extends State<SchedulePage> {
//   late Box scheduleBox;

//   @override
//   void initState() {
//     super.initState();
//     scheduleBox = Hive.box('scheduleBox');
//   }

//   void _addSchedule() {
//     final fieldNames = ["Distributor Name", "Day"];

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add Schedule'),
//           content: DynamicForm(
//             fieldNames: fieldNames,
//             onSubmit: (values) {
//               final newSchedule = {
//                 'name': values["Distributor Name"] ?? "",
//                 'day': values["Day"] ?? "",
//               };
//               scheduleBox.add(newSchedule);
//             },
//           ),
//         );
//       },
//     );
//   }

//   // ---------------- EDIT Schedule ----------------
//   void _editSchedule(int key, Map schedule) {
//     final fieldNames = ["Distributor Name", "Day"];

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Schedule"),
//           content: DynamicForm(
//             fieldNames: fieldNames,
//             initialValues: {
//               "Distributor Name": schedule['name'] ?? "",
//               "Day": schedule['day'] ?? "",
//             },
//             onSubmit: (values) {
//               final updatedSchedule = {
//                 'name': values["Distributor Name"] ?? "",
//                 'day': values["Day"] ?? "",
//               };
//               scheduleBox.put(key, updatedSchedule);
//             },
//           ),
//         );
//       },
//     );
//   }

//   void _deleteSchedule(int key) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Are you sure?"),
//           content: const Text("This schedule will be deleted permanently."),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 scheduleBox.delete(key);
//                 Navigator.pop(context);
//               },
//               child: const Text("Delete"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Booking Schedule"),
//         centerTitle: true,
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _addSchedule,
//               child: const Text("+ Add Schedule"),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ValueListenableBuilder(
//                     valueListenable: scheduleBox.listenable(),
//                     builder: (context, Box box, _) {
//                       if (box.isEmpty) {
//                         return const Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Center(child: Text("No schedules available")),
//                         );
//                       }

//                       return DataTable(
//                         columns: const [
//                           DataColumn(label: Text("Distributor Name")),
//                           DataColumn(label: Text("Day")),
//                           DataColumn(label: Text("Actions")),
//                         ],
//                         rows: box.keys.map((key) {
//                           final schedule = box.get(key) as Map;
//                           return DataRow(
//                             cells: [
//                               DataCell(Text(schedule['name'] ?? "")),
//                               DataCell(Text(schedule['day'] ?? "")),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.edit,
//                                           color: Colors.blue),
//                                       onPressed: () =>
//                                           _editSchedule(key, schedule),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.delete,
//                                           color: Colors.red),
//                                       onPressed: () => _deleteSchedule(key),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class PurchaseScreen extends StatefulWidget {
//   const PurchaseScreen({super.key});

//   @override
//   State<PurchaseScreen> createState() => _PurchaseScreenState();
// }

// class _PurchaseScreenState extends State<PurchaseScreen> {
//   final Box purchaseBox = Hive.box('purchaseBox');

//   final TextEditingController companyController = TextEditingController();
//   final TextEditingController amountController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Purchases")),
//       body: Column(
//         children: [
//           // 🔹 Add Purchase Form
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 TextField(
//                   controller: companyController,
//                   decoration: const InputDecoration(
//                     labelText: "Company Name (default: Non Company)",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 TextField(
//                   controller: amountController,
//                   decoration: const InputDecoration(
//                     labelText: "Amount",
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//                 const SizedBox(height: 10),
//                 ElevatedButton.icon(
//                   icon: const Icon(Icons.add),
//                   label: const Text("Add Purchase"),
//                   onPressed: _addPurchase,
//                 ),
//               ],
//             ),
//           ),

//           const Divider(),

//           // 🔹 List of Purchases
//           Expanded(
//             child: ValueListenableBuilder(
//               valueListenable: purchaseBox.listenable(),
//               builder: (context, box, _) {
//                 if (box.isEmpty) {
//                   return const Center(child: Text("No purchases yet"));
//                 }

//                 return ListView.builder(
//                   itemCount: box.length,
//                   itemBuilder: (context, index) {
//                     final purchase = box.getAt(index);

//                     if (purchase is! Map) {
//                       return const SizedBox(); // skip invalid entries
//                     }

//                     return Card(
//                       margin: const EdgeInsets.all(8),
//                       child: ListTile(
//                         title: Text(
//                           "${purchase['company']} - Rs.${purchase['amount']}",
//                         ),
//                         subtitle: Text(
//                           "${purchase['day']} | ${purchase['date']}",
//                         ),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             IconButton(
//                               icon:
//                                   const Icon(Icons.edit, color: Colors.orange),
//                               onPressed: () => _editPurchase(index, purchase),
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.delete, color: Colors.red),
//                               onPressed: () => _deletePurchase(index),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _addPurchase() {
//     final purchase = {
//       'company': companyController.text.isEmpty
//           ? 'Non Company'
//           : companyController.text,
//       'date': DateTime.now().toString(),
//       'day': _getDayName(DateTime.now()),
//       'amount': double.tryParse(amountController.text) ?? 0.0,
//     };

//     purchaseBox.add(purchase);

//     companyController.clear();
//     amountController.clear();

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Purchase added successfully!')),
//     );
//   }

//   void _deletePurchase(int index) {
//     purchaseBox.deleteAt(index);
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Purchase deleted')),
//     );
//   }

//   void _editPurchase(int index, Map purchase) {
//     final TextEditingController companyController =
//         TextEditingController(text: purchase['company']);
//     final TextEditingController amountController =
//         TextEditingController(text: purchase['amount'].toString());

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Edit Purchase"),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: companyController,
//               decoration: const InputDecoration(labelText: "Company Name"),
//             ),
//             TextField(
//               controller: amountController,
//               decoration: const InputDecoration(labelText: "Amount"),
//               keyboardType: TextInputType.number,
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final updatedPurchase = {
//                 'company': companyController.text,
//                 'date': purchase['date'], // keep old date
//                 'day': purchase['day'], // keep old day
//                 'amount': double.tryParse(amountController.text) ??
//                     purchase['amount'],
//               };

//               purchaseBox.putAt(index, updatedPurchase);
//               Navigator.pop(context);

//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Purchase updated')),
//               );
//             },
//             child: const Text("Save"),
//           ),
//         ],
//       ),
//     );
//   }

//   String _getDayName(DateTime date) {
//     const days = [
//       'Monday',
//       'Tuesday',
//       'Wednesday',
//       'Thursday',
//       'Friday',
//       'Saturday',
//       'Sunday'
//     ];
//     return days[date.weekday - 1];
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:software/reuseable_widget/dynamic_form.dart';

// class PurchaseScreen extends StatefulWidget {
//   const PurchaseScreen({super.key});

//   @override
//   State<PurchaseScreen> createState() => _PurchaseScreenState();
// }

// class _PurchaseScreenState extends State<PurchaseScreen> {
//   final Box purchaseBox = Hive.box('purchaseBox');

//   final List<String> fieldNames = ['Company Name', 'Amount'];

//   void _addPurchaseDialog({Map<String, String>? initialValues, int? index}) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(index == null ? "Add Purchase" : "Edit Purchase"),
//         content: DynamicForm(
//           fieldNames: fieldNames,
//           initialValues: initialValues,
//           onSubmit: (values) {
//             final purchase = {
//               'company': values['Company Name']!.isEmpty
//                   ? 'Non Company'
//                   : values['Company Name']!,
//               'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
//               'day': DateFormat('EEEE').format(DateTime.now()),
//               'amount': double.tryParse(values['Amount'] ?? '0') ?? 0.0,
//             };

//             if (index == null) {
//               purchaseBox.add(purchase);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Purchase added successfully!')),
//               );
//             } else {
//               purchaseBox.putAt(index, purchase);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Purchase updated successfully!')),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }

//   void _deletePurchase(int index) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Are you sure?"),
//           content: const Text("This purchase will be deleted permanently."),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context), // Cancel
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 purchaseBox.deleteAt(index);
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Purchase deleted')),
//                 );
//               },
//               child: const Text("Delete"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Purchases"),
//         backgroundColor: Color(0xFF008000),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: ElevatedButton.icon(
//               icon: const Icon(Icons.add),
//               label: const Text("Add Purchase"),
//               onPressed: () => _addPurchaseDialog(),
//             ),
//           ),
//           const Divider(),
//           Expanded(
//             child: ValueListenableBuilder(
//               valueListenable: purchaseBox.listenable(),
//               builder: (context, box, _) {
//                 if (box.isEmpty) {
//                   return const Center(child: Text("No purchases yet"));
//                 }

//                 return ListView.builder(
//                   itemCount: box.length,
//                   itemBuilder: (context, index) {
//                     final purchase = box.getAt(index);

//                     if (purchase is! Map) return const SizedBox();

//                     return Card(
//                       margin: const EdgeInsets.all(8),
//                       child: ListTile(
//                         title: Text(
//                           "${purchase['company']} - Rs.${purchase['amount']}",
//                         ),
//                         subtitle: Text(
//                           "${purchase['day']} | ${purchase['date']}",
//                         ),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             IconButton(
//                               icon:
//                                   const Icon(Icons.edit, color: Colors.orange),
//                               onPressed: () => _addPurchaseDialog(
//                                 initialValues: {
//                                   'Company Name': purchase['company'],
//                                   'Amount': purchase['amount'].toString(),
//                                 },
//                                 index: index,
//                               ),
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.delete, color: Colors.red),
//                               onPressed: () => _deletePurchase(index),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:software/reuseable_widget/dynamic_form.dart';

// class PurchaseScreen extends StatefulWidget {
//   const PurchaseScreen({super.key});

//   @override
//   State<PurchaseScreen> createState() => _PurchaseScreenState();
// }

// class _PurchaseScreenState extends State<PurchaseScreen> {
//   final Box purchaseBox = Hive.box('purchaseBox');
//   final List<String> fieldNames = ['Company Name', 'Amount'];

//   String searchQuery = ""; // 🔍 Search text holder

//   void _addPurchaseDialog({Map<String, String>? initialValues, int? index}) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(index == null ? "Add Purchase" : "Edit Purchase"),
//         content: DynamicForm(
//           fieldNames: fieldNames,
//           initialValues: initialValues,
//           onSubmit: (values) {
//             final purchase = {
//               'company': values['Company Name']!.isEmpty
//                   ? 'Non Company'
//                   : values['Company Name']!,
//               'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
//               'day': DateFormat('EEEE').format(DateTime.now()),
//               'amount': double.tryParse(values['Amount'] ?? '0') ?? 0.0,
//             };

//             if (index == null) {
//               purchaseBox.add(purchase);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Purchase added successfully!')),
//               );
//             } else {
//               purchaseBox.putAt(index, purchase);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Purchase updated successfully!')),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }

//   void _deletePurchase(int index) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Are you sure?"),
//           content: const Text("This purchase will be deleted permanently."),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context), // Cancel
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 purchaseBox.deleteAt(index);
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Purchase deleted')),
//                 );
//               },
//               child: const Text("Delete"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Purchases"),
//         backgroundColor: const Color(0xFF008000),
//       ),
//       body: Column(
//         children: [
//           // 🔍 Search TextField
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: TextField(
//               decoration: const InputDecoration(
//                 hintText: "Search by company name...",
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   searchQuery = value.trim().toLowerCase();
//                 });
//               },
//             ),
//           ),

//           // ➕ Add Purchase Button
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: ElevatedButton.icon(
//               icon: const Icon(Icons.add),
//               label: const Text("Add Purchase"),
//               onPressed: () => _addPurchaseDialog(),
//             ),
//           ),
//           const Divider(),

//           // 📋 Purchase List
//           Expanded(
//             child: ValueListenableBuilder(
//               valueListenable: purchaseBox.listenable(),
//               builder: (context, box, _) {
//                 if (box.isEmpty) {
//                   return const Center(child: Text("No purchases yet"));
//                 }

//                 // ✅ Build a list with index + purchase
//                 final purchases = List.generate(box.length, (i) {
//                   final p = box.getAt(i);
//                   return {'index': i, 'purchase': p};
//                 });

//                 // ✅ Sort so matches go first
//                 purchases.sort((a, b) {
//                   final aPurchase = a['purchase'] as Map;
//                   final bPurchase = b['purchase'] as Map;

//                   final aCompany =
//                       (aPurchase['company'] as String).toLowerCase();
//                   final bCompany =
//                       (bPurchase['company'] as String).toLowerCase();

//                   final aMatch = aCompany.contains(searchQuery);
//                   final bMatch = bCompany.contains(searchQuery);

//                   if (aMatch && !bMatch) return -1; // a first
//                   if (!aMatch && bMatch) return 1; // b first
//                   return 0; // keep order otherwise
//                 });

//                 return ListView.builder(
//                   itemCount: purchases.length,
//                   itemBuilder: (context, i) {
//                     final purchase = purchases[i]['purchase'] as Map;
//                     final index = purchases[i]['index'] as int;

//                     return Card(
//                       margin: const EdgeInsets.all(8),
//                       child: ListTile(
//                         title: Text(
//                           "${purchase['company']} - Rs.${purchase['amount']}",
//                         ),
//                         subtitle: Text(
//                           "${purchase['day']} | ${purchase['date']}",
//                         ),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             IconButton(
//                               icon:
//                                   const Icon(Icons.edit, color: Colors.orange),
//                               onPressed: () => _addPurchaseDialog(
//                                 initialValues: {
//                                   'Company Name': purchase['company'],
//                                   'Amount': purchase['amount'].toString(),
//                                 },
//                                 index: index,
//                               ),
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.delete, color: Colors.red),
//                               onPressed: () => _deletePurchase(index),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class Currentpurchase extends StatefulWidget {
//   const Currentpurchase({super.key});

//   @override
//   State<Currentpurchase> createState() => _CurrentpurchaseState();
// }

// class _CurrentpurchaseState extends State<Currentpurchase> {
//   static const String routeName = '/currentpurchase';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Current Purchase',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           textAlign: TextAlign.center,
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       backgroundColor: Color(0xFF008000),
//       body: Center(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(50.0),
//               child: Container(
//                 width: 399,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   gradient: LinearGradient(
//                     colors: [Colors.white, Colors.green],
//                     stops: [0.3, 0.3],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Text(
//                       'Today purchasing',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 80),
//                     Align(
//                       alignment: Alignment.bottomLeft,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 100),
//                         child: Text(
//                           '=',
//                           style: TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.all(50.0),
//               child: Container(
//                 width: 399,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   gradient: LinearGradient(
//                     colors: [Colors.white, Colors.green],
//                     stops: [0.3, 0.3],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Text(
//                       'Yesterday purchasing',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 80),
//                     Align(
//                       alignment: Alignment.bottomLeft,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 100),
//                         child: Text(
//                           '=',
//                           style: TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';

// class Currentpurchase extends StatefulWidget {
//   const Currentpurchase({super.key});

//   @override
//   State<Currentpurchase> createState() => _CurrentpurchaseState();
// }

// class _CurrentpurchaseState extends State<Currentpurchase> {
//   static const String routeName = '/currentpurchase';

//   // Hive box
//   final Box purchaseBox = Hive.box('purchaseBox');

//   double todayPurchase = 0.0;
//   double yesterdayPurchase = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _loadPurchases();
//   }

//   // Load today's & yesterday's purchases from Hive
//   void _loadPurchases() {
//     final now = DateTime.now();
//     final todayKey = _formatDateKey(now);
//     final yesterdayKey = _formatDateKey(now.subtract(const Duration(days: 1)));

//     setState(() {
//       todayPurchase = purchaseBox.get(todayKey, defaultValue: 0.0);
//       yesterdayPurchase = purchaseBox.get(yesterdayKey, defaultValue: 0.0);
//     });

//     // Schedule auto reset at 1 AM
//     final nextReset = DateTime(now.year, now.month, now.day + 1, 1);
//     final duration = nextReset.difference(now);
//     Future.delayed(duration, _resetTodayPurchase);
//   }

//   // Format key as yyyy-MM-dd
//   String _formatDateKey(DateTime dt) => DateFormat('yyyy-MM-dd').format(dt);

//   // Reset today's purchase at 1 AM and move to yesterdayPurchase
//   void _resetTodayPurchase() {
//     final now = DateTime.now();
//     final todayKey = _formatDateKey(now);
//     final yesterdayKey = _formatDateKey(now.subtract(const Duration(days: 1)));

//     // Save today's purchase as yesterday's purchase
//     final todayAmount = purchaseBox.get(todayKey, defaultValue: 0.0);
//     purchaseBox.put(yesterdayKey, todayAmount);
//     purchaseBox.put(todayKey, 0.0);

//     setState(() {
//       yesterdayPurchase = todayAmount;
//       todayPurchase = 0.0;
//     });

//     // Schedule next reset for next day
//     final nextReset = DateTime(now.year, now.month, now.day + 1, 1);
//     final duration = nextReset.difference(DateTime.now());
//     Future.delayed(duration, _resetTodayPurchase);
//   }

//   // Call this whenever a new purchase is added
//   void addToTodayPurchase(double amount) {
//     final now = DateTime.now();
//     final hour = now.hour;

//     // Only count if time between 8 AM and 1 AM
//     if ((hour >= 8 && hour <= 23) || (hour >= 0 && hour <= 1)) {
//       final todayKey = _formatDateKey(now);
//       final currentPurchase = purchaseBox.get(todayKey, defaultValue: 0.0);
//       final newPurchase = currentPurchase + amount;

//       purchaseBox.put(todayKey, newPurchase);

//       setState(() {
//         todayPurchase = newPurchase;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Current Purchase',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           textAlign: TextAlign.center,
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       backgroundColor: const Color(0xFF008000),
//       body: Center(
//         child: Column(
//           children: [
//             const SizedBox(height: 50),
//             _purchaseCard('Today Purchases', todayPurchase),
//             const SizedBox(height: 20),
//             _purchaseCard('Yesterday Purchases', yesterdayPurchase),
//           ],
//         ),
//       ),
//     );
//   }

//   // Reusable purchase card
//   Widget _purchaseCard(String title, double amount) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         width: double.infinity,
//         height: 180,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           gradient: const LinearGradient(
//             colors: [Colors.white, Colors.green],
//             stops: [0.3, 0.3],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 50),
//             Text(
//               'Rs. ${amount.toStringAsFixed(2)}',
//               style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';

// class Currentsale extends StatefulWidget {
//   const Currentsale({super.key});

//   @override
//   State<Currentsale> createState() => _CurrentsaleState();
// }

// class _CurrentsaleState extends State<Currentsale> {
//   static const String routeName = '/currentsale';

//   // Hive boxes
//   final Box currentsaleBox = Hive.box('currentsaleBox');

//   double todaySale = 0.0;
//   double yesterdaySale = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _loadSales();
//   }

//   // Load today & yesterday sales from Hive
//   void _loadSales() {
//     final now = DateTime.now();
//     final todayKey = _formatDateKey(now);
//     final yesterdayKey = _formatDateKey(now.subtract(const Duration(days: 1)));

//     setState(() {
//       todaySale = currentsaleBox.get(todayKey, defaultValue: 0.0);
//       yesterdaySale = currentsaleBox.get(yesterdayKey, defaultValue: 0.0);
//     });

//     // Schedule auto reset at 1 AM
//     final nextReset = DateTime(now.year, now.month, now.day + 1, 1);
//     final duration = nextReset.difference(now);
//     Future.delayed(duration, _resetTodaySale);
//   }

//   // Format key as yyyy-MM-dd
//   String _formatDateKey(DateTime dt) => DateFormat('yyyy-MM-dd').format(dt);

//   // Reset today's sale at 1 AM and move to yesterdaySale
//   void _resetTodaySale() {
//     final now = DateTime.now();
//     final todayKey = _formatDateKey(now);
//     final yesterdayKey = _formatDateKey(now.subtract(const Duration(days: 1)));

//     // Save today's sale as yesterday's sale
//     final todayAmount = currentsaleBox.get(todayKey, defaultValue: 0.0);
//     currentsaleBox.put(yesterdayKey, todayAmount);
//     currentsaleBox.put(todayKey, 0.0);

//     setState(() {
//       yesterdaySale = todayAmount;
//       todaySale = 0.0;
//     });

//     // Schedule next reset for next day
//     final nextReset = DateTime(now.year, now.month, now.day + 1, 1);
//     final duration = nextReset.difference(DateTime.now());
//     Future.delayed(duration, _resetTodaySale);
//   }

//   // Call this function whenever a bill is printed
//   void addToTodaySale(double amount) {
//     final now = DateTime.now();
//     final hour = now.hour;

//     // Only add if time between 8 AM and 1 AM (next day)
//     if ((hour >= 8 && hour <= 23) || (hour >= 0 && hour <= 1)) {
//       final todayKey = _formatDateKey(now);
//       final currentSale = currentsaleBox.get(todayKey, defaultValue: 0.0);
//       final newSale = currentSale + amount;

//       currentsaleBox.put(todayKey, newSale);

//       setState(() {
//         todaySale = newSale;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Current Sale',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           textAlign: TextAlign.center,
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       backgroundColor: const Color(0xFF008000),
//       body: Center(
//         child: Column(
//           children: [
//             const SizedBox(height: 50),
//             _saleCard('Today Sales', todaySale),
//             const SizedBox(height: 20),
//             _saleCard('Yesterday Sales', yesterdaySale),
//           ],
//         ),
//       ),
//     );
//   }

//   // Reusable sale card
//   Widget _saleCard(String title, double amount) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         width: double.infinity,
//         height: 180,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           gradient: const LinearGradient(
//             colors: [Colors.white, Colors.green],
//             stops: [0.3, 0.3],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 50),
//             Text(
//               'Rs. ${amount.toStringAsFixed(2)}',
//               style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';

// class Currentsale extends StatefulWidget {
//   const Currentsale({super.key});

//   @override
//   State<Currentsale> createState() => _DailySaleReportState();
// }

// class _DailySaleReportState extends State<Currentsale> {
//   final Box currentsaleBox =
//       Hive.box('currentsaleBox'); // ✅ Use a Hive box for sales

//   Map<String, double> dailyTotals = {};

//   @override
//   void initState() {
//     super.initState();
//     _loadDailySales();
//   }

//   // 🔹 Business date key (8 AM → 1 AM next day)
//   String _businessDateKey(DateTime dt) {
//     if (dt.hour < 8) {
//       dt = dt.subtract(const Duration(days: 1));
//     }
//     return DateFormat('yyyy-MM-dd').format(dt);
//   }

//   // 🔹 Load all sales and group by business date
//   void _loadDailySales() {
//     Map<String, double> totals = {};

//     for (var key in currentsaleBox.keys) {
//       final data = currentsaleBox.get(key, defaultValue: []);
//       if (data is List) {
//         for (var item in data) {
//           if (item is Map &&
//               item.containsKey('amount') &&
//               item.containsKey('time')) {
//             final amount = (item['amount'] as num).toDouble();
//             final time = DateTime.parse(item['time']);
//             final bKey = _businessDateKey(time);

//             totals[bKey] = (totals[bKey] ?? 0) + amount;
//           }
//         }
//       }
//     }

//     setState(() {
//       dailyTotals = totals;
//     });
//   }

//   // 🔹 Add or subtract a sale
//   void addSale(double amount, {bool isSubtract = false}) {
//     final now = DateTime.now();
//     final todayKey = _businessDateKey(now);

//     final data = currentsaleBox.get(todayKey, defaultValue: []);
//     List sales = (data is List) ? data : [];

//     sales.add({
//       'amount': isSubtract ? -amount : amount,
//       'time': now.toIso8601String(),
//     });

//     currentsaleBox.put(todayKey, sales);

//     _loadDailySales();
//   }

//   // 🔹 Show dialog to enter amount
//   void _showSaleDialog({bool isSubtract = false}) {
//     final TextEditingController amountController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(isSubtract ? "Subtract Sale" : "Add Sale"),
//         content: TextField(
//           controller: amountController,
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(labelText: "Enter amount"),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final amount = double.tryParse(amountController.text) ?? 0.0;
//               if (amount > 0) {
//                 addSale(amount, isSubtract: isSubtract);
//               }
//               Navigator.pop(context);
//             },
//             child: const Text("Save"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final sortedKeys = dailyTotals.keys.toList()
//       ..sort((a, b) => b.compareTo(a)); // latest first

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Daily Sale Report',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       backgroundColor: const Color(0xFF008000),
//       body: ListView.builder(
//         itemCount: sortedKeys.length,
//         itemBuilder: (context, index) {
//           final key = sortedKeys[index];
//           final date = DateTime.parse(key);
//           final dayName = DateFormat('EEEE').format(date);
//           final formattedDate = DateFormat('dd-MMM-yyyy').format(date);

//           return _saleCard(
//             "$dayName ($formattedDate)",
//             dailyTotals[key] ?? 0.0,
//           );
//         },
//       ),

//       // 🔹 Two FABs: Add (+) and Subtract (–)
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             heroTag: "addSale",
//             onPressed: () => _showSaleDialog(isSubtract: false),
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             heroTag: "subtractSale",
//             backgroundColor: Colors.red,
//             onPressed: () => _showSaleDialog(isSubtract: true),
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }

//   // 🔹 Reusable card widget
//   Widget _saleCard(String title, double amount) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           gradient: const LinearGradient(
//             colors: [Colors.white, Colors.green],
//             stops: [0.3, 0.3],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               "Rs. ${amount.toStringAsFixed(2)}",
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: amount >= 0 ? Colors.black : Colors.red,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class Viewsale extends StatefulWidget {
//   const Viewsale({super.key});

//   @override
//   State<Viewsale> createState() => _ViewsaleState();
// }

// class _ViewsaleState extends State<Viewsale> {
//   late Box viewsalesBox;

//   @override
//   void initState() {
//     super.initState();
//     viewsalesBox = Hive.box('viewsalesBox'); // ✅ Read invoices
//   }

//   @override
//   Widget build(BuildContext context) {
//     final sales = viewsalesBox.values.toList();

//     return Scaffold(
//       appBar: AppBar(title: const Text("View Sales")),
//       body: sales.isEmpty
//           ? const Center(child: Text("No sales yet"))
//           : ListView.builder(
//               itemCount: sales.length,
//               itemBuilder: (context, index) {
//                 final bill = sales[index] as Map;
//                 return Card(
//                   margin: const EdgeInsets.all(8),
//                   child: ExpansionTile(
//                     title: Text(
//                         "Bill: ${bill['billNo']} - Rs. ${bill['grandTotal']}"),
//                     subtitle: Text(
//                         "Customer: ${bill['customer']} | Date: ${bill['date']}"),
//                     children: [
//                       ...List.generate(
//                         (bill['items'] as List).length,
//                         (i) {
//                           final item = bill['items'][i];
//                           return ListTile(
//                             title: Text(item['name']),
//                             subtitle: Text("Qty: ${item['qty']}"),
//                             trailing: Text("Rs. ${item['price']}"),
//                           );
//                         },
//                       ),
//                       ListTile(
//                         title: Text("Subtotal: Rs.${bill['subtotal']}"),
//                       ),
//                       ListTile(
//                         title: Text("Discount: Rs.${bill['discount']}"),
//                       ),
//                       ListTile(
//                         title: Text("Total: Rs.${bill['grandTotal']}"),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';

// class Viewsale extends StatefulWidget {
//   const Viewsale({super.key});

//   @override
//   State<Viewsale> createState() => _ViewsaleState();
// }

// class _ViewsaleState extends State<Viewsale> {
//   late Box viewsalesBox;

//   @override
//   void initState() {
//     super.initState();
//     viewsalesBox = Hive.box('viewsalesBox'); // ✅ Read invoices
//   }

//   void _addManualSale() {
//     final customerController = TextEditingController();
//     final subtotalController = TextEditingController();
//     final discountController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (ctx) {
//         return AlertDialog(
//           title: const Text("Add Manual Sale"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: customerController,
//                 decoration: const InputDecoration(labelText: "Customer Name"),
//               ),
//               TextField(
//                 controller: subtotalController,
//                 decoration: const InputDecoration(labelText: "Subtotal"),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: discountController,
//                 decoration: const InputDecoration(labelText: "Discount"),
//                 keyboardType: TextInputType.number,
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(ctx),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 final subtotal =
//                     double.tryParse(subtotalController.text) ?? 0.0;
//                 final discount =
//                     double.tryParse(discountController.text) ?? 0.0;
//                 final grandTotal = subtotal - discount;

//                 final bill = {
//                   "billNo": viewsalesBox.length + 1,
//                   "customer": customerController.text.isEmpty
//                       ? "Walk-in"
//                       : customerController.text,
//                   "date": DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now()),
//                   "items": [
//                     {
//                       "name": "Manual Sale",
//                       "qty": 1,
//                       "price": grandTotal,
//                     }
//                   ],
//                   "subtotal": subtotal,
//                   "discount": discount,
//                   "grandTotal": grandTotal,
//                 };

//                 viewsalesBox.add(bill);
//                 setState(() {});
//                 Navigator.pop(ctx);
//               },
//               child: const Text("Save"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final sales = viewsalesBox.values.toList();

//     return Scaffold(
//       appBar: AppBar(title: const Text("View Sales")),
//       body: sales.isEmpty
//           ? const Center(child: Text("No sales yet"))
//           : ListView.builder(
//               itemCount: sales.length,
//               itemBuilder: (context, index) {
//                 final bill = sales[index] as Map;
//                 return Card(
//                   margin: const EdgeInsets.all(8),
//                   child: ExpansionTile(
//                     title: Text(
//                         "Bill: ${bill['billNo']} - Rs. ${bill['grandTotal']}"),
//                     subtitle: Text(
//                         "Customer: ${bill['customer']} | Date: ${bill['date']}"),
//                     children: [
//                       ...List.generate(
//                         (bill['items'] as List).length,
//                         (i) {
//                           final item = bill['items'][i];
//                           return ListTile(
//                             title: Text(item['name']),
//                             subtitle: Text("Qty: ${item['qty']}"),
//                             trailing: Text("Rs. ${item['price']}"),
//                           );
//                         },
//                       ),
//                       ListTile(
//                         title: Text("Subtotal: Rs.${bill['subtotal']}"),
//                       ),
//                       ListTile(
//                         title: Text("Discount: Rs.${bill['discount']}"),
//                       ),
//                       ListTile(
//                         title: Text("Total: Rs.${bill['grandTotal']}"),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addManualSale,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart'; //INTERNATINAL PACKAGE FOR DATES ,TIMES ,CURRENCY ETC
// import '../reuseable_widget/dynamic_form.dart';

// class Viewsale extends StatefulWidget {
//   const Viewsale({super.key});

//   @override
//   State<Viewsale> createState() => _ViewsaleState();
// }

// class _ViewsaleState extends State<Viewsale> {
//   late Box viewsalesBox;

//   @override
//   void initState() {
//     super.initState();
//     viewsalesBox = Hive.box('viewsalesBox');
//   }

//   void _addManualSale() {
//     showDialog(
//       context: context,
//       builder: (ctx) {
//         return AlertDialog(
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.zero,
//           ),
//           title: const Text("Add Manual Sale"),
//           content: DynamicForm(
//             fieldNames: [
//               "Customer Name",
//               "Medicine Name",
//               "Subtotal",
//               "Discount"
//             ],
//             onSubmit: (values) {
//               final subtotal =
//                   double.tryParse(values["Subtotal"] ?? "0") ?? 0.0;
//               final discount =
//                   double.tryParse(values["Discount"] ?? "0") ?? 0.0;
//               final grandTotal = subtotal - discount;

//               final bill = {
//                 "billNo": viewsalesBox.length + 1,
//                 "customer": values["Customer Name"]!.isEmpty
//                     ? "Random"
//                     : values["Customer Name"],
//                 // "customer": values["Customer Name"],
//                 "date": DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now()),
//                 "items": [
//                   {
//                     "name": "Manual Sale",
//                     "qty": 1,
//                     "price": grandTotal,
//                   }
//                 ],
//                 "subtotal": subtotal,
//                 "discount": discount,
//                 "grandTotal": grandTotal,
//               };

//               viewsalesBox.add(bill);
//               setState(() {});
//             },
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final sales = viewsalesBox.values.toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "View Sales",
//         ),
//         backgroundColor: Color(0xFF008000),
//       ),
//       body: sales.isEmpty
//           ? const Center(child: Text("No sales yet"))
//           : ListView.builder(
//               itemCount: sales.length,
//               itemBuilder: (context, index) {
//                 final bill = sales[index] as Map;
//                 return Card(
//                   margin: const EdgeInsets.all(8),
//                   child: ExpansionTile(
//                     title: Text(
//                         "Bill: ${bill['billNo']} - Rs. ${bill['grandTotal']}"),
//                     subtitle: Text(
//                         "Customer: ${bill['customer']} | Date: ${bill['date']}"),
//                     children: [
//                       ...List.generate(
//                         (bill['items'] as List).length,
//                         (i) {
//                           final item = bill['items'][i];
//                           return ListTile(
//                             title: Text(item['name']),
//                             subtitle: Text("Qty: ${item['qty']}"),
//                             trailing: Text("Rs. ${item['price']}"),
//                           );
//                         },
//                       ),
//                       ListTile(
//                         title: Text("Subtotal: Rs.${bill['subtotal']}"),
//                       ),
//                       ListTile(
//                         title: Text("Discount: Rs.${bill['discount']}"),
//                       ),
//                       ListTile(
//                         title: Text("Total: Rs.${bill['grandTotal']}"),
//                       ),

//                     ],

//                   ),
//                 );
//               },
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addManualSale,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';
// import '../reuseable_widget/dynamic_form.dart';

// class Viewsale extends StatefulWidget {
//   const Viewsale({super.key});

//   @override
//   State<Viewsale> createState() => _ViewsaleState();
// }

// class _ViewsaleState extends State<Viewsale> {
//   late Box viewsalesBox;

//   @override
//   void initState() {
//     super.initState();
//     viewsalesBox = Hive.box('viewsalesBox');
//   }

//   // ✅ Add Sale
//   void _addManualSale() {
//     showDialog(
//       context: context,
//       builder: (ctx) {
//         return AlertDialog(
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.zero,
//           ),
//           title: const Text("Add Manual Sale"),
//           content: DynamicForm(
//             fieldNames: [
//               "Customer Name",
//               "Medicine Name",
//               "Subtotal",
//               "Discount"
//             ],
//             onSubmit: (values) {
//               final subtotal =
//                   double.tryParse(values["Subtotal"] ?? "0") ?? 0.0;
//               final discount =
//                   double.tryParse(values["Discount"] ?? "0") ?? 0.0;
//               final grandTotal = subtotal - discount;

//               final bill = {
//                 "billNo": viewsalesBox.length + 1,
//                 "customer": values["Customer Name"]!.isEmpty
//                     ? "Random"
//                     : values["Customer Name"],
//                 "date": DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now()),
//                 "items": [
//                   {
//                     "name": values["Medicine Name"]!.isEmpty
//                         ? "Manual Sale"
//                         : values["Medicine Name"],
//                     "qty": 1,
//                     "price": grandTotal,
//                   }
//                 ],
//                 "subtotal": subtotal,
//                 "discount": discount,
//                 "grandTotal": grandTotal,
//               };

//               viewsalesBox.add(bill);
//               setState(() {});
//             },
//           ),
//         );
//       },
//     );
//   }

//   // ✅ Edit Sale
//   void _editSale(int index, Map bill) {
//     showDialog(
//       context: context,
//       builder: (ctx) {
//         return AlertDialog(
//           title: const Text("Edit Sale"),
//           content: DynamicForm(
//             fieldNames: [
//               "Customer Name",
//               "Medicine Name",
//               "Subtotal",
//               "Discount"
//             ],
//             initialValues: {
//               "Customer Name": bill["customer"] ?? "",
//               "Medicine Name": bill["items"][0]["name"] ?? "",
//               "Subtotal": bill["subtotal"].toString(),
//               "Discount": bill["discount"].toString(),
//             },
//             onSubmit: (values) {
//               final subtotal =
//                   double.tryParse(values["Subtotal"] ?? "0") ?? 0.0;
//               final discount =
//                   double.tryParse(values["Discount"] ?? "0") ?? 0.0;
//               final grandTotal = subtotal - discount;

//               final updatedBill = {
//                 "billNo": bill["billNo"],
//                 "customer": values["Customer Name"],
//                 "date": bill["date"], // keep original date
//                 "items": [
//                   {
//                     "name": values["Medicine Name"],
//                     "qty": 1,
//                     "price": grandTotal,
//                   }
//                 ],
//                 "subtotal": subtotal,
//                 "discount": discount,
//                 "grandTotal": grandTotal,
//               };

//               viewsalesBox.putAt(index, updatedBill);
//               setState(() {});
//             },
//           ),
//         );
//       },
//     );
//   }

//   // ✅ Delete Sale
//   void _deleteSale(int index) {
//     viewsalesBox.deleteAt(index);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     final sales = viewsalesBox.values.toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "View Sales",
//         ),
//         backgroundColor: Color(0xFF008000),
//       ),
//       body: sales.isEmpty
//           ? const Center(child: Text("No sales yet"))
//           : ListView.builder(
//               itemCount: sales.length,
//               itemBuilder: (context, index) {
//                 final bill = sales[index] as Map;
//                 return Card(
//                   margin: const EdgeInsets.all(8),
//                   child: ExpansionTile(
//                     title: Text(
//                         "Bill: ${bill['billNo']} - Rs. ${bill['grandTotal']}"),
//                     subtitle: Text(
//                         "Customer: ${bill['customer']} | Date: ${bill['date']}"),
//                     children: [
//                       ...List.generate(
//                         (bill['items'] as List).length,
//                         (i) {
//                           final item = bill['items'][i];
//                           return ListTile(
//                             title: Text(item['name']),
//                             subtitle: Text("Qty: ${item['qty']}"),
//                             trailing: Text("Rs. ${item['price']}"),
//                           );
//                         },
//                       ),
//                       ListTile(
//                         title: Text("Subtotal: Rs.${bill['subtotal']}"),
//                       ),
//                       ListTile(
//                         title: Text("Discount: Rs.${bill['discount']}"),
//                       ),
//                       ListTile(
//                         title: Text("Total: Rs.${bill['grandTotal']}"),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.edit, color: Colors.blue),
//                             onPressed: () => _editSale(index, bill),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.delete, color: Colors.red),
//                             onPressed: () => _deleteSale(index),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addManualSale,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// class Availablestocks extends StatefulWidget {
//   const Availablestocks({super.key});

//   @override
//   State<Availablestocks> createState() => _AvailablestocksState();
// }

// class _AvailablestocksState extends State<Availablestocks> {
//   static const routeName = '/availablestocks';
//   List<Map<String, dynamic>> stocks = [];

//   void _adddstocks() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final medicinenameController = TextEditingController();
//         final companyController = TextEditingController();

//         return AlertDialog(
//           title: const Text('Add Stocks'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: medicinenameController,
//                 decoration: const InputDecoration(labelText: 'Medicine Name'),
//               ),
//               TextField(
//                 controller: companyController,
//                 decoration: const InputDecoration(labelText: 'Company'),
//               ),
//               const SizedBox(height: 15),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     stocks.add({
//                       "Medicine Name": medicinenameController.text,
//                       "Company": companyController.text,
//                     });
//                   });
//                   Navigator.pop(context);
//                 },
//                 child: const Text('Add'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void editstocks(Map<String, dynamic> stock) {
//     final medicinenameController = TextEditingController(
//       text: stock['Medicine Name'],
//     );
//     final companyController = TextEditingController(text: stock['Company']);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Stocks"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: medicinenameController,
//                 decoration: const InputDecoration(labelText: 'Medicine Name'),
//               ),
//               TextField(
//                 controller: companyController,
//                 decoration: const InputDecoration(labelText: 'Company'),
//               ),
//               const SizedBox(height: 15),
//               Row(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text("Cancel"),
//                   ),
//                   const SizedBox(width: 15),
//                   ElevatedButton(
//                     onPressed: () {
//                       stock["Medicine Name"] = medicinenameController.text;
//                       stock["Company"] = companyController.text;

//                       setState(() {});
//                       Navigator.pop(context);
//                     },
//                     child: const Text("Update"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Available Stocks"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _adddstocks,
//               child: const Text("+ Add Stocks"),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: DataTable(
//                   columns: const [
//                     DataColumn(label: Text("Medicine Name")),
//                     DataColumn(label: Text("Company")),
//                     DataColumn(label: Text("Actions")),
//                   ],
//                   rows:
//                       stocks
//                           .map(
//                             (stock) => DataRow(
//                               cells: [
//                                 DataCell(Text(stock["Medicine Name"] ?? "")),
//                                 DataCell(Text(stock["Company"] ?? "")),
//                                 DataCell(
//                                   Row(
//                                     children: [
//                                       IconButton(
//                                         icon: const Icon(
//                                           Icons.edit,
//                                           color: Colors.blue,
//                                         ),
//                                         onPressed: () => editstocks(stock),
//                                       ),
//                                       IconButton(
//                                         icon: const Icon(
//                                           Icons.delete,
//                                           color: Colors.red,
//                                         ),
//                                         onPressed: () {
//                                           setState(() {
//                                             stocks.remove(stock);
//                                           });
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                           .toList(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// // ✅ Added Hive imports
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class Availablestocks extends StatefulWidget {
//   const Availablestocks({super.key});

//   @override
//   State<Availablestocks> createState() => _AvailablestocksState();
// }

// class _AvailablestocksState extends State<Availablestocks> {
//   static const routeName = '/availablestocks';

//   // ✅ Changed: using Hive box instead of local List
//   late Box stocksBox;

//   @override
//   void initState() {
//     super.initState();
//     stocksBox = Hive.box('stocksBox'); // ✅ Changed
//   }

//   void _adddstocks() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final medicinenameController = TextEditingController();
//         final companyController = TextEditingController();

//         return AlertDialog(
//           title: const Text('Add Stocks'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: medicinenameController,
//                 decoration: const InputDecoration(labelText: 'Medicine Name'),
//               ),
//               TextField(
//                 controller: companyController,
//                 decoration: const InputDecoration(labelText: 'Company'),
//               ),
//               const SizedBox(height: 15),
//               ElevatedButton(
//                 onPressed: () {
//                   // ✅ Changed: Save as Map in Hive
//                   stocksBox.add({
//                     "Medicine Name": medicinenameController.text,
//                     "Company": companyController.text,
//                   });
//                   Navigator.pop(context);
//                 },
//                 child: const Text('Add'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void editstocks(int key, Map stock) {
//     final medicinenameController =
//         TextEditingController(text: stock['Medicine Name']);
//     final companyController = TextEditingController(text: stock['Company']);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Stocks"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: medicinenameController,
//                 decoration: const InputDecoration(labelText: 'Medicine Name'),
//               ),
//               TextField(
//                 controller: companyController,
//                 decoration: const InputDecoration(labelText: 'Company'),
//               ),
//               const SizedBox(height: 15),
//               Row(
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text("Cancel"),
//                   ),
//                   const SizedBox(width: 15),
//                   ElevatedButton(
//                     onPressed: () {
//                       // ✅ Changed: update Map in Hive
//                       stocksBox.put(key, {
//                         "Medicine Name": medicinenameController.text,
//                         "Company": companyController.text,
//                       });
//                       Navigator.pop(context);
//                     },
//                     child: const Text("Update"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Available Stocks"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _adddstocks,
//               child: const Text("+ Add Stocks"),
//             ),
//             Expanded(
//               child: ValueListenableBuilder(
//                 // ✅ Changed: listen to Hive instead of List
//                 valueListenable: stocksBox.listenable(),
//                 builder: (context, Box box, _) {
//                   if (box.isEmpty) {
//                     return const Center(child: Text("No stocks available"));
//                   }

//                   final keys = box.keys.toList();

//                   return SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: DataTable(
//                       columns: const [
//                         DataColumn(label: Text("Medicine Name")),
//                         DataColumn(label: Text("Company")),
//                         DataColumn(label: Text("Actions")),
//                       ],
//                       rows: keys.map((key) {
//                         final stock = box.get(key) as Map;

//                         return DataRow(
//                           cells: [
//                             DataCell(Text(stock["Medicine Name"] ?? "")),
//                             DataCell(Text(stock["Company"] ?? "")),
//                             DataCell(
//                               Row(
//                                 children: [
//                                   IconButton(
//                                     icon: const Icon(
//                                       Icons.edit,
//                                       color: Colors.blue,
//                                     ),
//                                     onPressed: () => editstocks(key, stock),
//                                   ),
//                                   IconButton(
//                                     icon: const Icon(
//                                       Icons.delete,
//                                       color: Colors.red,
//                                     ),
//                                     onPressed: () {
//                                       // ✅ Changed: remove from Hive
//                                       box.delete(key);
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         );
//                       }).toList(),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// // ✅ Added Hive imports
// import 'package:hive_flutter/hive_flutter.dart';

// class Availablestocks extends StatefulWidget {
//   const Availablestocks({super.key});

//   @override
//   State<Availablestocks> createState() => _AvailablestocksState();
// }

// class _AvailablestocksState extends State<Availablestocks> {
//   static const routeName = '/availablestocks';

//   // ✅ Using Hive box instead of local List
//   late Box availableBox;

//   @override
//   void initState() {
//     super.initState();
//     availableBox = Hive.box('availableBox'); // ✅
//   }

//   void _adddstocks() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final medicinenameController = TextEditingController();
//         final companyController = TextEditingController();
//         final tabletsController = TextEditingController(); // ✅ Added
//         final packPriceController = TextEditingController(); // ✅ Added

//         return AlertDialog(
//           title: const Text('Add Stocks'),
//           content: SingleChildScrollView(
//             // ✅ To avoid overflow
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: medicinenameController,
//                   decoration: const InputDecoration(labelText: 'Medicine Name'),
//                 ),
//                 TextField(
//                   controller: companyController,
//                   decoration: const InputDecoration(labelText: 'Company'),
//                 ),
//                 TextField(
//                   controller: tabletsController,
//                   keyboardType: TextInputType.number,
//                   decoration:
//                       const InputDecoration(labelText: 'No. of Tablets'),
//                 ),
//                 TextField(
//                   controller: packPriceController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(labelText: 'Pack Price'),
//                 ),
//                 const SizedBox(height: 15),
//                 ElevatedButton(
//                   onPressed: () {
//                     // ✅ Save new fields into Hive
//                     availableBox.add({
//                       "Medicine Name": medicinenameController.text,
//                       "Company": companyController.text,
//                       "Tablets": tabletsController.text,
//                       "Pack Price": packPriceController.text,
//                     });
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Add'),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void editstocks(int key, Map stock) {
//     final medicinenameController =
//         TextEditingController(text: stock['Medicine Name']);
//     final companyController = TextEditingController(text: stock['Company']);
//     final tabletsController =
//         TextEditingController(text: stock['Tablets'] ?? ""); // ✅ Added
//     final packPriceController =
//         TextEditingController(text: stock['Pack Price'] ?? ""); // ✅ Added

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Stocks"),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: medicinenameController,
//                   decoration: const InputDecoration(labelText: 'Medicine Name'),
//                 ),
//                 TextField(
//                   controller: companyController,
//                   decoration: const InputDecoration(labelText: 'Company'),
//                 ),
//                 TextField(
//                   controller: tabletsController,
//                   keyboardType: TextInputType.number,
//                   decoration:
//                       const InputDecoration(labelText: 'No. of Tablets'),
//                 ),
//                 TextField(
//                   controller: packPriceController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(labelText: 'Pack Price'),
//                 ),
//                 const SizedBox(height: 15),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text("Cancel"),
//                     ),
//                     const SizedBox(width: 15),
//                     ElevatedButton(
//                       onPressed: () {
//                         // ✅ Update new fields too
//                         availableBox.put(key, {
//                           "Medicine Name": medicinenameController.text,
//                           "Company": companyController.text,
//                           "Tablets": tabletsController.text,
//                           "Pack Price": packPriceController.text,
//                         });
//                         Navigator.pop(context);
//                       },
//                       child: const Text("Update"),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Available Stocks"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _adddstocks,
//               child: const Text("+ Add Stocks"),
//             ),
//             Expanded(
//                 child: ValueListenableBuilder(
//               valueListenable: availableBox.listenable(),
//               builder: (context, Box box, _) {
//                 if (box.isEmpty) {
//                   return const Center(child: Text("No stocks available"));
//                 }

//                 final keys = box.keys.toList();

//                 return SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: DataTable(
//                     columns: const [
//                       DataColumn(label: Text("Medicine Name")),
//                       DataColumn(label: Text("Company")),
//                       DataColumn(label: Text("Tablets")), // ✅ Added
//                       DataColumn(label: Text("Pack Price")), // ✅ Added
//                       DataColumn(label: Text("Actions")),
//                     ],
//                     rows: keys.map((key) {
//                       final stock = box.get(key) as Map;

//                       return DataRow(
//                         cells: [
//                           DataCell(Text(stock["Medicine Name"] ?? "")),
//                           DataCell(Text(stock["Company"] ?? "")),
//                           DataCell(Text(stock["Tablets"] ?? "")), // ✅ Added
//                           DataCell(Text(stock["Pack Price"] ?? "")), // ✅ Added
//                           DataCell(
//                             Row(
//                               children: [
//                                 IconButton(
//                                   icon: const Icon(
//                                     Icons.edit,
//                                     color: Colors.blue,
//                                   ),
//                                   onPressed: () => editstocks(key, stock),
//                                 ),
//                                 IconButton(
//                                   icon: const Icon(
//                                     Icons.delete,
//                                     color: Colors.red,
//                                   ),
//                                   onPressed: () {
//                                     box.delete(key); // ✅ Hive delete
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//                     }).toList(),
//                   ),
//                 );
//               },
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class Availablestocks extends StatefulWidget {
//   const Availablestocks({super.key});

//   @override
//   State<Availablestocks> createState() => _AvailablestocksState();
// }

// class _AvailablestocksState extends State<Availablestocks> {
//   static const routeName = '/availablestocks';

//   late Box availableBox;

//   @override
//   void initState() {
//     super.initState();
//     availableBox = Hive.box('availableBox');
//   }

//   void _adddstocks() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final medicinenameController = TextEditingController();
//         final companyController = TextEditingController();
//         final tabletsController = TextEditingController();
//         final packPriceController = TextEditingController();

//         return AlertDialog(
//           title: const Text('Add Stocks'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: medicinenameController,
//                   decoration: const InputDecoration(labelText: 'Medicine Name'),
//                 ),
//                 TextField(
//                   controller: companyController,
//                   decoration: const InputDecoration(labelText: 'Company'),
//                 ),
//                 TextField(
//                   controller: tabletsController,
//                   keyboardType: TextInputType.number,
//                   decoration:
//                       const InputDecoration(labelText: 'No. of Tablets'),
//                 ),
//                 TextField(
//                   controller: packPriceController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(labelText: 'Pack Price'),
//                 ),
//                 const SizedBox(height: 15),
//                 ElevatedButton(
//                   onPressed: () {
//                     availableBox.add({
//                       "Medicine Name": medicinenameController.text,
//                       "Company": companyController.text,
//                       "Tablets": tabletsController.text,
//                       "Pack Price": packPriceController.text,
//                     });
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Add'),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void editstocks(int key, Map stock) {
//     final medicinenameController =
//         TextEditingController(text: stock['Medicine Name']);
//     final companyController = TextEditingController(text: stock['Company']);
//     final tabletsController =
//         TextEditingController(text: stock['Tablets'] ?? "");
//     final packPriceController =
//         TextEditingController(text: stock['Pack Price'] ?? "");

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Stocks"),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: medicinenameController,
//                   decoration: const InputDecoration(labelText: 'Medicine Name'),
//                 ),
//                 TextField(
//                   controller: companyController,
//                   decoration: const InputDecoration(labelText: 'Company'),
//                 ),
//                 TextField(
//                   controller: tabletsController,
//                   keyboardType: TextInputType.number,
//                   decoration:
//                       const InputDecoration(labelText: 'No. of Tablets'),
//                 ),
//                 TextField(
//                   controller: packPriceController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(labelText: 'Pack Price'),
//                 ),
//                 const SizedBox(height: 15),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text("Cancel"),
//                     ),
//                     const SizedBox(width: 15),
//                     ElevatedButton(
//                       onPressed: () {
//                         availableBox.put(key, {
//                           "Medicine Name": medicinenameController.text,
//                           "Company": companyController.text,
//                           "Tablets": tabletsController.text,
//                           "Pack Price": packPriceController.text,
//                         });
//                         Navigator.pop(context);
//                       },
//                       child: const Text("Update"),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Available Stocks"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _adddstocks,
//               child: const Text("+ Add Stocks"),
//             ),
//             Expanded(
//               child: ValueListenableBuilder(
//                 valueListenable: availableBox.listenable(),
//                 builder: (context, Box box, _) {
//                   if (box.isEmpty) {
//                     return const Center(child: Text("No stocks available"));
//                   }

//                   final keys = box.keys.toList();

//                   // ✅ Enable both horizontal and vertical scrolling
//                   return SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: DataTable(
//                         columns: const [
//                           DataColumn(label: Text("Medicine Name")),
//                           DataColumn(label: Text("Company")),
//                           DataColumn(label: Text("Tablets")),
//                           DataColumn(label: Text("Pack Price")),
//                           DataColumn(label: Text("Actions")),
//                         ],
//                         rows: keys.map((key) {
//                           final stock = box.get(key) as Map;

//                           return DataRow(
//                             cells: [
//                               DataCell(Text(stock["Medicine Name"] ?? "")),
//                               DataCell(Text(stock["Company"] ?? "")),
//                               DataCell(Text(stock["Tablets"] ?? "")),
//                               DataCell(Text(stock["Pack Price"] ?? "")),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.edit,
//                                           color: Colors.blue),
//                                       onPressed: () => editstocks(key, stock),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.delete,
//                                           color: Colors.red),
//                                       onPressed: () => box.delete(key),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:software/reuseable_widget/dynamic_form.dart';

// class Availablestocks extends StatefulWidget {
//   const Availablestocks({super.key});

//   @override
//   State<Availablestocks> createState() => _AvailablestocksState();
// }

// class _AvailablestocksState extends State<Availablestocks> {
// //  static const routeName = '/availablestocks';
//   late Box availableBox;

//   @override
//   void initState() {
//     super.initState();
//     availableBox = Hive.box('availableBox');
//   }

//   void _addStocks() {
//     final fieldNames = ["Medicine Name", "Company", "Tablets", "Pack Price"];

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Add Stocks"),
//           content: DynamicForm(
//             fieldNames: fieldNames,
//             onSubmit: (values) {
//               final newStock = {
//                 "Medicine Name": values["Medicine Name"] ?? "",
//                 "Company": values["Company"] ?? "",
//                 "Tablets": values["Tablets"] ?? "",
//                 "Pack Price": values["Pack Price"] ?? "",
//               };
//               availableBox.add(newStock);
//             },
//           ),
//         );
//       },
//     );
//   }

//   void _editStocks(int key, Map stock) {
//     final fieldNames = ["Medicine Name", "Company", "Tablets", "Pack Price"];

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Stocks"),
//           content: DynamicForm(
//             fieldNames: fieldNames,
//             initialValues: {
//               "Medicine Name": stock["Medicine Name"] ?? "",
//               "Company": stock["Company"] ?? "",
//               "Tablets": stock["Tablets"] ?? "",
//               "Pack Price": stock["Pack Price"] ?? "",
//             },
//             onSubmit: (values) {
//               final updatedStock = {
//                 "Medicine Name": values["Medicine Name"] ?? "",
//                 "Company": values["Company"] ?? "",
//                 "Tablets": values["Tablets"] ?? "",
//                 "Pack Price": values["Pack Price"] ?? "",
//               };
//               availableBox.put(key, updatedStock);
//             },
//           ),
//         );
//       },
//     );
//   }

//   void _deleteStocks(int key) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Are you sure?"),
//           content: const Text("This stock will be deleted permanently."),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context), // Cancel
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 availableBox.delete(key);
//                 Navigator.pop(context); // Close dialog after deletion
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Stock deleted')),
//                 );
//               },
//               child: const Text("Delete"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Available Stocks"),
//         backgroundColor: Colors.green,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _addStocks,
//               child: const Text("+ Add Stocks"),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ValueListenableBuilder(
//                     valueListenable: availableBox.listenable(),
//                     builder: (context, Box box, _) {
//                       if (box.isEmpty) {
//                         return const Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Center(child: Text("No stocks available")),
//                         );
//                       }

//                       return DataTable(
//                         columns: const [
//                           DataColumn(label: Text("Medicine Name")),
//                           DataColumn(label: Text("Company")),
//                           DataColumn(label: Text("Tablets")),
//                           DataColumn(label: Text("Pack Price")),
//                           DataColumn(label: Text("Actions")),
//                         ],
//                         rows: box.keys.map((key) {
//                           final stock = box.get(key) as Map;
//                           return DataRow(
//                             cells: [
//                               DataCell(Text(stock["Medicine Name"] ?? "")),
//                               DataCell(Text(stock["Company"] ?? "")),
//                               DataCell(Text(stock["Tablets"] ?? "")),
//                               DataCell(Text(stock["Pack Price"] ?? "")),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.edit,
//                                           color: Colors.blue),
//                                       onPressed: () => _editStocks(key, stock),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.delete,
//                                           color: Colors.red),
//                                       onPressed: () => _deleteStocks(key),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }// import 'package:flutter/material.dart';

// class Expiredstocks extends StatefulWidget {
//   const Expiredstocks({super.key});

//   @override
//   State<Expiredstocks> createState() => _ExpiredstocksState();
// }

// class _ExpiredstocksState extends State<Expiredstocks> {
//   static const String routeName = '/view_sale';
//   List<Map<String, dynamic>> sales = [];

//   void _addSale() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final idController = TextEditingController();
//         final batchController = TextEditingController();
//         final nameController = TextEditingController();
//         final quantityController = TextEditingController();
//         final priceController = TextEditingController();
//         final expiryDateController = TextEditingController();
//         final distributorController = TextEditingController();
//         return AlertDialog(
//           title: const Text("Add Expired Stock"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: idController,
//                 decoration: const InputDecoration(labelText: "ID"),
//               ),
//               TextField(
//                 controller: batchController,
//                 decoration: const InputDecoration(labelText: "Batch"),
//               ),
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(labelText: "Name"),
//               ),
//               TextField(
//                 controller: quantityController,
//                 decoration: const InputDecoration(labelText: "Quantity"),
//               ),
//               TextField(
//                 controller: priceController,
//                 decoration: const InputDecoration(labelText: "Price"),
//               ),
//               TextField(
//                 controller: expiryDateController,
//                 decoration: const InputDecoration(labelText: "Expiry Date"),
//               ),
//               TextField(
//                 controller: distributorController,
//                 decoration: const InputDecoration(labelText: "Distributor"),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   sales.add({
//                     "id": int.tryParse(idController.text) ?? 0,
//                     "Batch": batchController.text,
//                     "Name": nameController.text,
//                     "Quantitiy": int.tryParse(quantityController.text) ?? 0,
//                     "Price": double.tryParse(priceController.text) ?? 0.0,
//                     "ExpiryDate": expiryDateController.text,
//                     "Distributor": distributorController.text,
//                   });
//                 });
//                 Navigator.pop(context);
//               },
//               child: const Text("Add"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _editSale(Map<String, dynamic> sale) {
//     final idController = TextEditingController(text: sale["id"].toString());
//     final batchController = TextEditingController(text: sale["Batch"]);
//     final nameController = TextEditingController(text: sale["Name"]);
//     final quantityController = TextEditingController(
//       text: sale["Quantitiy"].toString(),
//     );
//     final priceController = TextEditingController(
//       text: sale["Price"].toString(),
//     );
//     final expiryDateController = TextEditingController(
//       text: sale["ExpiryDate"],
//     );
//     final distributorController = TextEditingController(
//       text: sale["Distributor"],
//     );
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Expired Stock"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: idController,
//                 decoration: const InputDecoration(labelText: "ID"),
//               ),
//               TextField(
//                 controller: batchController,
//                 decoration: const InputDecoration(labelText: "Batch"),
//               ),
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(labelText: "Name"),
//               ),
//               TextField(
//                 controller: quantityController,
//                 decoration: const InputDecoration(labelText: "Quantity"),
//               ),
//               TextField(
//                 controller: priceController,
//                 decoration: const InputDecoration(labelText: "Price"),
//               ),
//               TextField(
//                 controller: expiryDateController,
//                 decoration: const InputDecoration(labelText: "Expiry Date"),
//               ),
//               TextField(
//                 controller: distributorController,
//                 decoration: const InputDecoration(labelText: "Distributor"),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   sale["id"] = int.tryParse(idController.text) ?? 0;
//                   sale["Batch"] = batchController.text;
//                   sale["Name"] = nameController.text;
//                   sale["Quantitiy"] =
//                       int.tryParse(quantityController.text) ?? 0;
//                   sale["Price"] = double.tryParse(priceController.text) ?? 0.0;
//                   sale["ExpiryDate"] = expiryDateController.text;
//                   sale["Distributor"] = distributorController.text;
//                 });
//                 Navigator.pop(context);
//               },
//               child: const Text("Update"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _deleteSale(Map<String, dynamic> sale) {
//     setState(() {
//       sales.remove(sale);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Expired Stocks"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _addSale,
//               child: const Text("+ Add Expired Stock"),
//             ),
//             Expanded(
//               child: DataTable(
//                 columns: const [
//                   DataColumn(label: Text("Batch")),
//                   DataColumn(label: Text("Name")),
//                   DataColumn(label: Text("Quantity")),
//                   DataColumn(label: Text("Price")),
//                   DataColumn(label: Text("Expiry Date")),
//                   DataColumn(label: Text("Distributor")),
//                   DataColumn(label: Text("Actions")),
//                 ],
//                 rows:
//                     sales
//                         .map(
//                           (sale) => DataRow(
//                             cells: [
//                               DataCell(Text(sale["Batch"] ?? "")),
//                               DataCell(Text(sale["Name"] ?? "")),
//                               DataCell(
//                                 Text(sale["Quantitiy"]?.toString() ?? "0"),
//                               ),
//                               DataCell(
//                                 Text(sale["Price"]?.toString() ?? "0.0"),
//                               ),
//                               DataCell(Text(sale["ExpiryDate"] ?? "")),
//                               DataCell(Text(sale["Distributor"] ?? "")),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(
//                                         Icons.edit,
//                                         color: Colors.blue,
//                                       ),
//                                       onPressed: () => _editSale(sale),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(
//                                         Icons.delete,
//                                         color: Colors.red,
//                                       ),
//                                       onPressed: () => _deleteSale(sale),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                         .toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// // ✅ Added Hive imports
// import 'package:hive_flutter/hive_flutter.dart';

// class Expiredstocks extends StatefulWidget {
//   const Expiredstocks({super.key});

//   @override
//   State<Expiredstocks> createState() => _ExpiredstocksState();
// }

// class _ExpiredstocksState extends State<Expiredstocks> {
//   static const String routeName = '/expiredstocks';

//   // ✅ Changed: use Hive box instead of List
//   late Box expiredBox;

//   @override
//   void initState() {
//     super.initState();
//     expiredBox = Hive.box('expiredBox'); // ✅ same style as available
//   }

//   void _addSale() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final idController = TextEditingController();
//         final batchController = TextEditingController();
//         final nameController = TextEditingController();
//         final quantityController = TextEditingController();
//         final priceController = TextEditingController();
//         final expiryDateController = TextEditingController();
//         final distributorController = TextEditingController();

//         return AlertDialog(
//           title: const Text("Add Expired Stock"),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                     controller: idController,
//                     decoration: const InputDecoration(labelText: "ID")),
//                 TextField(
//                     controller: batchController,
//                     decoration: const InputDecoration(labelText: "Batch")),
//                 TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(labelText: "Name")),
//                 TextField(
//                     controller: quantityController,
//                     decoration: const InputDecoration(labelText: "Quantity")),
//                 TextField(
//                     controller: priceController,
//                     decoration: const InputDecoration(labelText: "Price")),
//                 TextField(
//                     controller: expiryDateController,
//                     decoration:
//                         const InputDecoration(labelText: "Expiry Date")),
//                 TextField(
//                     controller: distributorController,
//                     decoration:
//                         const InputDecoration(labelText: "Distributor")),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // ✅ Changed: Save directly into Hive
//                 expiredBox.add({
//                   "id": int.tryParse(idController.text) ?? 0,
//                   "Batch": batchController.text,
//                   "Name": nameController.text,
//                   "Quantitiy": int.tryParse(quantityController.text) ?? 0,
//                   "Price": double.tryParse(priceController.text) ?? 0.0,
//                   "ExpiryDate": expiryDateController.text,
//                   "Distributor": distributorController.text,
//                 });
//                 Navigator.pop(context);
//               },
//               child: const Text("Add"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _editSale(int key, Map sale) {
//     final idController = TextEditingController(text: sale["id"].toString());
//     final batchController = TextEditingController(text: sale["Batch"]);
//     final nameController = TextEditingController(text: sale["Name"]);
//     final quantityController =
//         TextEditingController(text: sale["Quantitiy"].toString());
//     final priceController =
//         TextEditingController(text: sale["Price"].toString());
//     final expiryDateController =
//         TextEditingController(text: sale["ExpiryDate"]);
//     final distributorController =
//         TextEditingController(text: sale["Distributor"]);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Expired Stock"),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                     controller: idController,
//                     decoration: const InputDecoration(labelText: "ID")),
//                 TextField(
//                     controller: batchController,
//                     decoration: const InputDecoration(labelText: "Batch")),
//                 TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(labelText: "Name")),
//                 TextField(
//                     controller: quantityController,
//                     decoration: const InputDecoration(labelText: "Quantity")),
//                 TextField(
//                     controller: priceController,
//                     decoration: const InputDecoration(labelText: "Price")),
//                 TextField(
//                     controller: expiryDateController,
//                     decoration:
//                         const InputDecoration(labelText: "Expiry Date")),
//                 TextField(
//                     controller: distributorController,
//                     decoration:
//                         const InputDecoration(labelText: "Distributor")),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // ✅ Changed: update in Hive
//                 expiredBox.put(key, {
//                   "id": int.tryParse(idController.text) ?? 0,
//                   "Batch": batchController.text,
//                   "Name": nameController.text,
//                   "Quantitiy": int.tryParse(quantityController.text) ?? 0,
//                   "Price": double.tryParse(priceController.text) ?? 0.0,
//                   "ExpiryDate": expiryDateController.text,
//                   "Distributor": distributorController.text,
//                 });
//                 Navigator.pop(context);
//               },
//               child: const Text("Update"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _deleteSale(int key) {
//     // ✅ Changed: remove from Hive
//     expiredBox.delete(key);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Expired Stocks"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _addSale,
//               child: const Text("+ Add Expired Stock"),
//             ),
//             Expanded(
//               child: ValueListenableBuilder(
//                 // ✅ Changed: listen to Hive box
//                 valueListenable: expiredBox.listenable(),
//                 builder: (context, Box box, _) {
//                   if (box.isEmpty) {
//                     return const Center(child: Text("No expired stocks found"));
//                   }

//                   final keys = box.keys.toList();

//                   return SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: DataTable(
//                       columns: const [
//                         DataColumn(label: Text("Batch")),
//                         DataColumn(label: Text("Name")),
//                         DataColumn(label: Text("Quantity")),
//                         DataColumn(label: Text("Price")),
//                         DataColumn(label: Text("Expiry Date")),
//                         DataColumn(label: Text("Distributor")),
//                         DataColumn(label: Text("Actions")),
//                       ],
//                       rows: keys.map((key) {
//                         final sale = box.get(key) as Map;
//                         return DataRow(
//                           cells: [
//                             DataCell(Text(sale["Batch"] ?? "")),
//                             DataCell(Text(sale["Name"] ?? "")),
//                             DataCell(Text(sale["Quantitiy"].toString())),
//                             DataCell(Text(sale["Price"].toString())),
//                             DataCell(Text(sale["ExpiryDate"] ?? "")),
//                             DataCell(Text(sale["Distributor"] ?? "")),
//                             DataCell(
//                               Row(
//                                 children: [
//                                   IconButton(
//                                     icon: const Icon(Icons.edit,
//                                         color: Colors.blue),
//                                     onPressed: () => _editSale(key, sale),
//                                   ),
//                                   IconButton(
//                                     icon: const Icon(Icons.delete,
//                                         color: Colors.red),
//                                     onPressed: () => _deleteSale(key),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         );
//                       }).toList(),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class Expiredstocks extends StatefulWidget {
//   const Expiredstocks({super.key});

//   @override
//   State<Expiredstocks> createState() => _ExpiredstocksState();
// }

// class _ExpiredstocksState extends State<Expiredstocks> {
//   static const String routeName = '/expiredstocks';

//   late Box expiredBox;

//   @override
//   void initState() {
//     super.initState();
//     expiredBox = Hive.box('expiredBox');
//   }

//   void _addSale() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final idController = TextEditingController();
//         final batchController = TextEditingController();
//         final nameController = TextEditingController();
//         final quantityController = TextEditingController();
//         final priceController = TextEditingController();
//         final expiryDateController = TextEditingController();
//         final distributorController = TextEditingController();

//         return AlertDialog(
//           title: const Text("Add Expired Stock"),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                     controller: idController,
//                     decoration: const InputDecoration(labelText: "ID")),
//                 TextField(
//                     controller: batchController,
//                     decoration: const InputDecoration(labelText: "Batch")),
//                 TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(labelText: "Name")),
//                 TextField(
//                     controller: quantityController,
//                     decoration: const InputDecoration(labelText: "Quantity")),
//                 TextField(
//                     controller: priceController,
//                     decoration: const InputDecoration(labelText: "Price")),
//                 TextField(
//                     controller: expiryDateController,
//                     decoration:
//                         const InputDecoration(labelText: "Expiry Date")),
//                 TextField(
//                     controller: distributorController,
//                     decoration:
//                         const InputDecoration(labelText: "Distributor")),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 expiredBox.add({
//                   "id": int.tryParse(idController.text) ?? 0,
//                   "Batch": batchController.text,
//                   "Name": nameController.text,
//                   "Quantitiy": int.tryParse(quantityController.text) ?? 0,
//                   "Price": double.tryParse(priceController.text) ?? 0.0,
//                   "ExpiryDate": expiryDateController.text,
//                   "Distributor": distributorController.text,
//                 });
//                 Navigator.pop(context);
//               },
//               child: const Text("Add"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _editSale(int key, Map sale) {
//     final idController = TextEditingController(text: sale["id"].toString());
//     final batchController = TextEditingController(text: sale["Batch"]);
//     final nameController = TextEditingController(text: sale["Name"]);
//     final quantityController =
//         TextEditingController(text: sale["Quantitiy"].toString());
//     final priceController =
//         TextEditingController(text: sale["Price"].toString());
//     final expiryDateController =
//         TextEditingController(text: sale["ExpiryDate"]);
//     final distributorController =
//         TextEditingController(text: sale["Distributor"]);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Expired Stock"),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                     controller: idController,
//                     decoration: const InputDecoration(labelText: "ID")),
//                 TextField(
//                     controller: batchController,
//                     decoration: const InputDecoration(labelText: "Batch")),
//                 TextField(
//                     controller: nameController,
//                     decoration: const InputDecoration(labelText: "Name")),
//                 TextField(
//                     controller: quantityController,
//                     decoration: const InputDecoration(labelText: "Quantity")),
//                 TextField(
//                     controller: priceController,
//                     decoration: const InputDecoration(labelText: "Price")),
//                 TextField(
//                     controller: expiryDateController,
//                     decoration:
//                         const InputDecoration(labelText: "Expiry Date")),
//                 TextField(
//                     controller: distributorController,
//                     decoration:
//                         const InputDecoration(labelText: "Distributor")),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 expiredBox.put(key, {
//                   "id": int.tryParse(idController.text) ?? 0,
//                   "Batch": batchController.text,
//                   "Name": nameController.text,
//                   "Quantitiy": int.tryParse(quantityController.text) ?? 0,
//                   "Price": double.tryParse(priceController.text) ?? 0.0,
//                   "ExpiryDate": expiryDateController.text,
//                   "Distributor": distributorController.text,
//                 });
//                 Navigator.pop(context);
//               },
//               child: const Text("Update"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _deleteSale(int key) {
//     expiredBox.delete(key);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Expired Stocks"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _addSale,
//               child: const Text("+ Add Expired Stock"),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: ValueListenableBuilder(
//                 valueListenable: expiredBox.listenable(),
//                 builder: (context, Box box, _) {
//                   if (box.isEmpty) {
//                     return const Center(child: Text("No expired stocks found"));
//                   }

//                   final keys = box.keys.toList();

//                   return SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: DataTable(
//                         columns: const [
//                           DataColumn(label: Text("Batch")),
//                           DataColumn(label: Text("Name")),
//                           DataColumn(label: Text("Quantity")),
//                           DataColumn(label: Text("Price")),
//                           DataColumn(label: Text("Expiry Date")),
//                           DataColumn(label: Text("Distributor")),
//                           DataColumn(label: Text("Actions")),
//                         ],
//                         rows: keys.map((key) {
//                           final sale = box.get(key) as Map;
//                           return DataRow(
//                             cells: [
//                               DataCell(Text(sale["Batch"] ?? "")),
//                               DataCell(Text(sale["Name"] ?? "")),
//                               DataCell(Text(sale["Quantitiy"].toString())),
//                               DataCell(Text(sale["Price"].toString())),
//                               DataCell(Text(sale["ExpiryDate"] ?? "")),
//                               DataCell(Text(sale["Distributor"] ?? "")),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.edit,
//                                           color: Colors.blue),
//                                       onPressed: () => _editSale(key, sale),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.delete,
//                                           color: Colors.red),
//                                       onPressed: () => _deleteSale(key),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:software/reuseable_widget/dynamic_form.dart'; // import your widget

// class Expiredstocks extends StatefulWidget {
//   const Expiredstocks({super.key});

//   @override
//   State<Expiredstocks> createState() => _ExpiredstocksState();
// }

// class _ExpiredstocksState extends State<Expiredstocks> {
// //  static const String routeName = '/expiredstocks';
//   late Box expiredBox;

//   final List<String> fieldNames = [
//     "id",
//     "Batch",
//     "Name",
//     "Quantity",
//     "Price",
//     "ExpiryDate",
//     "Distributor",
//   ];

//   @override
//   void initState() {
//     super.initState();
//     expiredBox = Hive.box('expiredBox');
//   }

//   /// ✅ Add new expired stock using DynamicForm
//   void _addSale() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Add Expired Stock"),
//           content: DynamicForm(
//             fieldNames: fieldNames,
//             onSubmit: (values) {
//               expiredBox.add({
//                 "id": int.tryParse(values["id"] ?? "0") ?? 0,
//                 "Batch": values["Batch"] ?? "",
//                 "Name": values["Name"] ?? "",
//                 "Quantitiy": int.tryParse(values["Quantity"] ?? "0") ?? 0,
//                 "Price": double.tryParse(values["Price"] ?? "0") ?? 0.0,
//                 "ExpiryDate": values["ExpiryDate"] ?? "",
//                 "Distributor": values["Distributor"] ?? "",
//               });
//             },
//           ),
//         );
//       },
//     );
//   }

//   /// ✅ Edit existing expired stock using DynamicForm
//   // void _editSale(int key, Map sale) {
//   //   showDialog(
//   //     context: context,
//   //     builder: (context) {
//   //       return AlertDialog(
//   //         title: const Text("Edit Expired Stock"),
//   //         content: DynamicForm(
//   //           fieldNames: fieldNames,
//   //           initialValues: {
//   //             "id": sale["id"].toString(),
//   //             "Batch": sale["Batch"] ?? "",
//   //             "Name": sale["Name"] ?? "",
//   //             "Quantity": sale["Quantitiy"].toString(),
//   //             "Price": sale["Price"].toString(),
//   //             "ExpiryDate": sale["ExpiryDate"] ?? "",
//   //             "Distributor": sale["Distributor"] ?? "",
//   //           },
//   //           onSubmit: (values) {
//   //             expiredBox.put(key, {
//   //               "id": int.tryParse(values["id"] ?? "0") ?? 0,
//   //               "Batch": values["Batch"] ?? "",
//   //               "Name": values["Name"] ?? "",
//   //               "Quantitiy": int.tryParse(values["Quantity"] ?? "0") ?? 0,
//   //               "Price": double.tryParse(values["Price"] ?? "0") ?? 0.0,
//   //               "ExpiryDate": values["ExpiryDate"] ?? "",
//   //               "Distributor": values["Distributor"] ?? "",
//   //             });
//   //           },
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }
//   void _editSale(int key, Map sale) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Expired Stock"),
//           content: DynamicForm(
//             fieldNames: fieldNames,
//             initialValues: {
//               "id": sale["id"].toString(),
//               "Batch": sale["Batch"] ?? "",
//               "Name": sale["Name"] ?? "",
//               "Quantity": sale["Quantitiy"].toString(),
//               "Price": sale["Price"].toString(),
//               "ExpiryDate": sale["ExpiryDate"] ?? "",
//               "Distributor": sale["Distributor"] ?? "",
//             },
//             onSubmit: (values) {
//               // ✅ Show confirmation before saving
//               showDialog(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: const Text("Confirm Update"),
//                   content: const Text("Are you sure you want to save changes?"),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Navigator.pop(context), // Cancel
//                       child: const Text("Cancel"),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         expiredBox.put(key, {
//                           "id": int.tryParse(values["id"] ?? "0") ?? 0,
//                           "Batch": values["Batch"] ?? "",
//                           "Name": values["Name"] ?? "",
//                           "Quantitiy":
//                               int.tryParse(values["Quantity"] ?? "0") ?? 0,
//                           "Price":
//                               double.tryParse(values["Price"] ?? "0") ?? 0.0,
//                           "ExpiryDate": values["ExpiryDate"] ?? "",
//                           "Distributor": values["Distributor"] ?? "",
//                         });
//                         Navigator.pop(context); // Close confirm
//                         Navigator.pop(context); // Close edit dialog
//                       },
//                       child: const Text("Save"),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }

//   // void _deleteSale(int key) {
//   //   expiredBox.delete(key);
//   // }
//   void _deleteSale(int key) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Confirm Delete"),
//         content:
//             const Text("Are you sure you want to delete this expired stock?"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context), // Cancel
//             child: const Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               expiredBox.delete(key); // Delete
//               Navigator.pop(context);
//             },
//             child: const Text("Delete"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Expired Stocks"),
//         backgroundColor: Colors.green,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _addSale,
//               child: const Text("+ Add Expired Stock"),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: ValueListenableBuilder(
//                 valueListenable: expiredBox.listenable(),
//                 builder: (context, Box box, _) {
//                   if (box.isEmpty) {
//                     return const Center(child: Text("No expired stocks found"));
//                   }

//                   final keys = box.keys.toList();

//                   return SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: DataTable(
//                         columns: const [
//                           DataColumn(label: Text("Batch")),
//                           DataColumn(label: Text("Name")),
//                           DataColumn(label: Text("Quantity")),
//                           DataColumn(label: Text("Price")),
//                           DataColumn(label: Text("Expiry Date")),
//                           DataColumn(label: Text("Distributor")),
//                           DataColumn(label: Text("Actions")),
//                         ],
//                         rows: keys.map((key) {
//                           final sale = box.get(key) as Map;
//                           return DataRow(
//                             cells: [
//                               DataCell(Text(sale["Batch"] ?? "")),
//                               DataCell(Text(sale["Name"] ?? "")),
//                               DataCell(Text(sale["Quantitiy"].toString())),
//                               DataCell(Text(sale["Price"].toString())),
//                               DataCell(Text(sale["ExpiryDate"] ?? "")),
//                               DataCell(Text(sale["Distributor"] ?? "")),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.edit,
//                                           color: Colors.blue),
//                                       onPressed: () => _editSale(key, sale),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.delete,
//                                           color: Colors.red),
//                                       onPressed: () => _deleteSale(key),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }// import 'package:flutter/material.dart';

// class Requiredstocks extends StatefulWidget {
//   const Requiredstocks({super.key});

//   @override
//   State<Requiredstocks> createState() => _RequiredstocksState();
// }

// class _RequiredstocksState extends State<Requiredstocks> {
//   static const String routeName = '/requiredstocks';
//   List<Map<String, dynamic>> sales = [];

//   void _addStocks() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final nameController = TextEditingController();
//         final quantityController = TextEditingController();

//         final distributorController = TextEditingController();
//         return AlertDialog(
//           title: const Text("Add Expired Stock"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(labelText: "Name"),
//               ),
//               TextField(
//                 controller: quantityController,
//                 decoration: const InputDecoration(labelText: "Quantity"),
//               ),

//               TextField(
//                 controller: distributorController,
//                 decoration: const InputDecoration(labelText: "Distributor"),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   sales.add({
//                     "Name": nameController.text,
//                     "Quantitiy": int.tryParse(quantityController.text) ?? 0,

//                     "Distributor": distributorController.text,
//                   });
//                 });
//                 Navigator.pop(context);
//               },
//               child: const Text("Add"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _editStocks(Map<String, dynamic> stocks) {
//     final nameController = TextEditingController(text: stocks["Name"]);
//     final quantityController = TextEditingController(
//       text: stocks["Quantitiy"].toString(),
//     );

//     final distributorController = TextEditingController(
//       text: stocks["Distributor"],
//     );
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Expired Stock"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(labelText: "Name"),
//               ),
//               TextField(
//                 controller: quantityController,
//                 decoration: const InputDecoration(labelText: "Quantity"),
//               ),

//               TextField(
//                 controller: distributorController,
//                 decoration: const InputDecoration(labelText: "Distributor"),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   stocks["Name"] = nameController.text;
//                   stocks["Quantitiy"] =
//                       int.tryParse(quantityController.text) ?? 0;

//                   stocks["Distributor"] = distributorController.text;
//                 });
//                 Navigator.pop(context);
//               },
//               child: const Text("Update"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _deleteStocks(Map<String, dynamic> sale) {
//     setState(() {
//       sales.remove(sale);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Required Stocks"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _addStocks,
//               child: const Text("+ Add Required Stock"),
//             ),
//             Expanded(
//               child: DataTable(
//                 columns: const [
//                   DataColumn(label: Text("Name")),
//                   DataColumn(label: Text("Quantity")),
//                   DataColumn(label: Text("Distributor")),
//                   DataColumn(label: Text("Actions")),
//                 ],
//                 rows:
//                     sales
//                         .map(
//                           (sale) => DataRow(
//                             cells: [
//                               DataCell(Text(sale["Name"] ?? "")),
//                               DataCell(
//                                 Text(sale["Quantitiy"]?.toString() ?? "0"),
//                               ),

//                               DataCell(Text(sale["Distributor"] ?? "")),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(
//                                         Icons.edit,
//                                         color: Colors.blue,
//                                       ),
//                                       onPressed: () => _editStocks(sale),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(
//                                         Icons.delete,
//                                         color: Colors.red,
//                                       ),
//                                       onPressed: () => _deleteStocks(sale),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                         .toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class Requiredstocks extends StatefulWidget {
//   const Requiredstocks({super.key});

//   @override
//   State<Requiredstocks> createState() => _RequiredstocksState();
// }

// class _RequiredstocksState extends State<Requiredstocks> {
//   static const String routeName = '/requiredstocks';
//   late Box requiredBox;

//   @override
//   void initState() {
//     super.initState();
//     requiredBox = Hive.box('requiredBox'); // ✅ same style as available
//   }

//   void _addStocks() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final nameController = TextEditingController();
//         final quantityController = TextEditingController();
//         final distributorController = TextEditingController();

//         return AlertDialog(
//           title: const Text("Add Required Stock"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(labelText: "Name"),
//               ),
//               TextField(
//                 controller: quantityController,
//                 decoration: const InputDecoration(labelText: "Quantity"),
//               ),
//               TextField(
//                 controller: distributorController,
//                 decoration: const InputDecoration(labelText: "Distributor"),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 requiredBox.add({
//                   "Name": nameController.text,
//                   "Quantity": int.tryParse(quantityController.text) ?? 0,
//                   "Distributor": distributorController.text,
//                 });
//                 Navigator.pop(context);
//               },
//               child: const Text("Add"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _editStocks(int index, Map stock) {
//     final nameController = TextEditingController(text: stock["Name"]);
//     final quantityController =
//         TextEditingController(text: stock["Quantity"].toString());
//     final distributorController =
//         TextEditingController(text: stock["Distributor"]);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Required Stock"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(labelText: "Name"),
//               ),
//               TextField(
//                 controller: quantityController,
//                 decoration: const InputDecoration(labelText: "Quantity"),
//               ),
//               TextField(
//                 controller: distributorController,
//                 decoration: const InputDecoration(labelText: "Distributor"),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 requiredBox.putAt(index, {
//                   "Name": nameController.text,
//                   "Quantity": int.tryParse(quantityController.text) ?? 0,
//                   "Distributor": distributorController.text,
//                 });
//                 Navigator.pop(context);
//               },
//               child: const Text("Update"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _deleteStocks(int index) {
//     requiredBox.deleteAt(index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Required Stocks"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _addStocks,
//               child: const Text("+ Add Required Stock"),
//             ),
//             Expanded(
//               child: ValueListenableBuilder(
//                 valueListenable: requiredBox.listenable(),
//                 builder: (context, Box box, _) {
//                   if (box.isEmpty) {
//                     return const Center(child: Text("No Required Stocks"));
//                   }
//                   return DataTable(
//                     columns: const [
//                       DataColumn(label: Text("Name")),
//                       DataColumn(label: Text("Quantity")),
//                       DataColumn(label: Text("Distributor")),
//                       DataColumn(label: Text("Actions")),
//                     ],
//                     rows: List.generate(
//                       box.length,
//                       (index) {
//                         final stock = box.getAt(index) as Map;
//                         return DataRow(
//                           cells: [
//                             DataCell(Text(stock["Name"] ?? "")),
//                             DataCell(Text(stock["Quantity"].toString())),
//                             DataCell(Text(stock["Distributor"] ?? "")),
//                             DataCell(
//                               Row(
//                                 children: [
//                                   IconButton(
//                                     icon: const Icon(Icons.edit,
//                                         color: Colors.blue),
//                                     onPressed: () => _editStocks(index, stock),
//                                   ),
//                                   IconButton(
//                                     icon: const Icon(Icons.delete,
//                                         color: Colors.red),
//                                     onPressed: () => _deleteStocks(index),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class Requiredstocks extends StatefulWidget {
//   const Requiredstocks({super.key});

//   @override
//   State<Requiredstocks> createState() => _RequiredstocksState();
// }

// class _RequiredstocksState extends State<Requiredstocks> {
//   static const String routeName = '/requiredstocks';
//   late Box requiredBox;

//   @override
//   void initState() {
//     super.initState();
//     requiredBox = Hive.box('requiredBox');
//   }

//   void _addStocks() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         final nameController = TextEditingController();
//         final quantityController = TextEditingController();
//         final distributorController = TextEditingController();

//         return AlertDialog(
//           title: const Text("Add Required Stock"),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: nameController,
//                   decoration: const InputDecoration(labelText: "Name"),
//                 ),
//                 TextField(
//                   controller: quantityController,
//                   decoration: const InputDecoration(labelText: "Quantity"),
//                 ),
//                 TextField(
//                   controller: distributorController,
//                   decoration: const InputDecoration(labelText: "Distributor"),
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 requiredBox.add({
//                   "Name": nameController.text,
//                   "Quantity": int.tryParse(quantityController.text) ?? 0,
//                   "Distributor": distributorController.text,
//                 });
//                 Navigator.pop(context);
//               },
//               child: const Text("Add"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _editStocks(int index, Map stock) {
//     final nameController = TextEditingController(text: stock["Name"]);
//     final quantityController =
//         TextEditingController(text: stock["Quantity"].toString());
//     final distributorController =
//         TextEditingController(text: stock["Distributor"]);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Required Stock"),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: nameController,
//                   decoration: const InputDecoration(labelText: "Name"),
//                 ),
//                 TextField(
//                   controller: quantityController,
//                   decoration: const InputDecoration(labelText: "Quantity"),
//                 ),
//                 TextField(
//                   controller: distributorController,
//                   decoration: const InputDecoration(labelText: "Distributor"),
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 requiredBox.putAt(index, {
//                   "Name": nameController.text,
//                   "Quantity": int.tryParse(quantityController.text) ?? 0,
//                   "Distributor": distributorController.text,
//                 });
//                 Navigator.pop(context);
//               },
//               child: const Text("Update"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _deleteStocks(int index) {
//     requiredBox.deleteAt(index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Required Stocks"),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: _addStocks,
//               child: const Text("+ Add Required Stock"),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: ValueListenableBuilder(
//                 valueListenable: requiredBox.listenable(),
//                 builder: (context, Box box, _) {
//                   if (box.isEmpty) {
//                     return const Center(child: Text("No Required Stocks"));
//                   }

//                   return SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: DataTable(
//                         columns: const [
//                           DataColumn(label: Text("Name")),
//                           DataColumn(label: Text("Quantity")),
//                           DataColumn(label: Text("Distributor")),
//                           DataColumn(label: Text("Actions")),
//                         ],
//                         rows: List.generate(
//                           box.length,
//                           (index) {
//                             final stock = box.getAt(index) as Map;
//                             return DataRow(
//                               cells: [
//                                 DataCell(Text(stock["Name"] ?? "")),
//                                 DataCell(Text(stock["Quantity"].toString())),
//                                 DataCell(Text(stock["Distributor"] ?? "")),
//                                 DataCell(
//                                   Row(
//                                     children: [
//                                       IconButton(
//                                         icon: const Icon(Icons.edit,
//                                             color: Colors.blue),
//                                         onPressed: () =>
//                                             _editStocks(index, stock),
//                                       ),
//                                       IconButton(
//                                         icon: const Icon(Icons.delete,
//                                             color: Colors.red),
//                                         onPressed: () => _deleteStocks(index),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';

// class Currentpurchase extends StatefulWidget {
//   const Currentpurchase({super.key});

//   @override
//   State<Currentpurchase> createState() => _DailyPurchaseReportState();
// }

// class _DailyPurchaseReportState extends State<Currentpurchase> {
//   final Box purchaseBox = Hive.box('purchaseBox');

//   Map<String, double> dailyTotals = {};

//   @override
//   void initState() {
//     super.initState();
//     _loadDailyPurchases();
//   }

//   String _businessDateKey(DateTime dt) {
//     if (dt.hour < 8) {
//       dt = dt.subtract(const Duration(days: 1));
//     }
//     return DateFormat('yyyy-MM-dd').format(dt);
//   }

//   void _loadDailyPurchases() {
//     Map<String, double> totals = {};

//     for (var key in purchaseBox.keys) {
//       final data = purchaseBox.get(key, defaultValue: []);
//       if (data is List) {
//         for (var item in data) {
//           if (item is Map &&
//               item.containsKey('amount') &&
//               item.containsKey('time')) {
//             final amount = (item['amount'] as num).toDouble();
//             final time = DateTime.parse(item['time']);
//             final bKey = _businessDateKey(time);

//             totals[bKey] = (totals[bKey] ?? 0) + amount;
//           }
//         }
//       }
//     }

//     setState(() {
//       dailyTotals = totals;
//     });
//   }

//   void addPurchase(double amount, {bool isSubtract = false}) {
//     final now = DateTime.now();
//     final todayKey = _businessDateKey(now);

//     final data = purchaseBox.get(todayKey, defaultValue: []);
//     List purchases = (data is List) ? data : [];

//     purchases.add({
//       'amount': isSubtract ? -amount : amount,
//       'time': now.toIso8601String(),
//     });

//     purchaseBox.put(todayKey, purchases);

//     _loadDailyPurchases();
//   }

//   void _showPurchaseDialog({bool isSubtract = false}) {
//     final TextEditingController amountController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(isSubtract ? "Subtract Purchase" : "Add Purchase"),
//         content: TextField(
//           controller: amountController,
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(labelText: "Enter amount"),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final amount = double.tryParse(amountController.text) ?? 0.0;
//               if (amount > 0) {
//                 addPurchase(amount, isSubtract: isSubtract);
//               }
//               Navigator.pop(context);
//             },
//             child: const Text("Save"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final sortedKeys = dailyTotals.keys.toList()
//       ..sort((a, b) => b.compareTo(a)); // latest first

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Daily Purchase Report',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFF008000),
//       ),
//       //backgroundColor: const Color(0xFF008000),
//       body: ListView.builder(
//         itemCount: sortedKeys.length,
//         itemBuilder: (context, index) {
//           final key = sortedKeys[index];
//           final date = DateTime.parse(key);
//           final dayName = DateFormat('EEEE').format(date);
//           final formattedDate = DateFormat('dd-MMM-yyyy').format(date);

//           return _purchaseCard(
//             "$dayName ($formattedDate)",
//             dailyTotals[key] ?? 0.0,
//           );
//         },
//       ),

//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             heroTag: "add",
//             onPressed: () => _showPurchaseDialog(isSubtract: false),
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             heroTag: "subtract",
//             backgroundColor: Colors.red,
//             onPressed: () => _showPurchaseDialog(isSubtract: true),
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _purchaseCard(String title, double amount) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           gradient: const LinearGradient(
//             colors: [Colors.white, Colors.green],
//             stops: [0.5, 0.5],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             Text(
//               "Rs. ${amount.toStringAsFixed(2)}",
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: amount >= 0 ? Colors.black : Colors.red,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:software/reuseable_widget/dynamic_form.dart';

// class Availablestocks extends StatefulWidget {
//   const Availablestocks({super.key});

//   @override
//   State<Availablestocks> createState() => _AvailablestocksState();
// }

// class _AvailablestocksState extends State<Availablestocks> {
//   late Box availableBox;
//   String searchQuery = "";

//   @override
//   void initState() {
//     super.initState();
//     availableBox = Hive.box('availableBox');
//   }

//   void _addStocks() {
//     final fieldNames = ["Medicine Name", "Company", "Tablets", "Pack Price"];

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Add Stocks"),
//           content: DynamicForm(
//             fieldNames: fieldNames,
//             onSubmit: (values) {
//               final newStock = {
//                 "Medicine Name": values["Medicine Name"] ?? "",
//                 "Company": values["Company"] ?? "",
//                 "Tablets": values["Tablets"] ?? "",
//                 "Pack Price": values["Pack Price"] ?? "",
//               };
//               availableBox.add(newStock);
//             },
//           ),
//         );
//       },
//     );
//   }

//   void _editStocks(int key, Map stock) {
//     final fieldNames = ["Medicine Name", "Company", "Tablets", "Pack Price"];

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Stocks"),
//           content: DynamicForm(
//             fieldNames: fieldNames,
//             initialValues: {
//               "Medicine Name": stock["Medicine Name"] ?? "",
//               "Company": stock["Company"] ?? "",
//               "Tablets": stock["Tablets"] ?? "",
//               "Pack Price": stock["Pack Price"] ?? "",
//             },
//             onSubmit: (values) {
//               final updatedStock = {
//                 "Medicine Name": values["Medicine Name"] ?? "",
//                 "Company": values["Company"] ?? "",
//                 "Tablets": values["Tablets"] ?? "",
//                 "Pack Price": values["Pack Price"] ?? "",
//               };
//               availableBox.put(key, updatedStock);
//             },
//           ),
//         );
//       },
//     );
//   }

//   void _deleteStocks(int key) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Are you sure?"),
//           content: const Text("This stock will be deleted permanently."),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 availableBox.delete(key);
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Stock deleted')),
//                 );
//               },
//               child: const Text("Delete"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Available Stocks"),
//         backgroundColor: Colors.green,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "Search by Medicine or Company",
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   searchQuery = value.toLowerCase();
//                 });
//               },
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: _addStocks,
//               child: const Text("+ Add Stocks"),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ValueListenableBuilder(
//                     valueListenable: availableBox.listenable(),
//                     builder: (context, Box box, _) {
//                       if (box.isEmpty) {
//                         return const Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Center(child: Text("No stocks available")),
//                         );
//                       }

//                       final filteredKeys = box.keys.where((key) {
//                         final data = box.get(key);
//                         if (data is! Map) return false;

//                         final stock = Map<String, dynamic>.from(data);

//                         final name = (stock["Medicine Name"] ?? "")
//                             .toString()
//                             .toLowerCase();
//                         final company =
//                             (stock["Company"] ?? "").toString().toLowerCase();

//                         return name.contains(searchQuery) ||
//                             company.contains(searchQuery);
//                       }).toList();

//                       if (filteredKeys.isEmpty) {
//                         return const Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Center(child: Text("No matching stocks")),
//                         );
//                       }

//                       return DataTable(
//                         columns: const [
//                           DataColumn(label: Text("Medicine Name")),
//                           DataColumn(label: Text("Company")),
//                           DataColumn(label: Text("Tablets")),
//                           DataColumn(label: Text("Pack Price")),
//                           DataColumn(label: Text("Actions")),
//                         ],
//                         rows: filteredKeys.map((key) {
//                           final stock = Map<String, dynamic>.from(box.get(key));

//                           return DataRow(
//                             cells: [
//                               DataCell(Text(stock["Medicine Name"] ?? "")),
//                               DataCell(Text(stock["Company"] ?? "")),
//                               DataCell(Text(stock["Tablets"] ?? "")),
//                               DataCell(Text(stock["Pack Price"] ?? "")),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.edit,
//                                           color: Colors.blue),
//                                       onPressed: () => _editStocks(key, stock),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.delete,
//                                           color: Colors.red),
//                                       onPressed: () => _deleteStocks(key),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//uppper is same
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:software/reuseable_widget/dynamic_form.dart';
// import 'package:excel/excel.dart';
// //import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:file_picker/file_picker.dart';

// class Availablestocks extends StatefulWidget {
//   const Availablestocks({super.key});

//   @override
//   State<Availablestocks> createState() => _AvailablestocksState();
// }

// class _AvailablestocksState extends State<Availablestocks> {
//   late Box availableBox;
//   String searchQuery = "";

//   @override
//   void initState() {
//     super.initState();
//     availableBox = Hive.box('availableBox');
//   }

//   // ✅ EXPORT to Excel
//   Future<void> _exportToExcel() async {
//     var status = await Permission.storage.request();
//     if (!status.isGranted) {
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Storage permission denied")),
//       );
//       return;
//     }

//     var excel = Excel.createExcel();
//     Sheet sheet = excel['Available Stocks'];

//     // Header row (using CellValue)
//     sheet.appendRow([
//       TextCellValue("Medicine Name"),
//       TextCellValue("Company"),
//       TextCellValue("Tablets"),
//       TextCellValue("Pack Price"),
//     ]);

//     for (var key in availableBox.keys) {
//       final stock = Map<String, dynamic>.from(availableBox.get(key));
//       sheet.appendRow([
//         TextCellValue(stock["Medicine Name"] ?? ""),
//         TextCellValue(stock["Company"] ?? ""),
//         TextCellValue(stock["Tablets"] ?? ""),
//         TextCellValue(stock["Pack Price"] ?? ""),
//       ]);
//     }

//     // Save file in Downloads
//     Directory dir = Directory("/storage/emulated/0/Download");
//     String filePath = "${dir.path}/AvailableStocks.xlsx";

//     File file = File(filePath);
//     await file.writeAsBytes(excel.encode()!);

//     if (!mounted) return;
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Exported to $filePath")),
//     );
//   }

// // ✅ IMPORT from Excel
// Future<void> _importFromExcel() async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//     type: FileType.custom,
//     allowedExtensions: ['xlsx'],
//   );

//   if (result != null) {
//     var bytes = File(result.files.single.path!).readAsBytesSync();
//     var excel = Excel.decodeBytes(bytes);

//     for (var table in excel.tables.keys) {
//       for (var row in excel.tables[table]!.rows.skip(1)) {
//         // skip header row
//         final stock = {
//           "Medicine Name": row[0]?.value.toString() ?? "",
//           "Company": row[1]?.value.toString() ?? "",
//           "Tablets": row[2]?.value.toString() ?? "",
//           "Pack Price": row[3]?.value.toString() ?? "",
//         };
//         availableBox.add(stock); // ✅ use your already opened box
//       }
//     }

//     if (!mounted) return;
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Import successful")),
//     );
//   }
// }

//   // ---------------- ADD ----------------
//   void _addStocks() {
//     final fieldNames = ["Medicine Name", "Company", "Tablets", "Pack Price"];
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Add Stocks"),
//           content: DynamicForm(
//             fieldNames: fieldNames,
//             onSubmit: (values) {
//               final newStock = {
//                 "Medicine Name": values["Medicine Name"] ?? "",
//                 "Company": values["Company"] ?? "",
//                 "Tablets": values["Tablets"] ?? "",
//                 "Pack Price": values["Pack Price"] ?? "",
//               };
//               availableBox.add(newStock);
//             },
//           ),
//         );
//       },
//     );
//   }

//   // ---------------- EDIT ----------------
//   void _editStocks(int key, Map stock) {
//     final fieldNames = ["Medicine Name", "Company", "Tablets", "Pack Price"];
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Stocks"),
//           content: DynamicForm(
//             fieldNames: fieldNames,
//             initialValues: {
//               "Medicine Name": stock["Medicine Name"] ?? "",
//               "Company": stock["Company"] ?? "",
//               "Tablets": stock["Tablets"] ?? "",
//               "Pack Price": stock["Pack Price"] ?? "",
//             },
//             onSubmit: (values) {
//               final updatedStock = {
//                 "Medicine Name": values["Medicine Name"] ?? "",
//                 "Company": values["Company"] ?? "",
//                 "Tablets": values["Tablets"] ?? "",
//                 "Pack Price": values["Pack Price"] ?? "",
//               };
//               availableBox.put(key, updatedStock);
//             },
//           ),
//         );
//       },
//     );
//   }

//   // ---------------- DELETE ----------------
//   void _deleteStocks(int key) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Are you sure?"),
//           content: const Text("This stock will be deleted permanently."),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 availableBox.delete(key);
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Stock deleted')),
//                 );
//               },
//               child: const Text("Delete"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // ---------------- UI ----------------
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Available Stocks"),
//         backgroundColor: Colors.green,
//         centerTitle: true,
//         actions: [
//          IconButton(
//   icon: const Icon(Icons.file_upload),
//   tooltip: "Import from Excel",
//   onPressed: _importFromExcel, // ✅ just call directly
// ),

//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "Search by Medicine or Company",
//                 prefixIcon: const Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   searchQuery = value.toLowerCase();
//                 });
//               },
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: _addStocks,
//               child: const Text("+ Add Stocks"),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ValueListenableBuilder(
//                     valueListenable: availableBox.listenable(),
//                     builder: (context, Box box, _) {
//                       if (box.isEmpty) {
//                         return const Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Center(child: Text("No stocks available")),
//                         );
//                       }

//                       final filteredKeys = box.keys.where((key) {
//                         final data = box.get(key);
//                         if (data is! Map) return false;

//                         final stock = Map<String, dynamic>.from(data);
//                         final name = (stock["Medicine Name"] ?? "")
//                             .toString()
//                             .toLowerCase();
//                         final company =
//                             (stock["Company"] ?? "").toString().toLowerCase();

//                         return name.contains(searchQuery) ||
//                             company.contains(searchQuery);
//                       }).toList();

//                       if (filteredKeys.isEmpty) {
//                         return const Padding(
//                           padding: EdgeInsets.all(16.0),
//                           child: Center(child: Text("No matching stocks")),
//                         );
//                       }

//                       return DataTable(
//                         columns: const [
//                           DataColumn(label: Text("Medicine Name")),
//                           DataColumn(label: Text("Company")),
//                           DataColumn(label: Text("Tablets")),
//                           DataColumn(label: Text("Pack Price")),
//                           DataColumn(label: Text("Actions")),
//                         ],
//                         rows: filteredKeys.map((key) {
//                           final stock = Map<String, dynamic>.from(box.get(key));
//                           return DataRow(
//                             cells: [
//                               DataCell(Text(stock["Medicine Name"] ?? "")),
//                               DataCell(Text(stock["Company"] ?? "")),
//                               DataCell(Text(stock["Tablets"] ?? "")),
//                               DataCell(Text(stock["Pack Price"] ?? "")),
//                               DataCell(
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                       icon: const Icon(Icons.edit,
//                                           color: Colors.blue),
//                                       onPressed: () => _editStocks(key, stock),
//                                     ),
//                                     IconButton(
//                                       icon: const Icon(Icons.delete,
//                                           color: Colors.red),
//                                       onPressed: () => _deleteStocks(key),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           );
//                         }).toList(),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:flutter/services.dart';
// import 'package:software/reuseable_widget/excel.dart';

// class Alldistributor extends StatefulWidget {
//   const Alldistributor({super.key});

//   @override
//   State<Alldistributor> createState() => _AlldistributorState();
// }

// class _AlldistributorState extends State<Alldistributor> {
//   final nameFocus = FocusNode();
//   final managerNameFocus = FocusNode();
//   final managerNumberFocus = FocusNode();
//   final bookingMan1Focus = FocusNode();
//   final bookingMan1NumberFocus = FocusNode();
//   final bookingMan2Focus = FocusNode();
//   final bookingMan2NumberFocus = FocusNode();
//   final supplyManNameFocus = FocusNode();
//   final supplyManNumberFocus = FocusNode();

//   final distributorBox = Hive.box('distributorBox');
//   String searchQuery = "";

//   void _addDistributor() {
//     final nameController = TextEditingController();
//     final managerNameController = TextEditingController();
//     final managerNumberController = TextEditingController();
//     final bookingMan1Controller = TextEditingController();
//     final bookingMan1NumberController = TextEditingController();
//     final bookingMan2Controller = TextEditingController();
//     final bookingMan2NumberController = TextEditingController();
//     final supplyManNameController = TextEditingController();
//     final supplyManNumberController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.zero,
//           ),
//           title: const Text('Add Distributor'),
//           content: RawKeyboardListener(
//             focusNode: FocusNode(),
//             onKey: (RawKeyEvent event) {
//               if (event is RawKeyDownEvent) {
//                 if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
//                   FocusScope.of(context).nextFocus();
//                 } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
//                   FocusScope.of(context).previousFocus();
//                 }
//               }
//             },
//             child: FocusTraversalGroup(
//               policy: OrderedTraversalPolicy(),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     TextField(
//                       focusNode: nameFocus,
//                       controller: nameController,
//                       decoration:
//                           const InputDecoration(labelText: 'Distributor Name'),
//                       textInputAction: TextInputAction.next,
//                       onSubmitted: (_) =>
//                           FocusScope.of(context).requestFocus(managerNameFocus),
//                     ),
//                     TextField(
//                       focusNode: managerNameFocus,
//                       controller: managerNameController,
//                       decoration:
//                           const InputDecoration(labelText: 'Manager Name'),
//                       textInputAction: TextInputAction.next,
//                       onSubmitted: (_) => FocusScope.of(context)
//                           .requestFocus(managerNumberFocus),
//                     ),
//                     TextField(
//                       focusNode: managerNumberFocus,
//                       controller: managerNumberController,
//                       decoration:
//                           const InputDecoration(labelText: 'Manager Number'),
//                       textInputAction: TextInputAction.next,
//                       onSubmitted: (_) =>
//                           FocusScope.of(context).requestFocus(bookingMan1Focus),
//                     ),
//                     TextField(
//                       focusNode: bookingMan1Focus,
//                       controller: bookingMan1Controller,
//                       decoration:
//                           const InputDecoration(labelText: 'Booking Man1'),
//                       textInputAction: TextInputAction.next,
//                       onSubmitted: (_) => FocusScope.of(context)
//                           .requestFocus(bookingMan1NumberFocus),
//                     ),
//                     TextField(
//                       focusNode: bookingMan1NumberFocus,
//                       controller: bookingMan1NumberController,
//                       decoration:
//                           const InputDecoration(labelText: 'Booking 1 Number'),
//                       textInputAction: TextInputAction.next,
//                       onSubmitted: (_) =>
//                           FocusScope.of(context).requestFocus(bookingMan2Focus),
//                     ),
//                     TextField(
//                       focusNode: bookingMan2Focus,
//                       controller: bookingMan2Controller,
//                       decoration:
//                           const InputDecoration(labelText: 'Booking Man2'),
//                       textInputAction: TextInputAction.next,
//                       onSubmitted: (_) => FocusScope.of(context)
//                           .requestFocus(bookingMan2NumberFocus),
//                     ),
//                     TextField(
//                       focusNode: bookingMan2NumberFocus,
//                       controller: bookingMan2NumberController,
//                       decoration:
//                           const InputDecoration(labelText: 'Booking 2 Number'),
//                       textInputAction: TextInputAction.next,
//                       onSubmitted: (_) => FocusScope.of(context)
//                           .requestFocus(supplyManNameFocus),
//                     ),
//                     TextField(
//                       focusNode: supplyManNameFocus,
//                       controller: supplyManNameController,
//                       decoration:
//                           const InputDecoration(labelText: 'Supply Man Name'),
//                       textInputAction: TextInputAction.next,
//                       onSubmitted: (_) => FocusScope.of(context)
//                           .requestFocus(supplyManNumberFocus),
//                     ),
//                     TextField(
//                       focusNode: supplyManNumberFocus,
//                       controller: supplyManNumberController,
//                       decoration:
//                           const InputDecoration(labelText: 'Supply Man Number'),
//                       textInputAction: TextInputAction.done,
//                       onSubmitted: (_) {
//                         _saveDistributor(
//                           nameController,
//                           managerNameController,
//                           managerNumberController,
//                           bookingMan1Controller,
//                           bookingMan1NumberController,
//                           bookingMan2Controller,
//                           bookingMan2NumberController,
//                           supplyManNameController,
//                           supplyManNumberController,
//                         );
//                         Navigator.pop(context);
//                       },
//                     ),
//                     const SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: () {
//                         _saveDistributor(
//                           nameController,
//                           managerNameController,
//                           managerNumberController,
//                           bookingMan1Controller,
//                           bookingMan1NumberController,
//                           bookingMan2Controller,
//                           bookingMan2NumberController,
//                           supplyManNameController,
//                           supplyManNumberController,
//                         );
//                         Navigator.pop(context);
//                       },
//                       child: const Text('Add'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _saveDistributor(
//     TextEditingController nameController,
//     TextEditingController managerNameController,
//     TextEditingController managerNumberController,
//     TextEditingController bookingMan1Controller,
//     TextEditingController bookingMan1NumberController,
//     TextEditingController bookingMan2Controller,
//     TextEditingController bookingMan2NumberController,
//     TextEditingController supplyManNameController,
//     TextEditingController supplyManNumberController,
//   ) {
//     distributorBox.add({
//       "Name": nameController.text,
//       "ManagerName": managerNameController.text,
//       "ManagerNumber": managerNumberController.text,
//       "BookingMan1": bookingMan1Controller.text,
//       "BookingMan1Number": bookingMan1NumberController.text,
//       "BookingMan2": bookingMan2Controller.text,
//       "BookingMan2Number": bookingMan2NumberController.text,
//       "SupplyManName": supplyManNameController.text,
//       "SupplyManNumber": supplyManNumberController.text,
//     });
//   }

//   void _editDistributor(dynamic key, Map distributor) {
//     final nameController = TextEditingController(text: distributor['Name']);
//     final managerNameController =
//         TextEditingController(text: distributor['ManagerName']);
//     final managerNumberController =
//         TextEditingController(text: distributor['ManagerNumber']);
//     final bookingMan1Controller =
//         TextEditingController(text: distributor['BookingMan1']);
//     final bookingMan1NumberController =
//         TextEditingController(text: distributor['BookingMan1Number']);
//     final bookingMan2Controller =
//         TextEditingController(text: distributor['BookingMan2']);
//     final bookingMan2NumberController =
//         TextEditingController(text: distributor['BookingMan2Number']);
//     final supplyManNameController =
//         TextEditingController(text: distributor['SupplyManName']);
//     final supplyManNumberController =
//         TextEditingController(text: distributor['SupplyManNumber']);

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.zero,
//           ),
//           title: const Text("Edit Distributor"),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                     controller: nameController,
//                     decoration:
//                         const InputDecoration(labelText: 'Distributor Name')),
//                 TextField(
//                     controller: managerNameController,
//                     decoration:
//                         const InputDecoration(labelText: 'Manager Name')),
//                 TextField(
//                     controller: managerNumberController,
//                     decoration:
//                         const InputDecoration(labelText: 'Manager Number')),
//                 TextField(
//                     controller: bookingMan1Controller,
//                     decoration:
//                         const InputDecoration(labelText: 'Booking Man1')),
//                 TextField(
//                     controller: bookingMan1NumberController,
//                     decoration:
//                         const InputDecoration(labelText: 'Booking 1 Number')),
//                 TextField(
//                     controller: bookingMan2Controller,
//                     decoration:
//                         const InputDecoration(labelText: 'Booking Man2')),
//                 TextField(
//                     controller: bookingMan2NumberController,
//                     decoration:
//                         const InputDecoration(labelText: 'Booking 2 Number')),
//                 TextField(
//                     controller: supplyManNameController,
//                     decoration:
//                         const InputDecoration(labelText: 'Supply Man Name')),
//                 TextField(
//                     controller: supplyManNumberController,
//                     decoration:
//                         const InputDecoration(labelText: 'Supply Man Number')),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text("Cancel")),
//                     const SizedBox(width: 10),
//                     ElevatedButton(
//                         onPressed: () {
//                           distributorBox.put(key, {
//                             "Name": nameController.text,
//                             "ManagerName": managerNameController.text,
//                             "ManagerNumber": managerNumberController.text,
//                             "BookingMan1": bookingMan1Controller.text,
//                             "BookingMan1Number":
//                                 bookingMan1NumberController.text,
//                             "BookingMan2": bookingMan2Controller.text,
//                             "BookingMan2Number":
//                                 bookingMan2NumberController.text,
//                             "SupplyManName": supplyManNameController.text,
//                             "SupplyManNumber": supplyManNumberController.text,
//                           });
//                           Navigator.pop(context);
//                         },
//                         child: const Text("Update")),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _deleteDistributor(dynamic key) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Are you sure?"),
//           content: const Text("This distributor will be deleted permanently."),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 distributorBox.delete(key);
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Distributor deleted')),
//                 );
//               },
//               child: const Text("Delete"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Distributors"),
//         centerTitle: true,
//         backgroundColor: Colors.green,
//         actions: [
//           IconButton(
//             tooltip: "Export to Excel",
//             onPressed: () {
//               ExcelHelper.exportToExcel(
//                 context: context,
//                 box: distributorBox,
//                 sheetName: "All Distributor",
//                 fileName: "All Distributor",
//                 headers: [
//                   "Name",
//                   "ManagerName",
//                   "ManagerNumber",
//                   "BookingMan1",
//                   "BookingMan1Number",
//                   "BookingMan2",
//                   "BookingMan2Number",
//                   "SupplyManName",
//                   "SupplyManNumber"
//                 ],
//               );
//             },
//             icon: const Icon(Icons.file_upload),
//           ),
//           IconButton(
//             tooltip: "Import from Excel",
//             onPressed: () {
//               ExcelHelper.importFromExcel(
//                 context: context,
//                 box: distributorBox,
//                 headers: [
//                   "Name",
//                   "ManagerName",
//                   "ManagerNumber",
//                   "BookingMan1",
//                   "BookingMan1Number",
//                   "BookingMan2",
//                   "BookingMan2Number",
//                   "SupplyManName",
//                   "SupplyManNumber"
//                 ],
//               );
//             },
//             icon: const Icon(Icons.file_download),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//                 onPressed: _addDistributor,
//                 child: const Text("+ Add Distributor")),
//             const SizedBox(height: 10),
//             TextField(
//               decoration: const InputDecoration(
//                   labelText: "Search by name", prefixIcon: Icon(Icons.search)),
//               onChanged: (value) {
//                 setState(() {
//                   searchQuery = value.toLowerCase();
//                 });
//               },
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: ValueListenableBuilder(
//                     valueListenable: distributorBox.listenable(),
//                     builder: (context, Box box, _) {
//                       if (box.isEmpty) {
//                         return const Center(
//                             child: Padding(
//                                 padding: EdgeInsets.all(16.0),
//                                 child: Text("No Distributors Added")));
//                       }

//                       final distributors = box.keys
//                           .map((key) => {"key": key, "data": box.get(key)})
//                           .where((entry) {
//                         final data = entry["data"] as Map;
//                         final name =
//                             (data["Name"] ?? "").toString().toLowerCase();
//                         return name.contains(searchQuery);
//                       }).toList();

//                       distributors.sort((a, b) {
//                         final aName =
//                             (a["data"]["Name"] ?? "").toString().toLowerCase();
//                         final bName =
//                             (b["data"]["Name"] ?? "").toString().toLowerCase();
//                         return aName.compareTo(bName);
//                       });

//                       return DataTable(
//                         columns: const [
//                           DataColumn(label: Text("Name")),
//                           DataColumn(label: Text("Manager Name")),
//                           DataColumn(label: Text("Manager Number")),
//                           DataColumn(label: Text("Booking Man1")),
//                           DataColumn(label: Text("Booking Man1 Number")),
//                           DataColumn(label: Text("Booking Man2")),
//                           DataColumn(label: Text("Booking Man2 Number")),
//                           DataColumn(label: Text("Supply Man Name")),
//                           DataColumn(label: Text("Supply Man Number")),
//                           DataColumn(label: Text("Actions")),
//                         ],
//                         rows: distributors.map((entry) {
//                           final distributor = entry["data"] as Map;
//                           final key = entry["key"];
//                           return DataRow(cells: [
//                             DataCell(Text(distributor["Name"] ?? "")),
//                             DataCell(Text(distributor["ManagerName"] ?? "")),
//                             DataCell(Text(distributor["ManagerNumber"] ?? "")),
//                             DataCell(Text(distributor["BookingMan1"] ?? "")),
//                             DataCell(
//                                 Text(distributor["BookingMan1Number"] ?? "")),
//                             DataCell(Text(distributor["BookingMan2"] ?? "")),
//                             DataCell(
//                                 Text(distributor["BookingMan2Number"] ?? "")),
//                             DataCell(Text(distributor["SupplyManName"] ?? "")),
//                             DataCell(
//                                 Text(distributor["SupplyManNumber"] ?? "")),
//                             DataCell(Row(children: [
//                               IconButton(
//                                   icon: const Icon(Icons.edit,
//                                       color: Colors.blue),
//                                   onPressed: () =>
//                                       _editDistributor(key, distributor)),
//                               IconButton(
//                                   icon: const Icon(Icons.delete,
//                                       color: Colors.red),
//                                   onPressed: () => _deleteDistributor(key)),
//                             ])),
//                           ]);
//                         }).toList(),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';
// import '../reuseable_widget/dynamic_form.dart';

// class Currentsale extends StatefulWidget {
//   const Currentsale({super.key});

//   @override
//   State<Currentsale> createState() => _DailySaleReportState();
// }

// class _DailySaleReportState extends State<Currentsale> {
//   final Box currentsaleBox = Hive.box('currentsaleBox');

//   Map<String, double> dailyTotals = {};

//   @override
//   void initState() {
//     super.initState();
//     _loadDailySales();
//   }

//   String _businessDateKey(DateTime dt) {
//     if (dt.hour < 8) {
//       dt = dt.subtract(const Duration(days: 1));
//     }
//     return DateFormat('yyyy-MM-dd').format(dt);
//   }

//   void _loadDailySales() {
//     Map<String, double> totals = {};

//     for (var key in currentsaleBox.keys) {
//       final data = currentsaleBox.get(key, defaultValue: []);
//       if (data is List) {
//         for (var item in data) {
//           if (item is Map &&
//               item.containsKey('amount') &&
//               item.containsKey('time')) {
//             final amount = (item['amount'] as num).toDouble();
//             final time = DateTime.parse(item['time']);
//             final bKey = _businessDateKey(time);

//             totals[bKey] = (totals[bKey] ?? 0) + amount;
//           }
//         }
//       }
//     }

//     setState(() {
//       dailyTotals = totals;
//     });
//   }

//   void addSale(double amount, {bool isSubtract = false}) {
//     final now = DateTime.now();
//     final todayKey = _businessDateKey(now);

//     final data = currentsaleBox.get(todayKey, defaultValue: []);
//     List sales = (data is List) ? data : [];

//     sales.add({
//       'amount': isSubtract ? -amount : amount,
//       'time': now.toIso8601String(),
//     });

//     currentsaleBox.put(todayKey, sales);

//     _loadDailySales();
//   }

//   void _showSaleDialog({bool isSubtract = false}) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.zero,
//         ),
//         title: Text(isSubtract ? "Subtract Sale" : "Add Sale"),
//         content: DynamicForm(
//           fieldNames: ["Amount"],
//           onSubmit: (values) {
//             final amount = double.tryParse(values["Amount"] ?? "0") ?? 0.0;
//             if (amount > 0) {
//               addSale(amount, isSubtract: isSubtract);
//             }
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final sortedKeys = dailyTotals.keys.toList()
//       ..sort((a, b) => b.compareTo(a)); // latest first

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Daily Sale Report',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       // backgroundColor: const Color(0xFF008000),
//       body: ListView.builder(
//         itemCount: sortedKeys.length,
//         itemBuilder: (context, index) {
//           final key = sortedKeys[index];
//           final date = DateTime.parse(key);
//           final dayName = DateFormat('EEEE').format(date);
//           final formattedDate = DateFormat('dd-MMM-yyyy').format(date);

//           return _saleCard(
//             "$dayName ($formattedDate)",
//             dailyTotals[key] ?? 0.0,
//           );
//         },
//       ),

//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             heroTag: "addSale",
//             onPressed: () => _showSaleDialog(isSubtract: false),
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             heroTag: "subtractSale",
//             backgroundColor: Colors.red,
//             onPressed: () => _showSaleDialog(isSubtract: true),
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget _saleCard(String title, double amount) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//     child: Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         gradient: const LinearGradient(
//           colors: [Colors.white, Colors.green],
//           stops: [0.5, 0.5],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           Text(
//             "Rs. ${amount.toStringAsFixed(2)}",
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               color: amount >= 0 ? Colors.black : Colors.red,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';
// import '../reuseable_widget/dynamic_form.dart';

// class Currentsale extends StatefulWidget {
//   const Currentsale({super.key});

//   @override
//   State<Currentsale> createState() => _DailySaleReportState();
// }

// class _DailySaleReportState extends State<Currentsale> {
//   final Box currentsaleBox = Hive.box('currentsaleBox');

//   Map<String, List<Map<String, dynamic>>> dailySales = {};

//   @override
//   void initState() {
//     super.initState();
//     _loadDailySales();
//   }

//   String _businessDateKey(DateTime dt) {
//     if (dt.hour < 8) {
//       dt = dt.subtract(const Duration(days: 1));
//     }
//     return DateFormat('yyyy-MM-dd').format(dt);
//   }

//   void _loadDailySales() {
//     Map<String, List<Map<String, dynamic>>> salesMap = {};

//     for (var key in currentsaleBox.keys) {
//       final data = currentsaleBox.get(key, defaultValue: []);
//       if (data is List) {
//         final dateSales = <Map<String, dynamic>>[];
//         for (var item in data) {
//           if (item is Map &&
//               item.containsKey('amount') &&
//               item.containsKey('time')) {
//             dateSales.add(Map<String, dynamic>.from(item));
//           }
//         }
//         if (dateSales.isNotEmpty) {
//           salesMap[key.toString()] = dateSales;
//         }
//       }
//     }

//     setState(() {
//       dailySales = salesMap;
//     });
//   }

//   void addSale(double amount, {bool isSubtract = false}) {
//     final now = DateTime.now();
//     final todayKey = _businessDateKey(now);

//     final data = currentsaleBox.get(todayKey, defaultValue: []);
//     List sales = (data is List) ? data : [];

//     sales.add({
//       'amount': isSubtract ? -amount : amount,
//       'time': now.toIso8601String(),
//     });

//     currentsaleBox.put(todayKey, sales);
//     _loadDailySales();
//   }

//   void editSale(String dateKey, int index, double newAmount) {
//     final data = currentsaleBox.get(dateKey, defaultValue: []);
//     if (data is List && index < data.length) {
//       data[index]['amount'] = newAmount;
//       data[index]['time'] = DateTime.now().toIso8601String();
//       currentsaleBox.put(dateKey, data);
//       _loadDailySales();
//     }
//   }

//   void deleteSale(String dateKey, int index) {
//     final data = currentsaleBox.get(dateKey, defaultValue: []);
//     if (data is List && index < data.length) {
//       data.removeAt(index);
//       currentsaleBox.put(dateKey, data);
//       _loadDailySales();
//     }
//   }

//   void _showSaleDialog({bool isSubtract = false, String? dateKey, int? index}) {
//     double initialValue = 0.0;
//     if (dateKey != null && index != null) {
//       initialValue = (dailySales[dateKey]![index]['amount'] as num).toDouble();
//     }

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//         title: Text(isSubtract
//             ? "Subtract Sale"
//             : (dateKey != null ? "Edit Sale" : "Add Sale")),
//         content: DynamicForm(
//           fieldNames: ["Amount"],
//           initialValues: {"Amount": initialValue.toString()},
//           onSubmit: (values) {
//             final amount = double.tryParse(values["Amount"] ?? "0") ?? 0.0;
//             if (amount > 0) {
//               if (dateKey != null && index != null) {
//                 editSale(dateKey, index, amount);
//               } else {
//                 addSale(amount, isSubtract: isSubtract);
//               }
//             }
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final sortedKeys = dailySales.keys.toList()
//       ..sort((a, b) => b.compareTo(a)); // latest first

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Daily Sale Report',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: ListView.builder(
//         itemCount: sortedKeys.length,
//         itemBuilder: (context, index) {
//           final key = sortedKeys[index];
//           final date = DateTime.parse(key);
//           final dayName = DateFormat('EEEE').format(date);
//           final formattedDate = DateFormat('dd-MMM-yyyy').format(date);
//           final salesList = dailySales[key]!;

//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("$dayName ($formattedDate)",
//                     style: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 5),
//                 ...List.generate(salesList.length, (i) {
//                   final sale = salesList[i];
//                   final amount = (sale['amount'] as num).toDouble();

//                   return Card(
//                     child: ListTile(
//                       title: Text("Rs. ${amount.toStringAsFixed(2)}"),
//                       subtitle: Text(
//                           "Time: ${DateFormat('hh:mm a').format(DateTime.parse(sale['time']))}"),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.edit, color: Colors.blue),
//                             onPressed: () =>
//                                 _showSaleDialog(dateKey: key, index: i),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.delete, color: Colors.red),
//                             onPressed: () => deleteSale(key, i),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }),
//               ],
//             ),
//           );
//         },
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             heroTag: "addSale",
//             onPressed: () => _showSaleDialog(),
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             heroTag: "subtractSale",
//             backgroundColor: Colors.red,
//             onPressed: () => _showSaleDialog(isSubtract: true),
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';
// import '../reuseable_widget/dynamic_form.dart';

// class Currentsale extends StatefulWidget {
//   const Currentsale({super.key});

//   @override
//   State<Currentsale> createState() => _DailySaleReportState();
// }

// class _DailySaleReportState extends State<Currentsale> {
//   final Box currentsaleBox = Hive.box('currentsaleBox');

//   Map<String, List<Map<String, dynamic>>> dailySales = {};

//   @override
//   void initState() {
//     super.initState();
//     _loadDailySales();
//   }

//   String _businessDateKey(DateTime dt) {
//     if (dt.hour < 8) {
//       dt = dt.subtract(const Duration(days: 1));
//     }
//     return DateFormat('yyyy-MM-dd').format(dt);
//   }

//   void _loadDailySales() {
//     Map<String, List<Map<String, dynamic>>> salesMap = {};

//     for (var key in currentsaleBox.keys) {
//       final data = currentsaleBox.get(key, defaultValue: []);
//       if (data is List) {
//         final dateSales = <Map<String, dynamic>>[];
//         for (var item in data) {
//           if (item is Map &&
//               item.containsKey('amount') &&
//               item.containsKey('time')) {
//             dateSales.add(Map<String, dynamic>.from(item));
//           }
//         }
//         if (dateSales.isNotEmpty) {
//           salesMap[key.toString()] = dateSales;
//         }
//       }
//     }

//     setState(() {
//       dailySales = salesMap;
//     });
//   }

//   void addSale(double amount, {bool isSubtract = false}) {
//     final now = DateTime.now();
//     final todayKey = _businessDateKey(now);

//     final data = currentsaleBox.get(todayKey, defaultValue: []);
//     List sales = (data is List) ? data : [];

//     sales.add({
//       'amount': isSubtract ? -amount : amount,
//       'time': now.toIso8601String(),
//     });

//     currentsaleBox.put(todayKey, sales);
//     _loadDailySales();
//   }

//   void editSale(String dateKey, int index, double newAmount) {
//     final data = currentsaleBox.get(dateKey, defaultValue: []);
//     if (data is List && index < data.length) {
//       data[index]['amount'] = newAmount;
//       data[index]['time'] = DateTime.now().toIso8601String();
//       currentsaleBox.put(dateKey, data);
//       _loadDailySales();
//     }
//   }

//   void deleteSale(String dateKey, int index) {
//     final data = currentsaleBox.get(dateKey, defaultValue: []);
//     if (data is List && index < data.length) {
//       data.removeAt(index);
//       currentsaleBox.put(dateKey, data);
//       _loadDailySales();
//     }
//   }

//   void _showSaleDialog({bool isSubtract = false, String? dateKey, int? index}) {
//     double initialValue = 0.0;
//     if (dateKey != null && index != null) {
//       initialValue = (dailySales[dateKey]![index]['amount'] as num).toDouble();
//     }

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//         title: Text(isSubtract
//             ? "Subtract Sale"
//             : (dateKey != null ? "Edit Sale" : "Add Sale")),
//         content: DynamicForm(
//           fieldNames: ["Amount"],
//           initialValues: {"Amount": initialValue.toString()},
//           validator: {
//             "Amount": (value) {
//               if (value == null || value.isEmpty) {
//                 return "Amount is required";
//               }
//               final val = double.tryParse(value);
//               if (val == null || val <= 0) {
//                 return "Enter a valid number greater than 0";
//               }
//               return null;
//             }
//           },
//           onSubmit: (values) {
//             final amount = double.tryParse(values["Amount"] ?? "0") ?? 0.0;
//             if (amount > 0) {
//               if (dateKey != null && index != null) {
//                 editSale(dateKey, index, amount);
//               } else {
//                 addSale(amount, isSubtract: isSubtract);
//               }
//             }
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final sortedKeys = dailySales.keys.toList()
//       ..sort((a, b) => b.compareTo(a)); // latest first

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Daily Sale Report',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: ListView.builder(
//         itemCount: sortedKeys.length,
//         itemBuilder: (context, index) {
//           final key = sortedKeys[index];
//           final date = DateTime.parse(key);
//           final dayName = DateFormat('EEEE').format(date);
//           final formattedDate = DateFormat('dd-MMM-yyyy').format(date);
//           final salesList = dailySales[key]!;

//           double totalAmount = salesList.fold(0.0,
//               (previousValue, element) => previousValue + (element['amount'] as num).toDouble());

//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("$dayName ($formattedDate)",
//                     style: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 5),
//                 Text(
//                   "Total: Rs. ${totalAmount.toStringAsFixed(2)}",
//                   style: const TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 5),
//                 ...List.generate(salesList.length, (i) {
//                   final sale = salesList[i];
//                   final amount = (sale['amount'] as num).toDouble();

//                   return Card(
//                     child: ListTile(
//                       title: Text("Rs. ${amount.toStringAsFixed(2)}"),
//                       subtitle: Text(
//                           "Time: ${DateFormat('hh:mm a').format(DateTime.parse(sale['time']))}"),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.edit, color: Colors.blue),
//                             onPressed: () =>
//                                 _showSaleDialog(dateKey: key, index: i),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.delete, color: Colors.red),
//                             onPressed: () => deleteSale(key, i),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }),
//               ],
//             ),
//           );
//         },
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             heroTag: "addSale",
//             onPressed: () => _showSaleDialog(),
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(height: 10),
//           FloatingActionButton(
//             heroTag: "subtractSale",
//             backgroundColor: Colors.red,
//             onPressed: () => _showSaleDialog(isSubtract: true),
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:hive/hive.dart';
// // import 'package:intl/intl.dart';

// // class Reports extends StatefulWidget {
// //   const Reports({super.key});

// //   @override
// //   State<Reports> createState() => _ReportsState();
// // }

// // class _ReportsState extends State<Reports> {
// //   late Box purchaseBox;
// //   late Box salesBox;

// //   double totalPurchases = 0.0;
// //   double totalSales = 0.0;

// //   String selectedMonth = DateFormat('yyyy-MM').format(DateTime.now());

// //   @override
// //   void initState() {
// //     super.initState();
// //     purchaseBox = Hive.box('purchaseBox');
// //     salesBox = Hive.box('viewsalesBox');
// //     _calculateReports();
// //   }

// //   void _calculateReports() {
// //     double purchaseSum = 0.0;
// //     double salesSum = 0.0;

// //     purchaseSum =
// //         purchaseBox.get('${selectedMonth}-purchase', defaultValue: 0.0);
// //     salesSum = salesBox.get('${selectedMonth}-sale', defaultValue: 0.0);

// //     setState(() {
// //       totalPurchases = purchaseSum;
// //       totalSales = salesSum;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final profitOrLoss = totalSales - totalPurchases;

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(
// //           'Monthly Reports',
// //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //         ),
// //         centerTitle: true,
// //         // backgroundColor: Color(0xFF008000),
// //       ),
// //       backgroundColor: const Color(0xFF008000),
// //       body: Padding(
// //         padding: const EdgeInsets.all(20.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             DropdownButton<String>(
// //               value: selectedMonth,
// //               items: _getAvailableMonths()
// //                   .map((month) => DropdownMenuItem(
// //                         value: month,
// //                         child: Text(month),
// //                       ))
// //                   .toList(),
// //               onChanged: (value) {
// //                 if (value != null) {
// //                   setState(() {
// //                     selectedMonth = value;
// //                   });
// //                   _calculateReports();
// //                 }
// //               },
// //             ),
// //             const SizedBox(height: 30),
// //             _reportCard("Total Purchases", totalPurchases),
// //             const SizedBox(height: 20),
// //             _reportCard("Total Sales", totalSales),
// //             const SizedBox(height: 20),
// //             _reportCard(
// //               profitOrLoss >= 0 ? "Profit" : "Loss",
// //               profitOrLoss.abs(),
// //               isProfit: profitOrLoss >= 0,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   List<String> _getAvailableMonths() {
// //     final purchaseMonths = purchaseBox.keys
// //         .where((k) => k.toString().length >= 7)
// //         .map((k) => k.toString().substring(0, 7))
// //         .toSet()
// //         .toList();

// //     final salesMonths = salesBox.keys
// //         .where((k) => k.toString().length >= 7)
// //         .map((k) => k.toString().substring(0, 7))
// //         .toSet()
// //         .toList();

// //     final allMonths = {...purchaseMonths, ...salesMonths}.toList();
// //     allMonths.sort();
// //     return allMonths;
// //   }

// //   Widget _reportCard(String title, double amount, {bool isProfit = true}) {
// //     return Container(
// //       width: double.infinity,
// //       height: 150,
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(10),
// //         gradient: LinearGradient(
// //           colors: [Colors.white, isProfit ? Colors.green : Colors.red],
// //           stops: const [0.5, 0.5],
// //           begin: Alignment.topCenter,
// //           end: Alignment.bottomCenter,
// //         ),
// //       ),
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Text(
// //             title,
// //             style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// //           ),
// //           const SizedBox(height: 20),
// //           Text(
// //             "Rs. ${amount.toStringAsFixed(2)}",
// //             style: TextStyle(
// //               fontSize: 28,
// //               fontWeight: FontWeight.bold,
// //               color: isProfit ? Colors.green[800] : Colors.red[800],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';

// class Reports extends StatefulWidget {
//   const Reports({super.key});

//   @override
//   State<Reports> createState() => _ReportsState();
// }

// class _ReportsState extends State<Reports> {
//   late Box purchaseBox;
//   late Box salesBox;

//   double totalPurchases = 0.0;
//   double totalSales = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     purchaseBox = Hive.box('purchaseBox');
//     salesBox = Hive.box('viewsalesBox');
//     _calculateReports();
//   }

//   // 🔹 Calculate totals for the last 5 days
//   void _calculateReports() {
//     double purchaseSum = 0.0;
//     double salesSum = 0.0;

//     final today = DateTime.now();
//     final last5Days =
//         List.generate(5, (i) => today.subtract(Duration(days: i)));

//     for (var day in last5Days) {
//       final key = DateFormat('yyyy-MM-dd').format(day);

//       // Sum purchases
//       final dayPurchases = purchaseBox.get(key, defaultValue: 0.0);
//       if (dayPurchases is double || dayPurchases is int) {
//         purchaseSum += dayPurchases.toDouble();
//       } else if (dayPurchases is List) {
//         for (var item in dayPurchases) {
//           if (item is Map && item.containsKey('amount')) {
//             purchaseSum += (item['amount'] as num).toDouble();
//           }
//         }
//       }

//       // Sum sales
//       final daySales = salesBox.get(key, defaultValue: 0.0);
//       if (daySales is double || daySales is int) {
//         salesSum += daySales.toDouble();
//       } else if (daySales is List) {
//         for (var item in daySales) {
//           if (item is Map && item.containsKey('amount')) {
//             salesSum += (item['amount'] as num).toDouble();
//           }
//         }
//       }
//     }

//     setState(() {
//       totalPurchases = purchaseSum;
//       totalSales = salesSum;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final profitOrLoss = totalSales - totalPurchases;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Last 5 Days Report',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color(0xFF008000),
//       ),
//       backgroundColor: const Color(0xFF008000),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _reportCard("Total Purchases", totalPurchases),
//             const SizedBox(height: 20),
//             _reportCard("Total Sales", totalSales),
//             const SizedBox(height: 20),
//             _reportCard(
//               profitOrLoss >= 0 ? "Profit" : "Loss",
//               profitOrLoss.abs(),
//               isProfit: profitOrLoss >= 0,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // 🔹 Report card design (kept original)
//   Widget _reportCard(String title, double amount, {bool isProfit = true}) {
//     return Container(
//       width: double.infinity,
//       height: 150,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         gradient: LinearGradient(
//           colors: [Colors.white, isProfit ? Colors.green : Colors.red],
//           stops: const [0.5, 0.5],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(title,
//               style:
//                   const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 20),
//           Text(
//             "Rs. ${amount.toStringAsFixed(2)}",
//             style: TextStyle(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: isProfit ? Colors.green[800] : Colors.red[800],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'dart:io';
// import 'package:excel/excel.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class ExcelHelper {
//   static Future<void> exportToExcel({
//     required BuildContext context,
//     required Box box,

//     required String sheetName,
//     required String fileName,
//     required List<String> headers,
//   }) async {
//     var excel = Excel.createExcel();

//     if (excel.sheets.containsKey("Sheet1")) {
//       excel.delete("Sheet1");
//     }

//     Sheet sheet = excel[sheetName];
//     excel.setDefaultSheet(sheetName);

//     sheet.appendRow(headers.map((h) => TextCellValue(h)).toList());

//     for (var key in box.keys) {
//       final value = box1.get(key);

//       if (value is Map) {
//         final stock = Map<String, dynamic>.from(value);

//         sheet.appendRow(
//           headers.map((h) {
//             final cellValue = stock[h];
//             if (cellValue is num) return DoubleCellValue(cellValue.toDouble());
//             if (cellValue is bool) return BoolCellValue(cellValue);
//             return TextCellValue(cellValue?.toString() ?? "");
//           }).toList(),
//         );
//       }
//     }

//     String? outputFile = await FilePicker.platform.saveFile(
//       dialogTitle: 'Save Excel File',
//       fileName: '$fileName.xlsx',
//       type: FileType.custom,
//       allowedExtensions: ['xlsx'],
//     );

//     if (outputFile != null) {
//       File(outputFile).writeAsBytesSync(excel.encode()!);

//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Exported to $outputFile")),
//         );
//       }
//     }
//   }

//   static Future<void> importFromExcel({
//     required BuildContext context,
//     required Box box,
//     required List<String> headers,
//   }) async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['xlsx'],
//     );

//     if (result != null) {
//       var bytes = File(result.files.single.path!).readAsBytesSync();
//       var excel = Excel.decodeBytes(bytes);

//       for (var table in excel.tables.keys) {
//         for (var row in excel.tables[table]!.rows.skip(1)) {
//           final stock = <String, dynamic>{};

//           for (int i = 0; i < headers.length; i++) {
//             final cell = row.length > i ? row[i] : null;

//             if (cell == null || cell.value == null) {
//               stock[headers[i]] = "";
//             } else if (cell.value is num) {
//               stock[headers[i]] = cell.value; // keep number
//             } else if (cell.value is bool) {
//               stock[headers[i]] = cell.value; // keep bool
//             } else {
//               stock[headers[i]] = cell.value.toString();
//             }
//           }

//           box.add(stock);
//         }
//       }

//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Import successful")),
//         );
//       }
//     }
//   }
// }

// import 'dart:io';
// import 'package:excel/excel.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class ExcelHelper {
//   /// Export data from one or many Hive boxes
//   static Future<void> exportToExcel({
//     required BuildContext context,
//     required List<Box> boxes, // ✅ flexible
//     required String sheetName,
//     required String fileName,
//     required List<String> headers,
//   }) async {
//     var excel = Excel.createExcel();

//     if (excel.sheets.containsKey("Sheet1")) {
//       excel.delete("Sheet1");
//     }

//     Sheet sheet = excel[sheetName];
//     excel.setDefaultSheet(sheetName);

//     // Add headers
//     sheet.appendRow(headers.map((h) => TextCellValue(h)).toList());

//     // Export from each box
//     for (var box in boxes) {
//       for (var key in box.keys) {
//         final value = box.get(key);
//         if (value is Map) {
//           final stock = Map<String, dynamic>.from(value);
//           sheet.appendRow(
//             headers.map((h) {
//               final cellValue = stock[h];
//               if (cellValue is num)
//                 return DoubleCellValue(cellValue.toDouble());
//               if (cellValue is bool) return BoolCellValue(cellValue);
//               return TextCellValue(cellValue?.toString() ?? "");
//             }).toList(),
//           );
//         }
//       }
//     }

//     // Save file
//     String? outputFile = await FilePicker.platform.saveFile(
//       dialogTitle: 'Save Excel File',
//       fileName: '$fileName.xlsx',
//       type: FileType.custom,
//       allowedExtensions: ['xlsx'],
//     );

//     if (outputFile != null) {
//       File(outputFile).writeAsBytesSync(excel.encode()!);
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Exported to $outputFile")),
//         );
//       }
//     }
//   }

//   /// Import into one or many boxes
//   static Future<void> importFromExcel({
//     required BuildContext context,
//     required List<Box> boxes, // ✅ flexible
//     required List<String> headers,
//   }) async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['xlsx'],
//     );

//     if (result != null) {
//       var bytes = File(result.files.single.path!).readAsBytesSync();
//       var excel = Excel.decodeBytes(bytes);

//       int boxIndex = 0;

//       for (var table in excel.tables.keys) {
//         for (var row in excel.tables[table]!.rows.skip(1)) {
//           final stock = <String, dynamic>{};

//           for (int i = 0; i < headers.length; i++) {
//             final cell = row.length > i ? row[i] : null;
//             if (cell == null || cell.value == null) {
//               stock[headers[i]] = "";
//             } else if (cell.value is num) {
//               stock[headers[i]] = cell.value;
//             } else if (cell.value is bool) {
//               stock[headers[i]] = cell.value;
//             } else {
//               stock[headers[i]] = cell.value.toString();
//             }
//           }

//           // Add row into current box
//           boxes[boxIndex].add(stock);

//           // Move to next box if available
//           boxIndex = (boxIndex + 1) % boxes.length;
//         }
//       }

//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Import successful")),
//         );
//       }
//     }
//   }
// }
// import 'dart:io';
// import 'package:excel/excel.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class ExcelHelper {
//   /// Export data from one or many Hive boxes OR from custom rows
//   static Future<void> exportToExcel({
//     required BuildContext context,
//     List<Box>? boxes, // ✅ optional now
//     required String sheetName,
//     required String fileName,
//     required List<String> headers,
//     List<List<String>>? rows, // ✅ new optional
//   }) async {
//     var excel = Excel.createExcel();

//     if (excel.sheets.containsKey("Sheet1")) {
//       excel.delete("Sheet1");
//     }

//     Sheet sheet = excel[sheetName];
//     excel.setDefaultSheet(sheetName);

//     // Add headers
//     sheet.appendRow(headers.map((h) => TextCellValue(h)).toList());

//     // ✅ If rows are provided → use them
//     if (rows != null) {
//       for (var row in rows) {
//         sheet.appendRow(
//           row.map((cell) => TextCellValue(cell)).toList(),
//         );
//       }
//     }
//     // ✅ Otherwise → fallback to Hive box export
//     else if (boxes != null) {
//       for (var box in boxes) {
//         for (var key in box.keys) {
//           final value = box.get(key);
//           if (value is Map) {
//             final stock = Map<String, dynamic>.from(value);
//             sheet.appendRow(
//               headers.map((h) {
//                 final cellValue = stock[h];
//                 if (cellValue is num) {
//                   return DoubleCellValue(cellValue.toDouble());
//                 }
//                 if (cellValue is bool) {
//                   return BoolCellValue(cellValue);
//                 }
//                 return TextCellValue(cellValue?.toString() ?? "");
//               }).toList(),
//             );
//           }
//         }
//       }
//     }

//     // Save file
//     String? outputFile = await FilePicker.platform.saveFile(
//       dialogTitle: 'Save Excel File',
//       fileName: '$fileName.xlsx',
//       type: FileType.custom,
//       allowedExtensions: ['xlsx'],
//     );

//     if (outputFile != null) {
//       File(outputFile).writeAsBytesSync(excel.encode()!);
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Exported to $outputFile")),
//         );
//       }
//     }
//   }

//   /// Import into one or many boxes
//   static Future<void> importFromExcel({
//     required BuildContext context,
//     required List<Box> boxes, // ✅ flexible
//     required List<String> headers,
//   }) async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['xlsx'],
//     );

//     if (result != null) {
//       var bytes = File(result.files.single.path!).readAsBytesSync();
//       var excel = Excel.decodeBytes(bytes);

//       int boxIndex = 0;

//       for (var table in excel.tables.keys) {
//         for (var row in excel.tables[table]!.rows.skip(1)) {
//           final stock = <String, dynamic>{};

//           for (int i = 0; i < headers.length; i++) {
//             final cell = row.length > i ? row[i] : null;
//             if (cell == null || cell.value == null) {
//               stock[headers[i]] = "";
//             } else if (cell.value is num) {
//               stock[headers[i]] = cell.value;
//             } else if (cell.value is bool) {
//               stock[headers[i]] = cell.value;
//             } else {
//               stock[headers[i]] = cell.value.toString();
//             }
//           }

//           // Add row into current box
//           boxes[boxIndex].add(stock);

//           // Move to next box if available
//           boxIndex = (boxIndex + 1) % boxes.length;
//         }
//       }

//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Import successful")),
//         );
//       }
//     }
//   }
// }
// import 'dart:io';
// import 'package:excel/excel.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// class ExcelHelper {
//   /// Export data from Hive boxes
//   static Future<void> exportToExcel({
//     required BuildContext context,
//     required List<Box> boxes,
//     required String sheetName,
//     required String fileName,
//     required List<String> headers,
//   }) async {
//     var excel = Excel.createExcel();

//     if (excel.sheets.containsKey("Sheet1")) {
//       excel.delete("Sheet1");
//     }

//     Sheet sheet = excel[sheetName];
//     excel.setDefaultSheet(sheetName);

//     // Add headers
//     sheet.appendRow(headers.map((h) => TextCellValue(h)).toList());

//     // Export from each box
//     for (var box in boxes) {
//       for (var key in box.keys) {
//         final value = box.get(key);
//         if (value is Map) {
//           final stock = Map<String, dynamic>.from(value);
//           sheet.appendRow(
//             headers.map((h) {
//               final cellValue = stock[h];
//               if (cellValue is num)
//                 return DoubleCellValue(cellValue.toDouble());
//               if (cellValue is bool) return BoolCellValue(cellValue);
//               return TextCellValue(cellValue?.toString() ?? "");
//             }).toList(),
//           );
//         }
//       }
//     }

//     await _saveFile(context, excel, fileName);
//   }

//   /// Export custom rows (like weeklyTotals in Reports)
//   static Future<void> exportRowsToExcel({
//     required BuildContext context,
//     required String sheetName,
//     required String fileName,
//     required List<String> headers,
//     required List<List<String>> rows,
//   }) async {
//     var excel = Excel.createExcel();

//     if (excel.sheets.containsKey("Sheet1")) {
//       excel.delete("Sheet1");
//     }

//     Sheet sheet = excel[sheetName];
//     excel.setDefaultSheet(sheetName);

//     // Add headers
//     sheet.appendRow(headers.map((h) => TextCellValue(h)).toList());

//     // Add rows
//     for (var row in rows) {
//       sheet.appendRow(row.map((cell) => TextCellValue(cell)).toList());
//     }

//     await _saveFile(context, excel, fileName);
//   }

//   /// Import into one or many boxes
//   static Future<void> importFromExcel({
//     required BuildContext context,
//     required List<Box> boxes,
//     required List<String> headers,
//   }) async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['xlsx'],
//     );

//     if (result != null) {
//       var bytes = File(result.files.single.path!).readAsBytesSync();
//       var excel = Excel.decodeBytes(bytes);

//       int boxIndex = 0;

//       for (var table in excel.tables.keys) {
//         for (var row in excel.tables[table]!.rows.skip(1)) {
//           final stock = <String, dynamic>{};

//           for (int i = 0; i < headers.length; i++) {
//             final cell = row.length > i ? row[i] : null;
//             if (cell == null || cell.value == null) {
//               stock[headers[i]] = "";
//             } else if (cell.value is num) {
//               stock[headers[i]] = cell.value;
//             } else if (cell.value is bool) {
//               stock[headers[i]] = cell.value;
//             } else {
//               stock[headers[i]] = cell.value.toString();
//             }
//           }

//           boxes[boxIndex].add(stock);
//           boxIndex = (boxIndex + 1) % boxes.length;
//         }
//       }

//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Import successful")),
//         );
//       }
//     }
//   }

//   /// Save helper
//   static Future<void> _saveFile(
//       BuildContext context, Excel excel, String fileName) async {
//     String? outputFile = await FilePicker.platform.saveFile(
//       dialogTitle: 'Save Excel File',
//       fileName: '$fileName.xlsx',
//       type: FileType.custom,
//       allowedExtensions: ['xlsx'],
//     );

//     if (outputFile != null) {
//       File(outputFile).writeAsBytesSync(excel.encode()!);
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Exported to $outputFile")),
//         );
//       }
//     }
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:intl/intl.dart';
// import 'package:software/reuseable_widget/excel.dart';

// class Reports extends StatefulWidget {
//   const Reports({super.key});

//   @override
//   State<Reports> createState() => _ReportsState();
// }

// class _ReportsState extends State<Reports> {
//   late Box purchaseBox;
//   late Box currentsalesBox;

//   List<Map<String, dynamic>> weeklyTotals = [];

//   @override
//   void initState() {
//     super.initState();
//     purchaseBox = Hive.box('purchaseBox');
//     currentsalesBox = Hive.box('currentsalesBox');
//     _calculateWeeklyReports();
//   }

//   DateTime _startOfWeek(DateTime date) {
//     return date.subtract(Duration(days: date.weekday - 1));
//   }

//   DateTime _endOfWeek(DateTime date) {
//     return date.add(Duration(days: 7 - date.weekday));
//   }

//   void _calculateWeeklyReports() {
//     final allDates = <DateTime>{};

//     for (var key in purchaseBox.keys) {
//       if (key.toString().length >= 10) {
//         allDates.add(DateTime.parse(key.toString()));
//       }
//     }

//     for (var key in currentsalesBox.keys) {
//       if (key.toString().length >= 10) {
//         allDates.add(DateTime.parse(key.toString()));
//       }
//     }

//     final Map<String, Map<String, double>> weeks = {};

//     for (var date in allDates) {
//       final start = _startOfWeek(date);
//       final end = _endOfWeek(date);
//       final weekKey =
//           "${DateFormat('dd-MMM').format(start)} to ${DateFormat('dd-MMM').format(end)}";

//       double weekPurchase = 0.0;
//       double weekSales = 0.0;

//       for (int i = 0; i < 7; i++) {
//         final key =
//             DateFormat('yyyy-MM-dd').format(start.add(Duration(days: i)));
//         final dayPurchases = purchaseBox.get(key, defaultValue: []);
//         if (dayPurchases is List) {
//           for (var item in dayPurchases) {
//             if (item is Map && item.containsKey('amount')) {
//               weekPurchase += (item['amount'] as num).toDouble();
//             }
//           }
//         } else if (dayPurchases is double || dayPurchases is int) {
//           weekPurchase += (dayPurchases as num).toDouble();
//         }

//         final daySales = currentsalesBox.get(key, defaultValue: []);
//         if (daySales is List) {
//           for (var item in daySales) {
//             if (item is Map && item.containsKey('amount')) {
//               weekSales += (item['amount'] as num).toDouble();
//             }
//           }
//         } else if (daySales is double || daySales is int) {
//           weekSales += (daySales as num).toDouble();
//         }
//       }

//       weeks[weekKey] = {
//         'purchase': weekPurchase,
//         'sales': weekSales,
//       };
//     }

//     final List<Map<String, dynamic>> weekList = weeks.entries.map((e) {
//       final profit = e.value['sales']! - e.value['purchase']!;
//       return {
//         'week': e.key,
//         'purchase': e.value['purchase'],
//         'sales': e.value['sales'],
//         'profit': profit,
//         'isProfit': profit >= 0,
//       };
//     }).toList();

//     weekList.sort((a, b) => b['week'].compareTo(a['week']));

//     setState(() {
//       weeklyTotals = weekList;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Weekly Reports',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         actions: [
//         //   IconButton(
//         //     tooltip: "Export to Excel",
//         //     onPressed: () {
//         //       ExcelHelper.exportToExcel(
//         //         context: context,
//         //         boxes: [purchaseBox, currentsalesBox],
//         //         sheetName: " Reports",
//         //         fileName: "Reports",
//         //         headers: [
//         //           "week",
//         //           "purchase",
//         //           "sales",
//         //           "profit",
//         //           "loss",
//         //         ],
//         //       );
//         //     },
//         //     icon: const Icon(Icons.file_upload),
//         //   ),
//         //   IconButton(
//         //     tooltip: "Import from Excel",
//         //     onPressed: () {
//         //       ExcelHelper.importFromExcel(
//         //         context: context,
//         //         boxes: [purchaseBox, currentsalesBox],
//         //         headers: [
//         //           "week",
//         //           "purchase",
//         //           "sales",
//         //           "profit",
//         //           "loss",
//         //         ],
//         //       );
//         //     },
//         //     icon: const Icon(Icons.file_download),
//         //   ),
//         IconButton(
//   tooltip: "Export to Excel",
//   onPressed: () {
//     ExcelHelper.exportToExcel(
//       context: context,
//       boxes: [purchaseBox, currentsalesBox],
//       sheetName: "Reports",
//       fileName: "Reports",
//       headers: [
//         "week",
//         "purchase",
//         "sales",
//         "profit",
//         "loss",
//       ],
//       rows: weeklyTotals.map((week) => [
//         week['week'],
//         week['purchase'].toStringAsFixed(2),
//         week['sales'].toStringAsFixed(2),
//         week['profit'] >= 0
//             ? week['profit'].toStringAsFixed(2) // Profit value
//             : "0.00", // No profit when loss
//         week['profit'] < 0
//             ? week['profit'].abs().toStringAsFixed(2) // Loss value
//             : "0.00", // No loss when profit
//       ]).toList(),
//     );
//   },
//   icon: const Icon(Icons.file_upload),
// ),
// ],
//         backgroundColor: const Color(0xFF008000),
//       ),
//       backgroundColor: const Color(0xFF008000),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: weeklyTotals.length,
//         itemBuilder: (context, index) {
//           final week = weeklyTotals[index];
//           return _weekCard(
//             week['week'],
//             week['purchase'],
//             week['sales'],
//             week['profit'],
//             week['isProfit'],
//           );
//         },
//       ),
//     );
//   }

//   Widget _weekCard(String weekRange, double purchase, double sales,
//       double profit, bool isProfit) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           gradient: LinearGradient(
//             colors: [Colors.white, isProfit ? Colors.green : Colors.red],
//             stops: const [0.5, 0.5],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(weekRange,
//                 style:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 10),
//             Text("Total Purchases: Rs. ${purchase.toStringAsFixed(2)}",
//                 style: const TextStyle(fontSize: 16)),
//             Text("Total Sales: Rs. ${sales.toStringAsFixed(2)}",
//                 style: const TextStyle(fontSize: 16)),
//             const SizedBox(height: 10),
//             Text(
//               isProfit
//                   ? "Profit: Rs. ${profit.toStringAsFixed(2)}"
//                   : "Loss: Rs. ${profit.abs().toStringAsFixed(2)}",
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: isProfit ? Colors.green[800] : Colors.red[800]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//   Widget _purchaseCard(String title, double amount, String dateKey,
//       List<MapEntry<int, dynamic>> purchasesOfDay) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.green
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             ...purchasesOfDay.map((entry) {
//               final index = entry.key;
//               final purchase = entry.value as Map;
//               final purchaseAmount = (purchase['amount'] as num).toDouble();

//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Rs. ${purchaseAmount.toStringAsFixed(2)}",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: purchaseAmount >= 0 ? Colors.black : Colors.red,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.edit, color: Colors.blue),
//                         onPressed: () =>
//                             _editPurchase(dateKey, index, purchaseAmount),
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.delete, color: Colors.red),
//                         onPressed: () => _deletePurchase(dateKey, index),
//                       ),
//                     ],
//                   ),
//                 ],
//               );
//             }).toList(),
//             const SizedBox(height: 10),
//             Text(
//               "Total: Rs. ${amount.toStringAsFixed(2)}",
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//   Widget _saleCard(String title, double amount, String dateKey,
//       List<MapEntry<int, dynamic>> salesOfDay) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           gradient: const LinearGradient(
//             colors: [Colors.white, Colors.green],
//             stops: [0.0, 0.0],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             ...salesOfDay.map((entry) {
//               final index = entry.key;
//               final sale = entry.value as Map;
//               final saleAmount = (sale['amount'] as num).toDouble();

//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Rs. ${saleAmount.toStringAsFixed(2)}",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: saleAmount >= 0 ? Colors.black : Colors.red,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.edit, color: Colors.blue),
//                         onPressed: () => _editSale(dateKey, index, saleAmount),
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.delete, color: Colors.red),
//                         onPressed: () => _deleteSale(dateKey, index),
//                       ),
//                     ],
//                   ),
//                 ],
//               );
//             }).toList(),
//             const SizedBox(height: 10),
//             Text(
//               "Total: Rs. ${amount.toStringAsFixed(2)}",
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:blue_thermal_printer/blue_thermal_printer.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class InvoiceScreen extends StatefulWidget {
//   const InvoiceScreen({super.key});

//   @override
//   State<InvoiceScreen> createState() => _InvoiceScreenState();
// }

// class _InvoiceScreenState extends State<InvoiceScreen> {
//   final Map<String, List<Map<String, dynamic>>> bills = {};
//   String activeBill = "Bill_1";

//   final Box availableBox = Hive.box('availableBox');
//   final Box viewsalesBox = Hive.box('viewsalesBox');

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController qtyController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController customerController = TextEditingController();
//   final TextEditingController discountPercentController =
//       TextEditingController();
//   final TextEditingController discountAmountController =
//       TextEditingController();
//   final TextEditingController counterPersonController = TextEditingController();

//   final FocusNode nameFocus = FocusNode();
//   final FocusNode qtyFocus = FocusNode();
//   final FocusNode priceFocus = FocusNode();
//   final FocusNode customerFocus = FocusNode();
//   final FocusNode discountPercentFocus = FocusNode();
//   final FocusNode discountAmountFocus = FocusNode();
//   final FocusNode counterPersonFocus = FocusNode();

//   final String ntnNo = '#1234677';
//   final String licenseNo = 'LIC-987654';

//   List<Map> filteredMedicines = [];
//   double currentPerTabletRate = 0.0;
//   bool isManualRate = false;
//   int selectedMedicineIndex = -1;

//   final BlueThermalPrinter printer = BlueThermalPrinter.instance;

//   @override
//   void initState() {
//     super.initState();
//     bills[activeBill] = [];
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     qtyController.dispose();
//     priceController.dispose();
//     customerController.dispose();
//     discountPercentController.dispose();
//     discountAmountController.dispose();
//     counterPersonController.dispose();
//     nameFocus.dispose();
//     qtyFocus.dispose();
//     priceFocus.dispose();
//     customerFocus.dispose();
//     discountPercentFocus.dispose();
//     discountAmountFocus.dispose();
//     counterPersonFocus.dispose();
//     super.dispose();
//   }

//   List<Map<String, dynamic>> get cart => bills[activeBill] ?? [];

//   void addMedicine() {
//     final name = nameController.text.trim();
//     final int qty = int.tryParse(qtyController.text.trim()) ?? 1;
//     final double price = double.tryParse(priceController.text.trim()) ?? 0.0;

//     if (name.isEmpty || price <= 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Please fill all required fields!')));
//       return;
//     }

//     if (!isManualRate) {
//       final stock = availableBox.values.cast<Map>().firstWhere(
//             (m) =>
//                 m["Medicine Name"].toString().toLowerCase() ==
//                 name.toLowerCase(),
//             orElse: () => {},
//           );

//       if (stock.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//             content:
//                 Text('Medicine not found in stock! Use manual rate instead.')));
//         return;
//       }
//     }

//     setState(() {
//       cart.add({
//         'name': name,
//         'qty': qty,
//         'price': price * qty,
//         'unitPrice': price,
//       });
//       _clearInputs();
//       nameFocus.requestFocus();
//     });
//   }

//   void _clearInputs() {
//     nameController.clear();
//     qtyController.clear();
//     priceController.clear();
//     currentPerTabletRate = 0.0;
//     filteredMedicines = [];
//     selectedMedicineIndex = -1;
//     isManualRate = false;
//   }

//   void _createNewBill() {
//     final newKey = "Bill_${bills.length + 1}";
//     setState(() {
//       bills[newKey] = [];
//       activeBill = newKey;
//     });
//   }

//   void _switchBill(String key) {
//     setState(() {
//       activeBill = key;
//     });
//   }

//   double get subtotal =>
//       cart.fold<double>(0, (sum, item) => sum + (item['price'] as double));

//   double get discount {
//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;

//     if (discountAmountInput > 0) return discountAmountInput.clamp(0, subtotal);
//     if (discountPercentInput > 0)
//       return subtotal * (discountPercentInput / 100).clamp(0, 1);
//     return 0;
//   }

//   double get grandTotal => (subtotal - discount).clamp(0, double.infinity);

//   String _formatDateTime(DateTime dt) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
//   }

//   Widget _keyboardTextField({
//     required TextEditingController controller,
//     required FocusNode focusNode,
//     FocusNode? nextFocus,
//     FocusNode? prevFocus,
//     FocusNode? rightFocus,
//     FocusNode? leftFocus,
//     String? label,
//     TextInputType keyboardType = TextInputType.text,
//     bool readOnly = false,
//     void Function(String)? onChanged,
//     void Function()? onEnter,
//     bool isMedicineField = false,
//   }) {
//     return KeyboardListener(
//       focusNode: FocusNode(),
//       onKeyEvent: (event) {
//         if (event is KeyDownEvent && focusNode.hasFocus) {
//           if (isMedicineField && filteredMedicines.isNotEmpty) {
//             if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
//               setState(() {
//                 selectedMedicineIndex =
//                     (selectedMedicineIndex + 1) % filteredMedicines.length;
//               });
//               return;
//             } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
//               setState(() {
//                 selectedMedicineIndex = selectedMedicineIndex <= 0
//                     ? filteredMedicines.length - 1
//                     : selectedMedicineIndex - 1;
//               });
//               return;
//             } else if (event.logicalKey == LogicalKeyboardKey.enter) {
//               if (selectedMedicineIndex >= 0 &&
//                   selectedMedicineIndex < filteredMedicines.length) {
//                 _selectMedicine(filteredMedicines[selectedMedicineIndex]);
//               }
//               return;
//             } else if (event.logicalKey == LogicalKeyboardKey.escape) {
//               setState(() {
//                 filteredMedicines = [];
//                 selectedMedicineIndex = -1;
//               });
//               return;
//             }
//           }
//           if (event.logicalKey == LogicalKeyboardKey.enter && onEnter != null) {
//             onEnter();
//           }
//         }
//       },
//       child: TextField(
//         controller: controller,
//         focusNode: focusNode,
//         keyboardType: keyboardType,
//         readOnly: readOnly,
//         decoration: InputDecoration(
//           labelText: label,
//           isDense: true,
//           border: OutlineInputBorder(),
//           contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           suffixIcon: isMedicineField && filteredMedicines.isNotEmpty
//               ? Icon(Icons.keyboard_arrow_down)
//               : null,
//           helperText: isMedicineField
//               ? '↑↓: Navigate, Enter: Select (then enter Qty), Esc: Close'
//               : null,
//           helperMaxLines: 2,
//         ),
//         onChanged: onChanged,
//         onSubmitted: (_) {
//           if (onEnter != null) onEnter();
//         },
//       ),
//     );
//   }

//   void _selectMedicine(Map stock) {
//     setState(() {
//       nameController.text = stock["Medicine Name"];
//       final int packSize = int.tryParse(stock["Tablets"].toString()) ?? 1;
//       final double packPrice =
//           double.tryParse(stock["Pack Price"].toString()) ?? 0.0;
//       currentPerTabletRate = packSize > 0 ? packPrice / packSize : 0;
//       qtyController.text = '';
//       priceController.text = '';
//       filteredMedicines = [];
//       selectedMedicineIndex = -1;
//       isManualRate = false;
//     });

//     Future.delayed(Duration(milliseconds: 100), () {
//       FocusScope.of(context).requestFocus(qtyFocus);
//     });
//   }

//   Widget _buildMedicineDropdown() {
//     if (filteredMedicines.isEmpty) return const SizedBox.shrink();

//     return Container(
//       constraints: BoxConstraints(maxHeight: 200),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(4),
//         color: Colors.white,
//       ),
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: filteredMedicines.length,
//         itemBuilder: (context, index) {
//           final stock = filteredMedicines[index];
//           final bool isSelected = index == selectedMedicineIndex;

//           return InkWell(
//             onTap: () {
//               _selectMedicine(stock);
//             },
//             child: Container(
//               padding: EdgeInsets.all(12),
//               color: isSelected ? Colors.blue.shade100 : null,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(stock["Medicine Name"]),
//                         Text(
//                             "Pack: ${stock["Tablets"]}, Rs. ${stock["Pack Price"]}"),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice - $activeBill'),
//         centerTitle: true,
//         backgroundColor: const Color(0xFF008000),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _switchBill,
//             itemBuilder: (context) => bills.keys
//                 .map((bill) => PopupMenuItem(
//                       value: bill,
//                       child: Text(bill == activeBill ? "$bill (Active)" : bill),
//                     ))
//                 .toList(),
//           ),
//           IconButton(
//               onPressed: _createNewBill,
//               icon: const Icon(Icons.add),
//               tooltip: "New Bill"),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Header
//             Row(
//               children: [
//                 const Expanded(
//                   child: Text('Al-Shifa Medical',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: const Text('الشفاء میڈیکل',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('NTN: $ntnNo'),
//                       Text('License No: $licenseNo'),
//                       Text('Print Time: ${_formatDateTime(DateTime.now())}'),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 240,
//                   child: _keyboardTextField(
//                     controller: customerController,
//                     focusNode: customerFocus,
//                     nextFocus: nameFocus,
//                     rightFocus: nameFocus,
//                     leftFocus: counterPersonFocus,
//                     label: 'Customer Name',
//                   ),
//                 ),
//               ],
//             ),
//             const Divider(height: 24, thickness: 1),

//             Card(
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           flex: 3,
//                           child: Column(
//                             children: [
//                               _keyboardTextField(
//                                 controller: nameController,
//                                 focusNode: nameFocus,
//                                 nextFocus: qtyFocus,
//                                 prevFocus: customerFocus,
//                                 rightFocus: qtyFocus,
//                                 leftFocus: customerFocus,
//                                 label: 'Medicine Name',
//                                 isMedicineField: true,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     isManualRate = false;
//                                     selectedMedicineIndex = -1;
//                                     filteredMedicines = value.isEmpty
//                                         ? []
//                                         : availableBox.values
//                                             .where((stock) =>
//                                                 stock["Medicine Name"]
//                                                     .toString()
//                                                     .toLowerCase()
//                                                     .contains(
//                                                         value.toLowerCase()))
//                                             .cast<Map>()
//                                             .toList();
//                                     if (filteredMedicines.isNotEmpty) {
//                                       selectedMedicineIndex = 0;
//                                     }
//                                   });
//                                 },
//                                 onEnter: () {
//                                   if (filteredMedicines.isNotEmpty &&
//                                       selectedMedicineIndex >= 0) {
//                                     _selectMedicine(filteredMedicines[
//                                         selectedMedicineIndex]);
//                                   } else {
//                                     qtyFocus.requestFocus();
//                                   }
//                                 },
//                               ),
//                               SizedBox(height: 4),
//                               _buildMedicineDropdown(),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           flex: 1,
//                           child: _keyboardTextField(
//                             controller: qtyController,
//                             focusNode: qtyFocus,
//                             nextFocus: priceFocus,
//                             prevFocus: nameFocus,
//                             rightFocus: priceFocus,
//                             leftFocus: nameFocus,
//                             label: 'Quantity',
//                             keyboardType: TextInputType.number,
//                             onChanged: (value) {
//                               if (!isManualRate && currentPerTabletRate > 0) {
//                                 final qty = int.tryParse(value) ?? 1;
//                                 setState(() {
//                                   priceController.text =
//                                       (currentPerTabletRate * qty)
//                                           .toStringAsFixed(2);
//                                 });
//                               }
//                             },
//                             onEnter: addMedicine,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           flex: 1,
//                           child: _keyboardTextField(
//                             controller: priceController,
//                             focusNode: priceFocus,
//                             nextFocus: discountPercentFocus,
//                             prevFocus: qtyFocus,
//                             rightFocus: discountPercentFocus,
//                             leftFocus: qtyFocus,
//                             label: 'Unit Rate (Rs.)',
//                             keyboardType: TextInputType.number,
//                             readOnly: !isManualRate && currentPerTabletRate > 0,
//                             onChanged: (value) {
//                               if (value.isNotEmpty) {
//                                 setState(() {
//                                   isManualRate = true;
//                                 });
//                               }
//                             },
//                             onEnter: addMedicine,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Column(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.add, color: Colors.green),
//                               onPressed: addMedicine,
//                               tooltip: 'Add to cart',
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.edit, color: Colors.blue),
//                               onPressed: () {
//                                 setState(() {
//                                   isManualRate = true;
//                                   priceController.clear();
//                                   priceFocus.requestFocus();
//                                 });
//                               },
//                               tooltip: 'Manual rate',
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: isManualRate,
//                           onChanged: (value) {
//                             setState(() {
//                               isManualRate = value ?? false;
//                               if (!isManualRate) {
//                                 priceController.clear();
//                               }
//                             });
//                           },
//                         ),
//                         Text('Manual Rate Entry'),
//                         Spacer(),
//                         if (currentPerTabletRate > 0 && !isManualRate)
//                           Text(
//                               'Auto Rate: Rs. ${currentPerTabletRate.toStringAsFixed(2)} per unit'),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             Container(
//               constraints: BoxConstraints(maxHeight: 300),
//               child: SingleChildScrollView(
//                 child: DataTable(
//                   columnSpacing: 20,
//                   columns: const [
//                     DataColumn(label: Text('S.No')),
//                     DataColumn(label: Text('Medicine')),
//                     DataColumn(label: Text('Qty')),
//                     DataColumn(label: Text('Unit Rate')),
//                     DataColumn(label: Text('Total')),
//                     DataColumn(label: Text('Action')),
//                   ],
//                   rows: [
//                     for (int i = 0; i < cart.length; i++)
//                       DataRow(cells: [
//                         DataCell(Text('${i + 1}')),
//                         DataCell(
//                           Container(
//                             width: 120,
//                             child: Text(
//                               cart[i]['name'].toString(),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ),
//                         DataCell(Text(cart[i]['qty'].toString())),
//                         DataCell(Text(
//                             'Rs. ${(cart[i]['unitPrice'] as double).toStringAsFixed(2)}')),
//                         DataCell(Text(
//                             'Rs. ${(cart[i]['price'] as double).toStringAsFixed(2)}')),
//                         DataCell(
//                           Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                 icon: const Icon(Icons.edit,
//                                     color: Colors.blue, size: 18),
//                                 onPressed: () {
//                                   setState(() {
//                                     nameController.text = cart[i]['name'];
//                                     qtyController.text =
//                                         cart[i]['qty'].toString();
//                                     priceController.text =
//                                         (cart[i]['unitPrice'] as double)
//                                             .toStringAsFixed(2);
//                                     isManualRate = true;
//                                     cart.removeAt(i);
//                                     nameFocus.requestFocus();
//                                   });
//                                 },
//                                 tooltip: 'Edit',
//                               ),
//                               IconButton(
//                                 icon: const Icon(Icons.delete,
//                                     color: Colors.red, size: 18),
//                                 onPressed: () {
//                                   setState(() {
//                                     cart.removeAt(i);
//                                   });
//                                 },
//                                 tooltip: 'Delete',
//                               ),
//                             ],
//                           ),
//                         ),
//                       ])
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             Card(
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: _keyboardTextField(
//                             controller: discountPercentController,
//                             focusNode: discountPercentFocus,
//                             nextFocus: discountAmountFocus,
//                             prevFocus: priceFocus,
//                             rightFocus: discountAmountFocus,
//                             leftFocus: priceFocus,
//                             keyboardType: TextInputType.number,
//                             label: 'Discount %',
//                             onChanged: (_) => setState(() {}),
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: _keyboardTextField(
//                             controller: discountAmountController,
//                             focusNode: discountAmountFocus,
//                             nextFocus: counterPersonFocus,
//                             prevFocus: discountPercentFocus,
//                             rightFocus: counterPersonFocus,
//                             leftFocus: discountPercentFocus,
//                             keyboardType: TextInputType.number,
//                             label: 'Discount Amount (Rs.)',
//                             onChanged: (_) => setState(() {}),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Items: ${cart.length}'),
//                             Text(
//                                 'Total Qty: ${cart.fold<int>(0, (sum, item) => sum + (item['qty'] as int))}'),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text(
//                                 'Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                             Text(
//                                 'Discount: Rs. ${discount.toStringAsFixed(2)}'),
//                             Text(
//                               'Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 18),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             Row(
//               children: [
//                 Expanded(
//                   child: _keyboardTextField(
//                     controller: counterPersonController,
//                     focusNode: counterPersonFocus,
//                     nextFocus: customerFocus,
//                     prevFocus: discountAmountFocus,
//                     rightFocus: customerFocus,
//                     leftFocus: discountAmountFocus,
//                     label: 'Counter Person Name',
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 const Text(
//                   'THANK YOU FOR SHOPPING',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 20),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _generatePdfInvoice,
//                   icon: const Icon(Icons.picture_as_pdf),
//                   label: const Text('Generate PDF'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     setState(() {
//                       bills[activeBill] = [];
//                       _clearInputs();
//                       customerController.clear();
//                       counterPersonController.clear();
//                       discountPercentController.clear();
//                       discountAmountController.clear();
//                     });
//                   },
//                   icon: const Icon(Icons.clear),
//                   label: const Text('Clear All'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _printThermalInvoice() async {
//     bool isConnected = await printer.isConnected ?? false;
//     if (!isConnected) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please connect the printer first!")),
//       );
//       return;
//     }

//     printer.printNewLine();
//     printer.printCustom("AL-SHIFA MEDICAL", 2, 1);
//     printer.printCustom("Invoice - $activeBill", 1, 1);
//     printer.printNewLine();
//     printer.printCustom("Customer: ${customerController.text}", 1, 0);
//     printer.printCustom("Counter: ${counterPersonController.text}", 1, 0);
//     printer.printCustom("Date: ${_formatDateTime(DateTime.now())}", 1, 0);
//     printer.printNewLine();

//     for (var item in cart) {
//       printer.printLeftRight("${item['name']} x${item['qty']}",
//           "Rs.${(item['unitPrice'] as double).toStringAsFixed(2)}", 1);
//       printer.printLeftRight(
//           "", "Rs.${(item['price'] as double).toStringAsFixed(2)}", 1);
//     }

//     printer.printNewLine();
//     printer.printLeftRight("Subtotal", "Rs.${subtotal.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Discount", "Rs.${discount.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Total", "Rs.${grandTotal.toStringAsFixed(2)}", 2);
//     printer.printNewLine();
//     printer.printCustom("THANK YOU FOR SHOPPING", 1, 1);
//     printer.printNewLine();
//     printer.paperCut();

//     viewsalesBox.add({
//       'billNo': activeBill,
//       'customer': customerController.text,
//       'counterPerson': counterPersonController.text,
//       'date': DateTime.now().toString(),
//       'items': cart,
//       'subtotal': subtotal,
//       'discount': discount,
//       'grandTotal': grandTotal,
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Invoice saved to sales history!')));
//   }

//   Future<void> _generatePdfInvoice() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         build: (context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text('AL-SHIFA MEDICAL',
//                   style: pw.TextStyle(
//                       fontSize: 24, fontWeight: pw.FontWeight.bold)),
//               pw.Text('Invoice - $activeBill',
//                   style: pw.TextStyle(fontSize: 18)),
//               pw.SizedBox(height: 10),
//               pw.Text('Customer: ${customerController.text}'),
//               pw.Text('Counter: ${counterPersonController.text}'),
//               pw.Text('Date: ${_formatDateTime(DateTime.now())}'),
//               pw.SizedBox(height: 10),
//               pw.Table.fromTextArray(
//                 headers: ['S.No', 'Medicine', 'Qty', 'Unit Rate', 'Total'],
//                 data: List.generate(cart.length, (index) {
//                   final item = cart[index];
//                   return [
//                     '${index + 1}',
//                     item['name'],
//                     item['qty'].toString(),
//                     'Rs. ${(item['unitPrice'] as double).toStringAsFixed(2)}',
//                     'Rs. ${(item['price'] as double).toStringAsFixed(2)}',
//                   ];
//                 }),
//               ),
//               pw.SizedBox(height: 10),
//               pw.Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//               pw.Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//               pw.Text('Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                   style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 20),
//               pw.Center(
//                   child: pw.Text('THANK YOU FOR SHOPPING',
//                       style: pw.TextStyle(
//                           fontSize: 16, fontWeight: pw.FontWeight.bold))),
//             ],
//           );
//         },
//       ),
//     );

//     await Printing.layoutPdf(onLayout: (format) async => pdf.save());
//   }
// }
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:blue_thermal_printer/blue_thermal_printer.dart';
// import 'package:pdf/widgets.dart' as pw;

// class InvoiceScreen extends StatefulWidget {
//   const InvoiceScreen({super.key});

//   @override
//   State<InvoiceScreen> createState() => _InvoiceScreenState();
// }

// class _InvoiceScreenState extends State<InvoiceScreen> {
//   final Map<String, List<Map<String, dynamic>>> bills = {};
//   String activeBill = "Bill_1";

//   final Box availableBox = Hive.box('availableBox');
//   final Box viewsalesBox = Hive.box('viewsalesBox');

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController qtyController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController customerController = TextEditingController();
//   final TextEditingController discountPercentController =
//       TextEditingController();
//   final TextEditingController discountAmountController =
//       TextEditingController();
//   final TextEditingController counterPersonController = TextEditingController();

//   final FocusNode nameFocus = FocusNode();
//   final FocusNode qtyFocus = FocusNode();
//   final FocusNode priceFocus = FocusNode();
//   final FocusNode customerFocus = FocusNode();
//   final FocusNode discountPercentFocus = FocusNode();
//   final FocusNode discountAmountFocus = FocusNode();
//   final FocusNode counterPersonFocus = FocusNode();

//   final String ntnNo = '#1234677';
//   final String licenseNo = 'LIC-987654';

//   List<Map> filteredMedicines = [];
//   double currentPerTabletRate = 0.0;
//   bool isManualRate = false;
//   int selectedMedicineIndex = -1;

//   final BlueThermalPrinter printer = BlueThermalPrinter.instance;

//   @override
//   void initState() {
//     super.initState();
//     bills[activeBill] = [];
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     qtyController.dispose();
//     priceController.dispose();
//     customerController.dispose();
//     discountPercentController.dispose();
//     discountAmountController.dispose();
//     counterPersonController.dispose();
//     nameFocus.dispose();
//     qtyFocus.dispose();
//     priceFocus.dispose();
//     customerFocus.dispose();
//     discountPercentFocus.dispose();
//     discountAmountFocus.dispose();
//     counterPersonFocus.dispose();
//     super.dispose();
//   }

//   List<Map<String, dynamic>> get cart => bills[activeBill] ?? [];

//   void addMedicine() {
//     final name = nameController.text.trim();
//     final int qty = int.tryParse(qtyController.text.trim()) ?? 1;
//     final double price = double.tryParse(priceController.text.trim()) ?? 0.0;

//     if (name.isEmpty || price <= 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Please fill all required fields!')));
//       return;
//     }

//     if (!isManualRate) {
//       final stock = availableBox.values.cast<Map>().firstWhere(
//             (m) =>
//                 m["Medicine Name"].toString().toLowerCase() ==
//                 name.toLowerCase(),
//             orElse: () => {},
//           );

//       if (stock.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//             content:
//                 Text('Medicine not found in stock! Use manual rate instead.')));
//         return;
//       }
//     }

//     setState(() {
//       cart.add({
//         'name': name,
//         'qty': qty,
//         'price': price * qty,
//         'unitPrice': price,
//       });
//       _clearInputs();
//       nameFocus.requestFocus();
//     });
//   }

//   void _clearInputs() {
//     nameController.clear();
//     qtyController.clear();
//     priceController.clear();
//     currentPerTabletRate = 0.0;
//     filteredMedicines = [];
//     selectedMedicineIndex = -1;
//     isManualRate = false;
//   }

//   void _createNewBill() {
//     final newKey = "Bill_${bills.length + 1}";
//     setState(() {
//       bills[newKey] = [];
//       activeBill = newKey;
//     });
//   }

//   void _switchBill(String key) {
//     setState(() {
//       activeBill = key;
//     });
//   }

//   double get subtotal =>
//       cart.fold<double>(0, (sum, item) => sum + (item['price'] as double));

//   double get discount {
//     final double discountAmountInput =
//         double.tryParse(discountAmountController.text.trim()) ?? 0;
//     final double discountPercentInput =
//         double.tryParse(discountPercentController.text.trim()) ?? 0;

//     if (discountAmountInput > 0) return discountAmountInput.clamp(0, subtotal);
//     if (discountPercentInput > 0)
//       return subtotal * (discountPercentInput / 100).clamp(0, 1);
//     return 0;
//   }

//   double get grandTotal => (subtotal - discount).clamp(0, double.infinity);

//   String _formatDateTime(DateTime dt) {
//     String two(int n) => n.toString().padLeft(2, '0');
//     return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
//   }

//   Widget _keyboardTextField({
//     required TextEditingController controller,
//     required FocusNode focusNode,
//     FocusNode? nextFocus,
//     FocusNode? prevFocus,
//     FocusNode? rightFocus,
//     FocusNode? leftFocus,
//     String? label,
//     TextInputType keyboardType = TextInputType.text,
//     bool readOnly = false,
//     void Function(String)? onChanged,
//     void Function()? onEnter,
//     bool isMedicineField = false,
//   }) {
//     return KeyboardListener(
//       focusNode: FocusNode(),
//       onKeyEvent: (event) {
//         if (event is KeyDownEvent && focusNode.hasFocus) {
//           if (isMedicineField && filteredMedicines.isNotEmpty) {
//             if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
//               setState(() {
//                 selectedMedicineIndex =
//                     (selectedMedicineIndex + 1) % filteredMedicines.length;
//               });
//               return;
//             } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
//               setState(() {
//                 selectedMedicineIndex = selectedMedicineIndex <= 0
//                     ? filteredMedicines.length - 1
//                     : selectedMedicineIndex - 1;
//               });
//               return;
//             } else if (event.logicalKey == LogicalKeyboardKey.enter) {
//               if (selectedMedicineIndex >= 0 &&
//                   selectedMedicineIndex < filteredMedicines.length) {
//                 _selectMedicine(filteredMedicines[selectedMedicineIndex]);
//               }
//               return;
//             } else if (event.logicalKey == LogicalKeyboardKey.escape) {
//               setState(() {
//                 filteredMedicines = [];
//                 selectedMedicineIndex = -1;
//               });
//               return;
//             }
//           }
//           if (event.logicalKey == LogicalKeyboardKey.enter && onEnter != null) {
//             onEnter();
//           }
//         }
//       },
//       child: TextField(
//         controller: controller,
//         focusNode: focusNode,
//         keyboardType: keyboardType,
//         readOnly: readOnly,
//         decoration: InputDecoration(
//           labelText: label,
//           isDense: true,
//           border: OutlineInputBorder(),
//           contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           suffixIcon: isMedicineField && filteredMedicines.isNotEmpty
//               ? Icon(Icons.keyboard_arrow_down)
//               : null,
//           helperText: isMedicineField
//               ? '↑↓: Navigate, Enter: Select (then enter Qty), Esc: Close'
//               : null,
//           helperMaxLines: 2,
//         ),
//         onChanged: onChanged,
//         onSubmitted: (_) {
//           if (onEnter != null) onEnter();
//         },
//       ),
//     );
//   }

//   void _selectMedicine(Map stock) {
//     setState(() {
//       nameController.text = stock["Medicine Name"];
//       final int packSize = int.tryParse(stock["Tablets"].toString()) ?? 1;
//       final double packPrice =
//           double.tryParse(stock["Pack Price"].toString()) ?? 0.0;
//       currentPerTabletRate = packSize > 0 ? packPrice / packSize : 0;
//       qtyController.text = '';
//       priceController.text = '';
//       filteredMedicines = [];
//       selectedMedicineIndex = -1;
//       isManualRate = false;
//     });

//     Future.delayed(Duration(milliseconds: 100), () {
//       FocusScope.of(context).requestFocus(qtyFocus);
//     });
//   }

//   Widget _buildMedicineDropdown() {
//     if (filteredMedicines.isEmpty) return const SizedBox.shrink();

//     return Container(
//       constraints: BoxConstraints(maxHeight: 200),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(4),
//         color: Colors.white,
//       ),
//       child: ListView.builder(
//         shrinkWrap: true,
//         itemCount: filteredMedicines.length,
//         itemBuilder: (context, index) {
//           final stock = filteredMedicines[index];
//           final bool isSelected = index == selectedMedicineIndex;

//           return InkWell(
//             onTap: () {
//               _selectMedicine(stock);
//             },
//             child: Container(
//               padding: EdgeInsets.all(12),
//               color: isSelected ? Colors.blue.shade100 : null,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(stock["Medicine Name"]),
//                         Text(
//                             "Pack: ${stock["Tablets"]}, Rs. ${stock["Pack Price"]}"),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice - $activeBill'),
//         centerTitle: true,
//         backgroundColor: const Color(0xFF008000),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: _switchBill,
//             itemBuilder: (context) => bills.keys
//                 .map((bill) => PopupMenuItem(
//                       value: bill,
//                       child: Text(bill == activeBill ? "$bill (Active)" : bill),
//                     ))
//                 .toList(),
//           ),
//           IconButton(
//               onPressed: _createNewBill,
//               icon: const Icon(Icons.add),
//               tooltip: "New Bill"),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Header
//             Row(
//               children: [
//                 const Expanded(
//                   child: Text('Al-Shifa Medical',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                 ),
//                 Expanded(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Directionality(
//                       textDirection: TextDirection.rtl,
//                       child: const Text('الشفاء میڈیکل',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold)),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),

//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('NTN: $ntnNo'),
//                       Text('License No: $licenseNo'),
//                       Text('Print Time: ${_formatDateTime(DateTime.now())}'),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 240,
//                   child: _keyboardTextField(
//                     controller: customerController,
//                     focusNode: customerFocus,
//                     nextFocus: nameFocus,
//                     rightFocus: nameFocus,
//                     leftFocus: counterPersonFocus,
//                     label: 'Customer Name',
//                   ),
//                 ),
//               ],
//             ),
//             const Divider(height: 24, thickness: 1),

//             Card(
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           flex: 3,
//                           child: Column(
//                             children: [
//                               _keyboardTextField(
//                                 controller: nameController,
//                                 focusNode: nameFocus,
//                                 nextFocus: qtyFocus,
//                                 prevFocus: customerFocus,
//                                 rightFocus: qtyFocus,
//                                 leftFocus: customerFocus,
//                                 label: 'Medicine Name',
//                                 isMedicineField: true,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     isManualRate = false;
//                                     selectedMedicineIndex = -1;
//                                     filteredMedicines = value.isEmpty
//                                         ? []
//                                         : availableBox.values
//                                             .where((stock) =>
//                                                 stock["Medicine Name"]
//                                                     .toString()
//                                                     .toLowerCase()
//                                                     .contains(
//                                                         value.toLowerCase()))
//                                             .cast<Map>()
//                                             .toList();
//                                     if (filteredMedicines.isNotEmpty) {
//                                       selectedMedicineIndex = 0;
//                                     }
//                                   });
//                                 },
//                                 onEnter: () {
//                                   if (filteredMedicines.isNotEmpty &&
//                                       selectedMedicineIndex >= 0) {
//                                     _selectMedicine(filteredMedicines[
//                                         selectedMedicineIndex]);
//                                   } else {
//                                     qtyFocus.requestFocus();
//                                   }
//                                 },
//                               ),
//                               SizedBox(height: 4),
//                               _buildMedicineDropdown(),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           flex: 1,
//                           child: _keyboardTextField(
//                             controller: qtyController,
//                             focusNode: qtyFocus,
//                             nextFocus: priceFocus,
//                             prevFocus: nameFocus,
//                             rightFocus: priceFocus,
//                             leftFocus: nameFocus,
//                             label: 'Quantity',
//                             keyboardType: TextInputType.number,
//                             onChanged: (value) {
//                               if (!isManualRate && currentPerTabletRate > 0) {
//                                 final qty = int.tryParse(value) ?? 1;
//                                 setState(() {
//                                   priceController.text =
//                                       (currentPerTabletRate * qty)
//                                           .toStringAsFixed(2);
//                                 });
//                               }
//                             },
//                             onEnter: addMedicine,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           flex: 1,
//                           child: _keyboardTextField(
//                             controller: priceController,
//                             focusNode: priceFocus,
//                             nextFocus: discountPercentFocus,
//                             prevFocus: qtyFocus,
//                             rightFocus: discountPercentFocus,
//                             leftFocus: qtyFocus,
//                             label: 'Unit Rate (Rs.)',
//                             keyboardType: TextInputType.number,
//                             readOnly: !isManualRate && currentPerTabletRate > 0,
//                             onChanged: (value) {
//                               if (value.isNotEmpty) {
//                                 setState(() {
//                                   isManualRate = true;
//                                 });
//                               }
//                             },
//                             onEnter: addMedicine,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Column(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.add, color: Colors.green),
//                               onPressed: addMedicine,
//                               tooltip: 'Add to cart',
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.edit, color: Colors.blue),
//                               onPressed: () {
//                                 setState(() {
//                                   isManualRate = true;
//                                   priceController.clear();
//                                   priceFocus.requestFocus();
//                                 });
//                               },
//                               tooltip: 'Manual rate',
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: isManualRate,
//                           onChanged: (value) {
//                             setState(() {
//                               isManualRate = value ?? false;
//                               if (!isManualRate) {
//                                 priceController.clear();
//                               }
//                             });
//                           },
//                         ),
//                         Text('Manual Rate Entry'),
//                         Spacer(),
//                         if (currentPerTabletRate > 0 && !isManualRate)
//                           Text(
//                               'Auto Rate: Rs. ${currentPerTabletRate.toStringAsFixed(2)} per unit'),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             Container(
//               constraints: BoxConstraints(maxHeight: 300),
//               child: SingleChildScrollView(
//                 child: DataTable(
//                   columnSpacing: 20,
//                   columns: const [
//                     DataColumn(label: Text('S.No')),
//                     DataColumn(label: Text('Medicine')),
//                     DataColumn(label: Text('Qty')),
//                     DataColumn(label: Text('Unit Rate')),
//                     DataColumn(label: Text('Total')),
//                     DataColumn(label: Text('Action')),
//                   ],
//                   rows: [
//                     for (int i = 0; i < cart.length; i++)
//                       DataRow(cells: [
//                         DataCell(Text('${i + 1}')),
//                         DataCell(
//                           Container(
//                             width: 120,
//                             child: Text(
//                               cart[i]['name'].toString(),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ),
//                         DataCell(Text(cart[i]['qty'].toString())),
//                         DataCell(Text(
//                             'Rs. ${(cart[i]['unitPrice'] as double).toStringAsFixed(2)}')),
//                         DataCell(Text(
//                             'Rs. ${(cart[i]['price'] as double).toStringAsFixed(2)}')),
//                         DataCell(
//                           Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                 icon: const Icon(Icons.edit,
//                                     color: Colors.blue, size: 18),
//                                 onPressed: () {
//                                   setState(() {
//                                     nameController.text = cart[i]['name'];
//                                     qtyController.text =
//                                         cart[i]['qty'].toString();
//                                     priceController.text =
//                                         (cart[i]['unitPrice'] as double)
//                                             .toStringAsFixed(2);
//                                     isManualRate = true;
//                                     cart.removeAt(i);
//                                     nameFocus.requestFocus();
//                                   });
//                                 },
//                                 tooltip: 'Edit',
//                               ),
//                               IconButton(
//                                 icon: const Icon(Icons.delete,
//                                     color: Colors.red, size: 18),
//                                 onPressed: () {
//                                   setState(() {
//                                     cart.removeAt(i);
//                                   });
//                                 },
//                                 tooltip: 'Delete',
//                               ),
//                             ],
//                           ),
//                         ),
//                       ])
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             Card(
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: _keyboardTextField(
//                             controller: discountPercentController,
//                             focusNode: discountPercentFocus,
//                             nextFocus: discountAmountFocus,
//                             prevFocus: priceFocus,
//                             rightFocus: discountAmountFocus,
//                             leftFocus: priceFocus,
//                             keyboardType: TextInputType.number,
//                             label: 'Discount %',
//                             onChanged: (_) => setState(() {}),
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: _keyboardTextField(
//                             controller: discountAmountController,
//                             focusNode: discountAmountFocus,
//                             nextFocus: counterPersonFocus,
//                             prevFocus: discountPercentFocus,
//                             rightFocus: counterPersonFocus,
//                             leftFocus: discountPercentFocus,
//                             keyboardType: TextInputType.number,
//                             label: 'Discount Amount (Rs.)',
//                             onChanged: (_) => setState(() {}),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Items: ${cart.length}'),
//                             Text(
//                                 'Total Qty: ${cart.fold<int>(0, (sum, item) => sum + (item['qty'] as int))}'),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text(
//                                 'Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//                             Text(
//                                 'Discount: Rs. ${discount.toStringAsFixed(2)}'),
//                             Text(
//                               'Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 18),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             Row(
//               children: [
//                 Expanded(
//                   child: _keyboardTextField(
//                     controller: counterPersonController,
//                     focusNode: counterPersonFocus,
//                     nextFocus: customerFocus,
//                     prevFocus: discountAmountFocus,
//                     rightFocus: customerFocus,
//                     leftFocus: discountAmountFocus,
//                     label: 'Counter Person Name',
//                   ),
//                 ),
//                 const SizedBox(width: 20),
//                 const Text(
//                   'THANK YOU FOR SHOPPING',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 20),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: cart.isEmpty ? null : _generatePdfInvoice,
//                   icon: const Icon(Icons.picture_as_pdf),
//                   label: const Text('Generate PDF'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     setState(() {
//                       bills[activeBill] = [];
//                       _clearInputs();
//                       customerController.clear();
//                       counterPersonController.clear();
//                       discountPercentController.clear();
//                       discountAmountController.clear();
//                     });
//                   },
//                   icon: const Icon(Icons.clear),
//                   label: const Text('Clear All'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                     foregroundColor: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _printThermalInvoice() async {
//     bool isConnected = await printer.isConnected ?? false;
//     if (!isConnected) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please connect the printer first!")),
//       );
//       return;
//     }

//     printer.printNewLine();
//     printer.printCustom("AL-SHIFA MEDICAL", 2, 1);
//     printer.printCustom("Invoice - $activeBill", 1, 1);
//     printer.printNewLine();
//     printer.printCustom("Customer: ${customerController.text}", 1, 0);
//     printer.printCustom("Counter: ${counterPersonController.text}", 1, 0);
//     printer.printCustom("Date: ${_formatDateTime(DateTime.now())}", 1, 0);
//     printer.printNewLine();

//     for (var item in cart) {
//       printer.printLeftRight("${item['name']} x${item['qty']}",
//           "Rs.${(item['unitPrice'] as double).toStringAsFixed(2)}", 1);
//       printer.printLeftRight(
//           "", "Rs.${(item['price'] as double).toStringAsFixed(2)}", 1);
//     }

//     printer.printNewLine();
//     printer.printLeftRight("Subtotal", "Rs.${subtotal.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Discount", "Rs.${discount.toStringAsFixed(2)}", 1);
//     printer.printLeftRight("Total", "Rs.${grandTotal.toStringAsFixed(2)}", 2);
//     printer.printNewLine();
//     printer.printCustom("THANK YOU FOR SHOPPING", 1, 1);
//     printer.printNewLine();
//     printer.paperCut();

//     viewsalesBox.add({
//       'billNo': activeBill,
//       'customer': customerController.text,
//       'counterPerson': counterPersonController.text,
//       'date': DateTime.now().toString(),
//       'items': cart,
//       'subtotal': subtotal,
//       'discount': discount,
//       'grandTotal': grandTotal,
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Invoice saved to sales history!')));
//   }

//   // Future<void> _generatePdfInvoice() async {
//   //   final pdf = pw.Document();

//   //   pdf.addPage(
//   //     pw.Page(
//   //       build: (context) {
//   //         return pw.Column(
//   //           crossAxisAlignment: pw.CrossAxisAlignment.start,
//   //           children: [
//   //             pw.Text('AL-SHIFA MEDICAL',
//   //                 style: pw.TextStyle(
//   //                     fontSize: 24, fontWeight: pw.FontWeight.bold)),
//   //             pw.Text('Invoice - $activeBill',
//   //                 style: pw.TextStyle(fontSize: 18)),
//   //             pw.SizedBox(height: 10),
//   //             pw.Text('Customer: ${customerController.text}'),
//   //             pw.Text('Counter: ${counterPersonController.text}'),
//   //             pw.Text('Date: ${_formatDateTime(DateTime.now())}'),
//   //             pw.SizedBox(height: 10),
//   //             pw.Table.fromTextArray(
//   //               headers: ['S.No', 'Medicine', 'Qty', 'Unit Rate', 'Total'],
//   //               data: List.generate(cart.length, (index) {
//   //                 final item = cart[index];
//   //                 return [
//   //                   '${index + 1}',
//   //                   item['name'],
//   //                   item['qty'].toString(),
//   //                   'Rs. ${(item['unitPrice'] as double).toStringAsFixed(2)}',
//   //                   'Rs. ${(item['price'] as double).toStringAsFixed(2)}',
//   //                 ];
//   //               }),
//   //             ),
//   //             pw.SizedBox(height: 10),
//   //             pw.Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//   //             pw.Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//   //             pw.Text('Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//   //                 style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//   //             pw.SizedBox(height: 20),
//   //             pw.Center(
//   //                 child: pw.Text('THANK YOU FOR SHOPPING',
//   //                     style: pw.TextStyle(
//   //                         fontSize: 16, fontWeight: pw.FontWeight.bold))),
//   //           ],
//   //         );
//   //       },
//   //     ),
//   //   );

//   // }
//   Future<void> _generatePdfInvoice() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         build: (context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text('AL-SHIFA MEDICAL',
//                   style: pw.TextStyle(
//                       fontSize: 24, fontWeight: pw.FontWeight.bold)),
//               pw.Text('Invoice - $activeBill',
//                   style: pw.TextStyle(fontSize: 18)),
//               pw.SizedBox(height: 10),
//               pw.Text('Customer: ${customerController.text}'),
//               pw.Text('Counter: ${counterPersonController.text}'),
//               pw.Text('Date: ${_formatDateTime(DateTime.now())}'),
//               pw.SizedBox(height: 10),
//               pw.Table.fromTextArray(
//                 headers: ['S.No', 'Medicine', 'Qty', 'Unit Rate', 'Total'],
//                 data: List.generate(cart.length, (index) {
//                   final item = cart[index];
//                   return [
//                     '${index + 1}',
//                     item['name'],
//                     item['qty'].toString(),
//                     'Rs. ${(item['unitPrice'] as double).toStringAsFixed(2)}',
//                     'Rs. ${(item['price'] as double).toStringAsFixed(2)}',
//                   ];
//                 }),
//               ),
//               pw.SizedBox(height: 10),
//               pw.Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
//               pw.Text('Discount: Rs. ${discount.toStringAsFixed(2)}'),
//               pw.Text('Grand Total: Rs. ${grandTotal.toStringAsFixed(2)}',
//                   style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 20),
//               pw.Center(
//                   child: pw.Text('THANK YOU FOR SHOPPING',
//                       style: pw.TextStyle(
//                           fontSize: 16, fontWeight: pw.FontWeight.bold))),
//             ],
//           );
//         },
//       ),
//     );

//     final output = File("Invoice_$activeBill.pdf");
//     await output.writeAsBytes(await pdf.save());

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("PDF saved: Invoice_$activeBill.pdf")),
//     );
//   }
// }
  // Widget _keyboardTextField({
  //   required TextEditingController controller,
  //   required FocusNode focusNode,
  //   FocusNode? nextFocus,
  //   FocusNode? prevFocus,
  //   FocusNode? rightFocus,
  //   FocusNode? leftFocus,
  //   String? label,
  //   TextInputType keyboardType = TextInputType.text,
  //   bool readOnly = false,
  //   void Function(String)? onChanged,
  //   void Function()? onEnter,
  //   bool isMedicineField = false,
  // }) {
  //   return KeyboardListener(
  //     focusNode: FocusNode(),
  //     onKeyEvent: (event) {
  //       if (event is KeyDownEvent && focusNode.hasFocus) {
  //         if (isMedicineField && filteredMedicines.isNotEmpty) {
  //           if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
  //             setState(() {
  //               selectedMedicineIndex =
  //                   (selectedMedicineIndex + 1) % filteredMedicines.length;
  //             });
  //             return;
  //           } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
  //             setState(() {
  //               selectedMedicineIndex = selectedMedicineIndex <= 0
  //                   ? filteredMedicines.length - 1
  //                   : selectedMedicineIndex - 1;
  //             });
  //             return;
  //           } else if (event.logicalKey == LogicalKeyboardKey.enter) {
  //             if (selectedMedicineIndex >= 0 &&
  //                 selectedMedicineIndex < filteredMedicines.length) {
  //               _selectMedicine(filteredMedicines[selectedMedicineIndex]);
  //             }
  //             return;
  //           } else if (event.logicalKey == LogicalKeyboardKey.escape) {
  //             setState(() {
  //               filteredMedicines = [];
  //               selectedMedicineIndex = -1;
  //             });
  //             return;
  //           }
  //         }
  //         if (event.logicalKey == LogicalKeyboardKey.enter && onEnter != null) {
  //           onEnter();
  //         }
  //       }
  //     },
  //     child: TextField(
  //       controller: controller,
  //       focusNode: focusNode,
  //       keyboardType: keyboardType,
  //       readOnly: readOnly,
  //       decoration: InputDecoration(
  //         labelText: label,
  //         isDense: true,
  //         border: OutlineInputBorder(),
  //         contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //         suffixIcon: isMedicineField && filteredMedicines.isNotEmpty
  //             ? Icon(Icons.keyboard_arrow_down)
  //             : null,
  //         helperText: isMedicineField
  //             ? '↑↓: Navigate, Enter: Select (then enter Qty), Esc: Close'
  //             : null,
  //         helperMaxLines: 2,
  //       ),
  //       onChanged: onChanged,
  //       onSubmitted: (_) {
  //         if (onEnter != null) onEnter();
  //       },
  //     ),
  //   );
  // }