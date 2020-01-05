import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../shared/shared.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
        child:Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [      SafeArea(
            child: CupertinoButton(
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: new NetworkImage("http://nextrestaurants.com/wp-content/uploads/2019/07/Restaurants-TriviaNights-Marketing-1024x576.png"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(15, 40, 0, 0),
                  child: Text(
                    "Modo de Juego\nJunior",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) => CupertinoAlertDialog(
                    title: const Text('Card is clicked.'),
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
            ),
          ),      SafeArea(
            child: CupertinoButton(
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: new NetworkImage("https://noticias.utpl.edu.ec/sites/default/files/imagenes_editor/sin_titulo.png"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(15, 40, 0, 0),
                  child: Text(
                    "Conoce Nuestra \nOferta Academica",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return new WebViewWebPage(url: "https://www.utpl.edu.ec/oferta-academica/",title: "Oferta Academica| UTPL");
                    }));


              },
            ),
          ),      SafeArea(
            child: CupertinoButton(
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: new NetworkImage("https://inscripciones.utpl.edu.ec/sites/default/files/styles/slide/public/banners/bg-casa-abierta-presencial.jpg?itok=g25Rlcw8"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(15, 40, 0, 0),
                  child: Text(
                    "INSCRIBETE\n y se parte de la UTPL",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                      return new WebViewWebPage(url: "https://inscripciones.utpl.edu.ec/",title: "Inscripciones| UTPL");
                    }));
              },
            ),
          ),],),)),






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