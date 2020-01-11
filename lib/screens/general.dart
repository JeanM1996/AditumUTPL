import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional/conditional.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:quizapp/services/auth.dart';
import 'package:quizapp/services/models.dart';
import 'package:quizapp/shared/PureInkWell.dart';
import 'package:quizapp/styles/resource.dart';
import '../shared/shared.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralScreen extends StatelessWidget {
  static String uidSession;
  static bool inscript=false;
  @override
  Widget build(BuildContext context) {

    AuthService.getCurrentFirebaseUser().then((result) {
      print(result);
      uidSession=result.uid;
    });
    AuthService.checkInscription(uidSession).then((result) {
      print("inscrito");
      print(result);
      inscript=result;
    });
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

      body:SingleChildScrollView(
        child:Conditional(

          condition:true,
          onConditionTrue: Center(
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SafeArea(child:PureInkWell(
                        onTap: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) => CupertinoAlertDialog(
                              title: const Text('Modo de Juego Junior consiste en .... .'),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  child: const Text('ok'),
                                  onPressed: () {
                                    Navigator.pop(context, 'ok');
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            child: Stack(
                              fit: StackFit.passthrough,
                              children: <Widget>[
                                FittedBox(
                                  child: Image.network("http://nextrestaurants.com/wp-content/uploads/2019/07/Restaurants-TriviaNights-Marketing-1024x576.png"),
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: FractionallySizedBox(
                                    widthFactor: 0.5,
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 12),
                                      decoration: BoxDecoration(
                                          color: Resource.color.mainColorLight,
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(32))),
                                      child: Text(
                                        "Modo de Juego Junior",
                                        textAlign: TextAlign.center,
                                        style: Resource.style.homeItemTitle(),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),),
                      SafeArea(child:PureInkWell(
                        onTap: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) => CupertinoAlertDialog(
                              title: const Text('Modo de Juego Senior consiste en .... .'),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  child: const Text('ok'),
                                  onPressed: () {
                                    Navigator.pop(context, 'ok');
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            child: Stack(
                              fit: StackFit.passthrough,
                              children: <Widget>[
                                FittedBox(
                                  child: Image.network("http://nextrestaurants.com/wp-content/uploads/2019/07/Restaurants-TriviaNights-Marketing-1024x576.png"),
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: FractionallySizedBox(
                                    widthFactor: 0.5,
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 12),
                                      decoration: BoxDecoration(
                                          color: Resource.color.mainColorLight,
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(32))),
                                      child: Text(
                                        "Modo de Juego Senior",
                                        textAlign: TextAlign.center,
                                        style: Resource.style.homeItemTitle(),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),),
                      SafeArea(child:PureInkWell(
                        onTap: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (BuildContext context) => CupertinoAlertDialog(
                              title: const Text('Modo de Juego Profesional consiste en .... .'),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  child: const Text('ok'),
                                  onPressed: () {
                                    Navigator.pop(context, 'ok');
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            child: Stack(
                              fit: StackFit.passthrough,
                              children: <Widget>[
                                FittedBox(
                                  child: Image.network("http://nextrestaurants.com/wp-content/uploads/2019/07/Restaurants-TriviaNights-Marketing-1024x576.png"),
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  child: FractionallySizedBox(
                                    widthFactor: 0.5,
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 12),
                                      decoration: BoxDecoration(
                                          color: Resource.color.mainColorLight,
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(32))),
                                      child: Text(
                                        "Modo de Juego Profesional",
                                        textAlign: TextAlign.center,
                                        style: Resource.style.homeItemTitle(),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),),])),
          ),
          onConditionFalse: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(),
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SafeArea(child:PureInkWell(
                      onTap: () {
                        showCupertinoDialog(
                          context: context,
                          builder: (BuildContext context) => CupertinoAlertDialog(
                            title: const Text('Modo de Juego Junior consiste en .... .'),
                            actions: <Widget>[
                              CupertinoDialogAction(
                                child: const Text('ok'),
                                onPressed: () {
                                  Navigator.pop(context, 'ok');
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          child: Stack(
                            fit: StackFit.passthrough,
                            children: <Widget>[
                              FittedBox(
                                child: Image.network("http://nextrestaurants.com/wp-content/uploads/2019/07/Restaurants-TriviaNights-Marketing-1024x576.png"),
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: FractionallySizedBox(
                                  widthFactor: 0.5,
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    decoration: BoxDecoration(
                                        color: Resource.color.mainColorLight,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(32))),
                                    child: Text(
                                      "Modo de Juego Junior",
                                      textAlign: TextAlign.center,
                                      style: Resource.style.homeItemTitle(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),),
                    SafeArea(child:PureInkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute<Null>(builder: (BuildContext context) {
                              return new WebViewWebPage(url: "https://www.utpl.edu.ec/oferta-academica/",title: "Oferta Academica| UTPL");
                            }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          child: Stack(
                            fit: StackFit.passthrough,
                            children: <Widget>[
                              FittedBox(
                                child: Image.network("https://noticias.utpl.edu.ec/sites/default/files/imagenes_editor/sin_titulo.png"),
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: FractionallySizedBox(
                                  widthFactor: 0.5,
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    decoration: BoxDecoration(
                                        color: Resource.color.mainColorLight,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(32))),
                                    child: Text(
                                      "Conoce Nuestra Oferta Academica",
                                      textAlign: TextAlign.center,
                                      style: Resource.style.homeItemTitle(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),),
                    SafeArea(child:PureInkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute<Null>(builder: (BuildContext context) {
                              return new WebViewWebPage(url: "https://inscripciones.utpl.edu.ec/",title: "Inscripciones| UTPL");
                            }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          child: Stack(
                            fit: StackFit.passthrough,
                            children: <Widget>[
                              FittedBox(
                                child: Image.network("https://inscripciones.utpl.edu.ec/sites/default/files/styles/slide/public/banners/bg-casa-abierta-presencial.jpg?itok=g25Rlcw8"),
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: FractionallySizedBox(
                                  widthFactor: 0.5,
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    decoration: BoxDecoration(
                                        color: Resource.color.mainColorLight,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(32))),
                                    child: Text(
                                      "INSCRIBETE\n y se parte de la UTPL",
                                      textAlign: TextAlign.center,
                                      style: Resource.style.homeItemTitle(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),),])))
          ),
        ),








      bottomNavigationBar: AppBottomNav(),
    );
  }


}
class WebViewWebPage extends StatelessWidget {
  final String url;
  final String title;

  WebViewWebPage({this.url,this.title});

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      hidden: true,
      appBar: AppBar(title: Text(title)),
    );
  }
}