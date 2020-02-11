import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/screens/screens.dart';
import '../shared/shared.dart';
import '../services/services.dart';
import 'general.dart';

class LoginScreen extends StatefulWidget {
  createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
    auth.getUser.then(
      (user) {
        if (user != null) {
          Navigator.pushReplacementNamed(context, '/general');
        }
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlutterLogo(
              size: 150,
            ),
            Text(
              'Aditum UTPL',
              style: Theme.of(context).textTheme.headline,
              textAlign: TextAlign.center,
            ),
            Text('Preparate para ingresar a la U'),
            RegisterButton(
              text: 'Registrarse',
              icon: FontAwesomeIcons.userPlus,
              color: Colors.black45,
            ),
            SignButton(
              text: 'Iniciar Sesión',
              icon: FontAwesomeIcons.doorOpen,
              color: Colors.black45,
            ),

            LoginButton(
              text: 'Ingresar con Google',
              icon: FontAwesomeIcons.google,
              color: Colors.black45,
              loginMethod: auth.googleSignIn,
            ),

          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton(
      {Key key, this.text, this.icon, this.color, this.loginMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: FlatButton.icon(
        padding: EdgeInsets.all(30),
        icon: Icon(icon, color: Colors.white),
        color: color,
        onPressed: () async {
          var user = await loginMethod();
          if (user != null) {
            String uid;

            AuthService.checkUserExist(uid).then((value) {
              if (!value) {

                Navigator.pushReplacementNamed(context, '/formU');
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrincipalScreen()));
              }
            });

          }
        },
        label: Expanded(
          child: Text('$text', textAlign: TextAlign.center),
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
final Color color;
final IconData icon;
final String text;


const RegisterButton(
{Key key, this.text, this.icon, this.color})
: super(key: key);

@override
Widget build(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    child: FlatButton.icon(
      padding: EdgeInsets.all(30),
      icon: Icon(icon, color: Colors.white),
      color: color,
      onPressed: () async {
          Navigator.pushReplacementNamed(context, '/register');

      },
      label: Expanded(
        child: Text('$text', textAlign: TextAlign.center),
      ),
    ),
  );
}
}

class SignButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;


  const SignButton(
      {Key key, this.text, this.icon, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: FlatButton.icon(
        padding: EdgeInsets.all(30),
        icon: Icon(icon, color: Colors.white),
        color: color,
        onPressed: () async {
          Navigator.pushReplacementNamed(context, '/sign');

        },
        label: Expanded(
          child: Text('$text', textAlign: TextAlign.center),
        ),
      ),
    );
  }


}

class FbButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;


  const FbButton(
      {Key key, this.text, this.icon, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: FlatButton.icon(
        padding: EdgeInsets.all(30),
        icon: Icon(icon, color: Colors.white),
        color: color,
        onPressed: (){} ,
        label: Expanded(
          child: Text('$text', textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
