import 'package:flutter/material.dart';

class BussinesDetails extends StatefulWidget {
  const BussinesDetails({super.key});

  @override
  State<BussinesDetails> createState() => _BussinesDetailsState();
}

class _BussinesDetailsState extends State<BussinesDetails> {
  //static const String routeName = '/bussines_details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF008000),
      appBar: AppBar(
        title: const Text("Bussiness Details"),
        backgroundColor: const Color(0xFF008000),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/dashboard');
            //   },
            //   child: const Text('Go to Dashboard'),
            // ),
            SizedBox(height: 20),
            Container(
              width: 350,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Al-Shifa-Medical-Store',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 350,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Owner license :121121212121212',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 350,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Shop License No: 123456789',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 350,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'License Expiry Date:12/12/2024',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 350,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'NTN: 123456789EEEE',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
