import 'package:flutter/material.dart';
import '../shared/shared.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GeneralScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Aditum UTPL'),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.userCircle,
                color: Colors.pink[200]),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          )
        ],
      ),

      body: ,

      bottomNavigationBar: AppBottomNav(),
    );
  }


}
