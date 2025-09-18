//   Future<void> _saveAndPrintInvoice() async {
//     final pdf = pw.Document();

//     final fontUrdu = pw.Font.ttf(await rootBundle.load('asset/1.ttf'));
//     //  final discountPercentage = subtotal > 0 ? (discount / subtotal) * 100 : 0;

//     final now = DateTime.now();
//     final dateTime =
//         "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} "
//         "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

//     final saleData = {
//       //"billNo": activeBill,

//       "customer": customerController.text,
//       "soldBy": counterPersonController.text,
//       "dateTime": now,
//       "items": cart, // full medicine list

//       "Total": grandTotal,
//     };

//     await viewsalesBox.add(saleData);

//     pw.Widget boldUrduText(String text, {double fontSize = 12}) {
//       return pw.Text(
//         text,
//         style: pw.TextStyle(
//           font: fontUrdu,
//           fontSize: fontSize,
//           fontWeight: pw.FontWeight.bold,
//         ),
//         textDirection: pw.TextDirection.rtl,
//       );
//     }

//     pw.Widget buildHeader() {
//       final DateTime saleDate = saleData["dateTime"] as DateTime;
//       final formattedDate =
//           "${saleDate.year}-${saleDate.month.toString().padLeft(2, '0')}-${saleDate.day.toString().padLeft(2, '0')} "
//           "${saleDate.hour.toString().padLeft(2, '0')}:${saleDate.minute.toString().padLeft(2, '0')}";
//       return pw.Column(
//         crossAxisAlignment: pw.CrossAxisAlignment.center,
//         children: [
//           pw.Text(
//             'Al-Shifa Medical Store',
//             style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
//           ),
//           // sizebox(height: 2),
//           boldUrduText(' الشفاء میڈیکل سٹور', fontSize: 18),
//           pw.SizedBox(height: 2),
//           pw.Text(
//             'Jhanda Peer Road, Waris-pura (Faisalabad)',
//             style: pw.TextStyle(fontSize: 9),
//           ),
//           // pw.Text(
//           //   'Faisalabad. ',
//           //   style: pw.TextStyle(fontSize: 9),
//           // ),
//           pw.Text(
//             'LIC#: 06-331-0166-87626M',
//             style: pw.TextStyle(fontSize: 9),
//           ),

//           pw.Row(
//             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//             children: [
//               // pw.Text('No: 847154', style: pw.TextStyle(fontSize: 9)),
//               pw.Text(formattedDate, style: pw.TextStyle(fontSize: 9)),
//             ],
//           ),
//           pw.Row(
//             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//             children: [
//               pw.Text(
//                 'Customer: ${customerController.text}',
//                 style: pw.TextStyle(fontSize: 9),
//               ),
//             ],
//           ),
//           pw.Divider(),
//         ],
//       );
//     }

//     pw.Widget buildTableHeader() {
//       return pw.Row(
//         children: [
//           pw.SizedBox(
//               width: 20,
//               child: pw.Text('#',
//                   style: pw.TextStyle(
//                       fontSize: 9, fontWeight: pw.FontWeight.bold))),
//           pw.Expanded(
//               flex: 5,
//               child: pw.Text('Item Name',
//                   style: pw.TextStyle(
//                       fontSize: 9, fontWeight: pw.FontWeight.bold))),
//           pw.Expanded(
//               flex: 2,
//               child: pw.Text('Qty',
//                   style: pw.TextStyle(
//                       fontSize: 9, fontWeight: pw.FontWeight.bold))),
//           pw.Expanded(
//               flex: 3,
//               child: pw.Text('Price',
//                   style: pw.TextStyle(
//                       fontSize: 9, fontWeight: pw.FontWeight.bold))),
//           pw.Expanded(
//               flex: 3,
//               child: pw.Text('Total',
//                   style: pw.TextStyle(
//                       fontSize: 9, fontWeight: pw.FontWeight.bold))),
//         ],
//       );
//     }

//     pw.Widget buildTableRows() {
//       return pw.Column(
//         children: cart.asMap().entries.map((entry) {
//           final i = entry.key + 1;
//           final item = entry.value;
//           return pw.Padding(
//             padding: const pw.EdgeInsets.symmetric(vertical: 1),
//             child: pw.Row(
//               children: [
//                 pw.SizedBox(
//                     width: 20,
//                     child: pw.Text('$i', style: pw.TextStyle(fontSize: 9))),
//                 pw.Expanded(
//                     flex: 5,
//                     child: pw.Text('${item['name']}',
//                         style: pw.TextStyle(fontSize: 9))),
//                 pw.Expanded(
//                     flex: 2,
//                     child: pw.Text('${item['qty']}',
//                         style: pw.TextStyle(fontSize: 9))),
//                 pw.Expanded(
//                     flex: 3,
//                     child: pw.Text(
//                         (item['unitPrice'] as double).toStringAsFixed(2),
//                         style: pw.TextStyle(fontSize: 9))),
//                 pw.Expanded(
//                     flex: 3,
//                     child: pw.Text((item['price'] as double).toStringAsFixed(2),
//                         style: pw.TextStyle(fontSize: 9))),
//               ],
//             ),
//           );
//         }).toList(),
//       );
//     }

//     pw.Widget buildTotals() {
//       return pw.Column(
//         crossAxisAlignment: pw.CrossAxisAlignment.end,
//         children: [
//           pw.SizedBox(height: 4),
//           pw.Row(
//             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//             children: [
//               pw.Text('Total items: ${cart.length}',
//                   style: pw.TextStyle(fontSize: 9)),
//               // pw.Text('Sub total: Rs. ${subtotal.toStringAsFixed(2)}',
//               //     style: pw.TextStyle(fontSize: 9)),
//             ],
//           ),
//           // pw.Text(
//           //   'Discount: Rs. ${discount.toStringAsFixed(0)}',
//           //   style: pw.TextStyle(fontSize: 9),
//           // ),
//           //  pw.SizedBox(height: 2),
//           pw.Text(
//             ' Total: ${grandTotal.toStringAsFixed(2)}',
//             style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11),
//           ),
//         ],
//       );
//     }

//     pw.Widget buildFooter() {
//       return pw.Column(
//         crossAxisAlignment: pw.CrossAxisAlignment.start,
//         children: [
//           pw.SizedBox(height: 5),
//           pw.Text('Sold By: ${counterPersonController.text}',
//               style: pw.TextStyle(fontSize: 9)),
//           pw.Divider(),
//           boldUrduText(
//             ' بل کے ساتھ 15 دن کےاندرادویات کی واپسی ممکن ہےورنہ نہیں',
//             fontSize: 7,
//           ),
//           boldUrduText(
//             '.فریج آئٹمز، کاسمیٹکس کی واپسی اور تبدیلی ممکن نہیں',
//             fontSize: 7,
//           ),
//           boldUrduText(
//             'خریداری کے لئے شکریہ!',
//             fontSize: 7,
//           ),
//         ],
//       );
//     }

//     final customFormat = PdfPageFormat.roll80.copyWith(
//       marginTop: 0,
//       marginBottom: 5,
//       marginLeft: 10,
//       marginRight: 10,
//     );

//     pdf.addPage(
//       pw.Page(
//         pageFormat: customFormat,
//         build: (context) => pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             buildHeader(),
//             buildTableHeader(),
//             pw.Divider(),
//             buildTableRows(),
//             pw.Divider(),
//             buildTotals(),
//             buildFooter(),
//           ],
//         ),
//       ),
//     );

//     await Printing.layoutPdf(onLayout: (format) async => pdf.save());
//     setState(() {
//       bills.remove(activeBill);
//       _createNewBill();
//       customerController.clear();
//       counterPersonController.clear();
//     });
//   }
// }
//   Future<void> _saveAndPrintInvoice() async {
//     final pdf = pw.Document();

//     final fontUrdu = pw.Font.ttf(await rootBundle.load('asset/1.ttf'));
//     //  final discountPercentage = subtotal > 0 ? (discount / subtotal) * 100 : 0;

//     final now = DateTime.now();
//     final dateTime =
//         "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} "
//         "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";

//     final saleData = {
//       //"billNo": activeBill,

//       "customer": customerController.text,
//       "soldBy": counterPersonController.text,
//       "dateTime": now,
//       "items": cart, // full medicine list

//       "Total": grandTotal,
//     };

//     await viewsalesBox.add(saleData);

//     pw.Widget boldUrduText(String text, {double fontSize = 12}) {
//       return pw.Text(
//         text,
//         style: pw.TextStyle(
//           font: fontUrdu,
//           fontSize: fontSize,
//           fontWeight: pw.FontWeight.bold,
//         ),
//         textDirection: pw.TextDirection.rtl,
//       );
//     }

//     pw.Widget buildHeader() {
//       final DateTime saleDate = saleData["dateTime"] as DateTime;
//       final formattedDate =
//           "${saleDate.year}-${saleDate.month.toString().padLeft(2, '0')}-${saleDate.day.toString().padLeft(2, '0')} "
//           "${saleDate.hour.toString().padLeft(2, '0')}:${saleDate.minute.toString().padLeft(2, '0')}";
//       return pw.Column(
//         crossAxisAlignment: pw.CrossAxisAlignment.center,
//         children: [
//           pw.Text(
//             'Al-Shifa Medical Store',
//             style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
//           ),
//           // sizebox(height: 2),
//           boldUrduText(' الشفاء میڈیکل سٹور', fontSize: 18),
//           pw.SizedBox(height: 2),
//           pw.Text(
//             'Jhanda Peer Road, Waris-pura (Faisalabad)',
//             style: pw.TextStyle(fontSize: 9),
//           ),
//           // pw.Text(
//           //   'Faisalabad. ',
//           //   style: pw.TextStyle(fontSize: 9),
//           // ),
//           pw.Text(
//             'LIC#: 06-331-0166-87626M',
//             style: pw.TextStyle(fontSize: 9),
//           ),

//           pw.Row(
//             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//             children: [
//               // pw.Text('No: 847154', style: pw.TextStyle(fontSize: 9)),
//               pw.Text(formattedDate, style: pw.TextStyle(fontSize: 9)),
//             ],
//           ),
//           pw.Row(
//             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//             children: [
//               pw.Text(
//                 'Customer: ${customerController.text}',
//                 style: pw.TextStyle(fontSize: 9),
//               ),
//             ],
//           ),
//           pw.Divider(),
//         ],
//       );
//     }

//     pw.Widget buildTableHeader() {
//       return pw.Row(
//         children: [
//           pw.SizedBox(
//               width: 20,
//               child: pw.Text('#',
//                   style: pw.TextStyle(
//                       fontSize: 9, fontWeight: pw.FontWeight.bold))),
//           pw.Expanded(
//               flex: 5,
//               child: pw.Text('Item Name',
//                   style: pw.TextStyle(
//                       fontSize: 9, fontWeight: pw.FontWeight.bold))),
//           pw.Expanded(
//               flex: 2,
//               child: pw.Text('Qty',
//                   style: pw.TextStyle(
//                       fontSize: 9, fontWeight: pw.FontWeight.bold))),
//           pw.Expanded(
//               flex: 3,
//               child: pw.Text('Price',
//                   style: pw.TextStyle(
//                       fontSize: 9, fontWeight: pw.FontWeight.bold))),
//           pw.Expanded(
//               flex: 3,
//               child: pw.Text('Total',
//                   style: pw.TextStyle(
//                       fontSize: 9, fontWeight: pw.FontWeight.bold))),
//         ],
//       );
//     }

//     pw.Widget buildTableRows() {
//       return pw.Column(
//         children: cart.asMap().entries.map((entry) {
//           final i = entry.key + 1;
//           final item = entry.value;
//           return pw.Padding(
//             padding: const pw.EdgeInsets.symmetric(vertical: 1),
//             child: pw.Row(
//               children: [
//                 pw.SizedBox(
//                     width: 20,
//                     child: pw.Text('$i', style: pw.TextStyle(fontSize: 9))),
//                 pw.Expanded(
//                     flex: 5,
//                     child: pw.Text('${item['name']}',
//                         style: pw.TextStyle(fontSize: 9))),
//                 pw.Expanded(
//                     flex: 2,
//                     child: pw.Text('${item['qty']}',
//                         style: pw.TextStyle(fontSize: 9))),
//                 pw.Expanded(
//                     flex: 3,
//                     child: pw.Text(
//                         (item['unitPrice'] as double).toStringAsFixed(2),
//                         style: pw.TextStyle(fontSize: 9))),
//                 pw.Expanded(
//                     flex: 3,
//                     child: pw.Text((item['price'] as double).toStringAsFixed(2),
//                         style: pw.TextStyle(fontSize: 9))),
//               ],
//             ),
//           );
//         }).toList(),
//       );
//     }

//     pw.Widget buildTotals() {
//       return pw.Column(
//         crossAxisAlignment: pw.CrossAxisAlignment.end,
//         children: [
//           pw.SizedBox(height: 4),
//           pw.Row(
//             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//             children: [
//               pw.Text('Total items: ${cart.length}',
//                   style: pw.TextStyle(fontSize: 9)),
//               // pw.Text('Sub total: Rs. ${subtotal.toStringAsFixed(2)}',
//               //     style: pw.TextStyle(fontSize: 9)),
//             ],
//           ),
//           // pw.Text(
//           //   'Discount: Rs. ${discount.toStringAsFixed(0)}',
//           //   style: pw.TextStyle(fontSize: 9),
//           // ),
//           //  pw.SizedBox(height: 2),
//           pw.Text(
//             ' Total: ${grandTotal.toStringAsFixed(2)}',
//             style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11),
//           ),
//         ],
//       );
//     }

//     pw.Widget buildFooter() {
//       return pw.Column(
//         crossAxisAlignment: pw.CrossAxisAlignment.start,
//         children: [
//           pw.SizedBox(height: 5),
//           pw.Text('Sold By: ${counterPersonController.text}',
//               style: pw.TextStyle(fontSize: 9)),
//           pw.Divider(),
//           boldUrduText(
//             ' بل کے ساتھ 15 دن کےاندرادویات کی واپسی ممکن ہےورنہ نہیں',
//             fontSize: 7,
//           ),
//           boldUrduText(
//             '.فریج آئٹمز، کاسمیٹکس کی واپسی اور تبدیلی ممکن نہیں',
//             fontSize: 7,
//           ),
//           boldUrduText(
//             'خریداری کے لئے شکریہ!',
//             fontSize: 7,
//           ),
//         ],
//       );
//     }

//     final customFormat = PdfPageFormat.roll80.copyWith(
//       marginTop: 0,
//       marginBottom: 5,
//       marginLeft: 10,
//       marginRight: 10,
//     );

//     pdf.addPage(
//       pw.Page(
//         pageFormat: customFormat,
//         build: (context) => pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             buildHeader(),
//             buildTableHeader(),
//             pw.Divider(),
//             buildTableRows(),
//             pw.Divider(),
//             buildTotals(),
//             buildFooter(),
//           ],
//         ),
//       ),
//     );

//     await Printing.layoutPdf(onLayout: (format) async => pdf.save());
//     setState(() {
//       bills.remove(activeBill);
//       _createNewBill();
//       customerController.clear();
//       counterPersonController.clear();
//     });
//   }
// }
