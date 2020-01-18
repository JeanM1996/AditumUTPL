import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_indicator_view/loading_indicator_view.dart';
import 'package:progress_indicators/progress_indicators.dart';


class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      child:             Center(child:CollectionScaleTransition(
          children: <Widget>[
            Icon(FontAwesomeIcons.graduationCap,color: Colors.lightGreen,size: 45,),
            Text("       "),
            Icon(FontAwesomeIcons.userGraduate,color: Colors.lightBlue,size: 45,),
            Text("       "),
            Icon(Icons.palette,color: Colors.amber,size: 45,),
          ]
      ),
    ));
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [ Loader(),Text("Cargando")]),

      ),
    );
  }
}