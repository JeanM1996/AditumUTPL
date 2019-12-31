import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/services.dart';
import '../shared/shared.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  final AuthService auth = AuthService();
  static String name="";
  @override
  Widget build(BuildContext context) {
    //Report report = Provider.of<Report>(context);
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    Stream<User> a=getUserData(user.uid);

    final subscription = a.listen(null);
    subscription.onData((event) {  // Update onData after listening.
      name=event.fullName;
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
            Text(user.email ?? '', style: Theme.of(context).textTheme.headline),
            Spacer(),
            /**
            if (report != null)
              Text('${report.total ?? 0}',
                  style: Theme.of(context).textTheme.display3),
                */
            Text('Quizzes Completed',
                style: Theme.of(context).textTheme.subhead),
            Spacer(),
            FlatButton(
                child: Text('logout'),
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
