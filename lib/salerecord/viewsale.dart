import 'package:flutter/material.dart';

class Viewsale extends StatefulWidget {
  const Viewsale({super.key});

  @override
  State<Viewsale> createState() => _ViewsaleState();
}

class _ViewsaleState extends State<Viewsale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("view sale")));
  }
}
