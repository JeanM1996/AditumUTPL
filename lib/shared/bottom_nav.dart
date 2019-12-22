import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.gamepad, size: 20),
            title: Text('Principal')),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.graduationCap, size: 20),
            title: Text('LeaderBoard')),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.infoCircle, size: 20),
            title: Text('Acerca De')),

        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userCircle, size: 20),
            title: Text('Perfil')),
      ].toList(),
      fixedColor: Colors.lightBlue,
      onTap: (int idx) {
        switch (idx) {
          case 0:
            // do nuttin
            break;
          case 1:

            Navigator.pushNamed(context, '/leaderboard');
            break;
          case 2:
            Navigator.pushNamed(context, '/about');
            break;
          case 3:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
    );
  }
}