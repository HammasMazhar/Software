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
