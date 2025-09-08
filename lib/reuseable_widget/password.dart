// import 'package:flutter/material.dart';

// class PasswordProtectedTile extends StatelessWidget {
//   final String title;
//   final double amount;
//   final String password;
//   final bool isProtected;

//   const PasswordProtectedTile({
//     super.key,
//     required this.title,
//     required this.amount,
//     this.password = "1234",
//     this.isProtected = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (isProtected) {
//           _askPassword(context);
//         }
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
//               isProtected ? "🔒 Locked" : 'Rs. ${amount.toStringAsFixed(2)}',
//               style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _askPassword(BuildContext context) {
//     final TextEditingController _controller = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Enter Password"),
//           content: TextField(
//             controller: _controller,
//             obscureText: true,
//             decoration: const InputDecoration(hintText: "Password"),
//           ),
//           actions: [
//             TextButton(
//               child: const Text("Cancel"),
//               onPressed: () => Navigator.pop(context),
//             ),
//             TextButton(
//               child: const Text("OK"),
//               onPressed: () {
//                 if (_controller.text == password) {
//                   Navigator.pop(context);

//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: Text(title),
//                       content: Text('Rs. ${amount.toStringAsFixed(2)}'),
//                       actions: [
//                         TextButton(
//                           child: const Text("Close"),
//                           onPressed: () => Navigator.pop(context),
//                         )
//                       ],
//                     ),
//                   );
//                 } else {
//                   Navigator.pop(context);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text("Wrong password!")),
//                   );
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
