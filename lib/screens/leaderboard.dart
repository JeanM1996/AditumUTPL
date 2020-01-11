import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var r = TextStyle(color: Colors.purpleAccent, fontSize: 34);
    int i = 0;
    Color my = Colors.brown, CheckMyColor = Colors.white;
    return Stack(
      children: <Widget>[
        Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightGreen,
              title: Text("LeaderBoard"),
            ),
            body: Container(
              margin: EdgeInsets.only(top: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15.0, top: 10.0),
                    child: RichText(
                        text: TextSpan(
                            text: "Clasificación",
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: " General",
                                  style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold))
                            ])),
                  ),

                  Flexible(
                      child: StreamBuilder<QuerySnapshot>(
                          stream: Firestore.instance
                              .collection('leaderboard')
                              .where('class', isEqualTo: '12')
                              .orderBy('MyPoints', descending: true)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              i = 0;
                              return ListView.builder(
                                  itemCount: snapshot.data.documents.length,
                                  itemBuilder: (context, index) {
                                    print(index);
                                    if (index >= 1) {
                                      print('Greater than 1');
                                      if (snapshot.data.documents[index]
                                          .data['MyPoints'] ==
                                          snapshot.data.documents[index - 1]
                                              .data['MyPoints']) {
                                        print('Same');
                                      } else {
                                        i++;
                                      }
                                    }

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 5.0),
                                      child: InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: i == 0
                                                      ? Colors.amber
                                                      : i == 1
                                                      ? Colors.grey
                                                      : i == 2
                                                      ? Colors.brown
                                                      : Colors.white,
                                                  width: 3.0,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                              BorderRadius.circular(5.0)),
                                          width: MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        top: 10.0, left: 15.0),
                                                    child: Row(
                                                      children: <Widget>[
                                                        CircleAvatar(
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    image: DecorationImage(
                                                                        image: NetworkImage("https://huntpng.com/images650/avatar-icon-png-17.png"),
                                                                        fit: BoxFit
                                                                            .fill)))),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 20.0, top: 10.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              snapshot
                                                                  .data
                                                                  .documents[index]
                                                                  .data['Name'],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .deepPurple,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                              maxLines: 6,
                                                            )),
                                                        Text("Points: " +
                                                            snapshot
                                                                .data
                                                                .documents[index]
                                                                .data['MyPoints']
                                                                .toString()),
                                                      ],
                                                    ),
                                                  ),
                                                  Flexible(child: Container()),
                                                  i == 0
                                                      ? Text("🥇", style: r)
                                                      : i == 1
                                                      ? Text(
                                                    "🥈",
                                                    style: r,
                                                  )
                                                      : i == 2
                                                      ? Text(
                                                    "🥉",
                                                    style: r,
                                                  )
                                                      : Text(''),

                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }))
                ],
              ),
            )),
      ],
    );
  }
}