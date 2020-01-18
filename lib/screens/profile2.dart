import 'package:conditional/conditional.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/shared/PureInkWell.dart';
import 'package:quizapp/styles/resource.dart';
import '../shared/shared.dart';
import '../services/services.dart';
import 'package:edge_alert/edge_alert.dart';

import 'general.dart';

class PerfilUlScreen extends StatefulWidget {
  createState() => PerfilUScreenState();
}

class PerfilUScreenState extends State<PerfilUlScreen> {
  AuthService auth = AuthService();

  static String uid;

  @override
  void initState() {
    super.initState();
    auth.getUser.then(
          (user) {
        if (user != null) {
          uid=user.uid;

        }

      },
    );
  }



  @override
  Widget build(BuildContext context) {


    return StreamBuilder<User>(
            stream: AuthService.getUserData(uid),
            builder: (context, snappShot) {

              if (snappShot != null && snappShot.hasData) {
                String dni=snappShot.data.dni;
                print(dni);

                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.deepOrange,
                    title: Text(snappShot.data.fullName?? 'Guest'),
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.only(top: 50),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage("https://img2.freepng.es/20180623/iqh/kisspng-computer-icons-avatar-social-media-blog-font-aweso-avatar-icon-5b2e99c40ce333.6524068515297806760528.jpg"),
                              ),
                            ),
                          ),

                        Spacer(),
                        /**
                            if (report != null)
                            Text('${report.total ?? 0}',
                            style: Theme.of(context).textTheme.display3),
                         */
                        Center(child:Text("Datos del Usuario",style: TextStyle(fontWeight: FontWeight.bold),),),
                        Spacer(),
                        Container(padding: EdgeInsets.all(30),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                SafeArea(child:
                                Row(children: <Widget>[
                                  Text("Cedula: "),
                                  new Flexible(
                                    child: new Container(
                                      padding: new EdgeInsets.only(right: 13.0),
                                      child: new Text(
                                        dni,
                                        overflow: TextOverflow.ellipsis,
                                        style: new TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'Roboto',
                                          color: Colors.lightBlue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]) ,),
                                SafeArea(child:
                                Row(children: <Widget>[
                                  Text("Email: "),
                                  new Flexible(
                                    child: new Container(
                                      padding: new EdgeInsets.only(right: 13.0),
                                      child: new Text(
                                        snappShot.data.email,
                                        overflow: TextOverflow.ellipsis,
                                        style: new TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'Roboto',
                                          color: Colors.lightBlue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]) ,),
                                SafeArea(child:
                                Row(children: <Widget>[
                                  Text("Provincia: "),
                                  new Flexible(
                                    child: new Container(
                                      padding: new EdgeInsets.only(right: 13.0),
                                      child: new Text(
                                        snappShot.data.province,
                                        overflow: TextOverflow.ellipsis,
                                        style: new TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'Roboto',
                                          color: Colors.lightBlue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]) ,),
                                SafeArea(child:
                                Row(children: <Widget>[
                                  Text("Form Acad: "),
                                  new Flexible(
                                    child: new Container(
                                      padding: new EdgeInsets.only(right: 13.0),
                                      child: new Text(
                                        snappShot.data.academic,
                                        overflow: TextOverflow.ellipsis,
                                        style: new TextStyle(
                                          fontSize: 20.0,
                                          fontFamily: 'Roboto',
                                          color: Colors.lightBlue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]) ,),
                                SafeArea(child:
                                Row(children: <Widget>[
                                  Text("Carrera Prioritaria: "),

                                ]) ,)]),),


                        Spacer(),
                        FlatButton(
                            child: Text('Cerrar Sesión'),
                            color: Colors.red,
                            onPressed: () async {
                              await auth.signOut();
                              Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                            }),
                        Spacer()
                      ],
                    ),
                  ),

                );





              } else {
              return LoadingScreen();
              }

            });













}}
