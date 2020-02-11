import 'package:conditional/conditional.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:platform_alert_dialog/platform_alert_dialog.dart';
import 'package:quizapp/screens/quiz.dart';
import 'package:quizapp/shared/PureInkWell.dart';
import 'package:quizapp/styles/resource.dart';
import '../shared/shared.dart';
import '../services/services.dart';
import 'package:edge_alert/edge_alert.dart';

import 'general.dart';





class PrincipalScreen extends StatelessWidget {
  static String uid,dni;
  static bool inscrito=false;


  @override




  @override
  Widget build(BuildContext context) {
    if(inscrito==false||uid==null){
      AuthService.getCurrentFirebaseUser().then((result) {
        print(result);
        uid=result.uid;
        print(uid);
      });
      AuthService.getDni(uid).then((result0) {
        print("Dni call:"+result0);
        dni=result0;
        AuthService.checkInscription(dni).then((result1) {
          print("Valorcall call:"+result1.toString());
          inscrito=result1;
        });
      });



    }

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
                    condition:inscrito,
                    onConditionTrue: Center(
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SafeArea(child:PureInkWell(
                                  onTap: () {
                                    showDialog<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return PlatformAlertDialog(
                                          title: Text('Modo de Juego Junior'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text('Juego Rápido.'),
                                                Text('5 preguntas cada una con 10 segundos'),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            PlatformDialogAction(
                                              child: Text('Cerrar'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            PlatformDialogAction(
                                              child: Text('Jugar'),
                                              actionType: ActionType.Preferred,
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => QuizScreen()));
                                              },
                                            ),
                                          ],
                                        );
                                      },
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
                                            child: Image.asset('assets/Junior.png'),
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
                                    showDialog<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return PlatformAlertDialog(
                                          title: Text('Modo de Juego Senior'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text('Juego Sin tiempo, practica sin apuros.'),
                                                Text('Número de preguntas de la prueba, sin tiempo'),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            PlatformDialogAction(
                                              child: Text('Cerrar'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            PlatformDialogAction(
                                              child: Text('Jugar'),
                                              actionType: ActionType.Preferred,
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => QuizScreen()));
                                              },
                                            ),
                                          ],
                                        );
                                      },
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
                                            child: Image.asset('assets/Senior.png'),
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
                                    showDialog<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return PlatformAlertDialog(
                                          title: Text('Modo de Juego Profesional'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text('Practica REAL, piensa y razona.'),
                                                Text('Número de preguntas de la prueba, con tiempo reglamentario'),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            PlatformDialogAction(
                                              child: Text('Cerrar'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            PlatformDialogAction(
                                              child: Text('Jugar'),
                                              actionType: ActionType.Preferred,
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => QuizScreen()));
                                              },
                                            ),
                                          ],
                                        );
                                      },
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
                                            child: Image.asset('assets/Senior.png'),
                                            fit: BoxFit.fitWidth,
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

                                ),),                                  SafeArea(child:PureInkWell(
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
                                            child: Image.network("https://www.utpl.edu.ec/sites/default/files/slider-admisiones_0.jpg"),
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
                                                  "Informate sobre el proceso de admisión",
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
                                      showDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return PlatformAlertDialog(
                                            title: Text('Modo de Juego Junior'),
                                            content: SingleChildScrollView(
                                              child: ListBody(
                                                children: <Widget>[
                                                  Text('Juego Rápido.'),
                                                  Text('5 preguntas cada una con 10 segundos'),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              PlatformDialogAction(
                                                child: Text('Cerrar'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              PlatformDialogAction(
                                                child: Text('Jugar'),
                                                actionType: ActionType.Preferred,
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => QuizScreen()));
                                                },
                                              ),
                                            ],
                                          );
                                        },
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
                                              child: Image.asset('assets/Junior.png'),
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
                                            return new WebViewWebPage(url: "https://inscripciones.utpl.edu.ec/presencial",title: "Oferta Academica| UTPL");
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
                                              child: Image.network("https://www.utpl.edu.ec/sites/default/files/img-bg-rendicion.jpg"),
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
                                              child: Image.network("https://www.utpl.edu.ec/sites/default/files/slider-admisiones_0.jpg"),
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






        )),








      bottomNavigationBar: AppBottomNav(),
    );
  }
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}


