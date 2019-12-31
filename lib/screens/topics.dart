import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../shared/shared.dart';
import '../screens/screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopicsScreen extends StatelessWidget {
  final AuthService auth = AuthService();



  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: Text('Preparate'),
              actions: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.userCircle,
                      color: Colors.pink[200]),
                  onPressed: () => Navigator.pushNamed(context, '/profile'),
                )
              ],
            ),

            body:Text("Hola"),
            bottomNavigationBar: AppBottomNav(),


          );
        }

  Widget menu(BuildContext context,String ced) {
    Widget child;

    checkInscription(ced).then((value) {
      if (!value) {
        //false
        child = Center(
          child:    Text("False")
        );
      } else {
        //True
        child =  Text("True");
      }
    });
    return new Container(child: child);
    }


  static Future<bool> checkInscription(String dni) async {
    bool exists = false;
    try {
      await Firestore.instance.document("inscritos/$dni").get().then((doc) {
        if (doc.exists)

          exists = true;

        else
          exists = false;
      });
      print(exists);
      return exists;
    } catch (e) {
      return false;
    }
  }
}




