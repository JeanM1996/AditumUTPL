import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("LeaderBoard"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            Spacer(),

            Spacer()
          ],
        ),
      ),

    );
  }
}