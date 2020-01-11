import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/services.dart';
import '../shared/shared.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  final AuthService auth = AuthService();
  static String name="Obteniendo Datos";
  static String city="Obteniendo Datos";
  static String phone="Obteniendo Datos";
  static String academic="Obteniendo Datos";
  static String dni="Obteniendo Datos";
  static String _carrP= '';
  List<String> _carrL = <String>[];
  @override
  Widget build(BuildContext context) {
    //Report report = Provider.of<Report>(context);
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    Stream<User> a=getUserData(user.uid);

    final subscription = a.listen(null);
    subscription.onData((event) {  // Update onData after listening.
      name=event.fullName;
      dni=event.dni;
      city=event.province;
      academic=event.academic;
      _carrP=event.carrera1;
      _carrL.add(event.carrera1);
      _carrL.add(event.carrera2);
      print(name);

      subscription.cancel();
      });


    if (user != null) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(name?? 'Guest'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (user.photoUrl != null)
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(user.photoUrl),
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
                        user.email,
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
                        city,
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
                        academic,
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
                  new DropdownButtonHideUnderline(
                    child: new DropdownButton<String>(
                      value: _carrP,
                      isDense: true,
                      style: TextStyle(
                        fontSize: 15,
                        color:  Colors.lightBlue,

                      ),
                      onChanged: (String newValue) {


                        _carrP= newValue;

                      },
                      items: _carrL .map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                    ),
                  ),
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
  }
  static Stream<User> getUserData(String userID) {
    return Firestore.instance
        .collection("users")
        .where("userID", isEqualTo: userID)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      return snapshot.documents.map((doc) {
        return User.fromDocument(doc);
      }).first;
    });
  }
}
