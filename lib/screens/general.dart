import 'package:flutter/material.dart';

class GeneralScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('General'), backgroundColor: Colors.blue),

      body: Text("Hola")
    );
  }
}