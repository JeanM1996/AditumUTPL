import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/shared/CheckboxFormField.dart';
import '../shared/shared.dart';
import '../services/services.dart';

class UserDScreen extends StatefulWidget {
  createState() => UserDScreenState();
}

class UserDScreenState extends State<UserDScreen> {
  AuthService auth = AuthService();
  static BuildContext context1;
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
        child: new StepperBodyU(),
      ),
    );
  }
}


class UserDataM {
  String name = '';
  String phone = '';

  String dni = '';

  String school = '';
  String gender = '';
  String province = '';
  String carrera1 = '';
  String carrera2 = '';
}
class StepperBodyU extends StatefulWidget {
  @override
  _StepperBodyUState createState() => new _StepperBodyUState();
}

class _StepperBodyUState extends State<StepperBodyU> {
  int currStep = 0;
  static String _genderS = '';
  static var _focusNode = new FocusNode();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static UserDataM data = new UserDataM();
  static List<String> _genderL = <String>['', 'Masculino', 'Femenino', 'No Binario'];
  static String _provS = '';
  static bool otherSubject=false;
  static bool viewVisible = false;
  static List<String> _provL = <String>['',     "Azuay",
    "Bolívar",
    "Cañar",
    "Carchi",
    "Chimborazo",
    "Cotopaxi",
    "El Oro",
    "Esmeraldas",
    "Galápagos",
    "Guayas",
    "Imbabura",
    "Loja",
    "Los Ríos",
    "Manabí",
    "Morona Santiago",
    "Napo",
    "Orellana",
    "Pastaza",
    "Pichincha",
    "Santa Elena",
    "Santo Domingo de los Tsáchilas",
    "Sucumbíos",
    "Tungurahua",
    "Zamora Chinchipe",];
  static String _carrS = '';
  static String _carrS1 = '';
  static List<String> _carrL = <String>['',    "Bioquímica y Farmacia",
    "Enfermería",
    "Medicina",
    "Administración de empresas",
    "Agropecuaria",
    "Alimentos",
    "Arquitectura",
    "Artes visuales",
    "Biología",
    "Computación",
    "Comunicación",
    "Contabilidad y Auditoría",
    "Derecho",
    "Economía",
    "Finanzas",
    "Gastronomía",
    "Geología",
    "Gestión Ambiental",
    "Ingeniería Ambiental",
    "Ingeniería Civil",
    "Ingeniería Industrial",
    "Ingeniería Química",
    "Logística y transporte",
    "Inglés",
    "Psicología Clínica",
    "Psicopedagogía",
    "Telecomunicaciones"];

  void showWidget(bool visibility){
    print("HERE"+visibility.toString());
    if(visibility==true){
      viewVisible=true;
      print("Aqui");
    }else{
      viewVisible=false;
    }
  }
  static bool check=false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
      print('Has focus: $_focusNode.hasFocus');
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  List<Step> steps = [
    new Step(
      title: const Text('Información de la Cuenta'),
      //subtitle: const Text('Enter your name'),
      isActive: true,
      //state: StepState.error,
      state: StepState.indexed,
      content:

      Column(
        children: <Widget>[
          new TextFormField(

            keyboardType: TextInputType.text,
            autocorrect: false,
            onSaved: (String value) {
              data.name = value;
            },
            maxLines: 1,
            //initialValue: 'Aseem Wangoo',
            validator: (value) {
              if (value.isEmpty || value.length < 1) {
                return 'Por favor ingrese su nombre!';
              }
            },
            decoration: new InputDecoration(
                labelText: 'Nombre Completo',
                hintText: 'Nombres y Apellidos',
                //filled: true,
                icon: const Icon(Icons.person),
                labelStyle:
                new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          ),
          new TextFormField(

            keyboardType: TextInputType.phone,
            autocorrect: false,
            onSaved: (String value) {
              data.phone= value;
            },
            maxLines: 1,
            //initialValue: 'Aseem Wangoo',
            validator: (value) {
              if (value.isEmpty || value.length < 1) {
                return 'Por favor ingrese su número celular';
              }
            },
            decoration: new InputDecoration(
                labelText: 'Celular',
                hintText: '0999999999',
                //filled: true,
                icon: const Icon(Icons.phone_android),
                labelStyle:
                new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          ),

        ],
      ),
    ),

    new Step(
      title: const Text('Información General'),
      //subtitle: const Text('Subtitle'),
      isActive: true,
      //state: StepState.editing,
      state: StepState.indexed,
      content:        Column(
        children: <Widget>[
          new TextFormField(

            keyboardType: TextInputType.text,
            autocorrect: false,
            onSaved: (String value) {
              data.dni = value;
            },
            maxLines: 1,
            //initialValue: 'Aseem Wangoo',
            validator: (value) {
              if (value.isEmpty || value.length < 1) {
                return 'Por favor ingrese su # de Ced!';
              }
            },
            decoration: new InputDecoration(
                labelText: 'Cédula',
                hintText: '1100000000',
                //filled: true,
                icon: const Icon(Icons.credit_card),
                labelStyle:
                new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          ),
          new TextFormField(

            keyboardType: TextInputType.text,
            autocorrect: false,
            onSaved: (String value) {
              data.school= value;
            },
            maxLines: 1,
            //initialValue: 'Aseem Wangoo',
            validator: (value) {
              if (value.isEmpty || value.length < 1) {
                return 'Por favor ingrese el nombre de su colegio';
              }
            },
            decoration: new InputDecoration(
                labelText: 'Colegio o Formación mas alta',
                hintText: 'Colegio N o Ingeniero Civil',

                //filled: true,
                icon: const Icon(Icons.school),
                labelStyle:
                new TextStyle(decorationStyle: TextDecorationStyle.solid)),
          ),
          new FormField<String>(

            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  icon: const Icon(Icons.person),
                  labelText: 'Genero',
                  errorText: state.hasError ? state.errorText : null,
                ),
                isEmpty: _genderS == '',
                child: new DropdownButtonHideUnderline(
                  child: new DropdownButton<String>(
                    value: _genderS,
                    isDense: true,
                    onChanged: (String newValue) {

                      data.gender = newValue;
                      _genderS = newValue;
                      state.didChange(newValue);

                    },
                    items: _genderL .map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
            validator: (val) {
              return val != '' ? null : 'Seleccione un género';
            },
          ),
          new FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  icon: const Icon(Icons.location_city),
                  labelText: 'Provincia de Residencia',
                  errorText: state.hasError ? state.errorText : null,
                ),
                isEmpty: _provS == '',
                child: new DropdownButtonHideUnderline(
                  child: new DropdownButton<String>(
                    value: _provS,
                    isDense: true,
                    hint: Text("Seleccione una opción"),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,

                    ),

                    onChanged: (String newValue) {

                      data.province = newValue;
                      _provS = newValue;
                      state.didChange(newValue);

                    },

                    items: _provL .map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ),

              );
            },
            validator: (val) {
              return val != '' ? null : 'Seleccione una provincia';
            },
          ),
          new FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  icon: const Icon(Icons.book),
                  labelText: 'Seleccione la carrera de su Interes (Prioridad)',
                  errorText: state.hasError ? state.errorText : null,
                ),
                isEmpty: _carrS== '',
                child: new DropdownButtonHideUnderline(
                  child: new DropdownButton<String>(
                    value: _carrS,
                    isDense: true,
                    hint: Text("Seleccione una opción"),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,

                    ),
                    onChanged: (String newValue) {

                      data.carrera1 = newValue;
                      _carrS = newValue;
                      state.didChange(newValue);

                    },
                    items: _carrL .map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
            validator: (val) {
              return val != '' ? null : 'Seleccione una carrera';
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CheckboxFormField(title: Text("Hola"),initialValue: viewVisible,action: viewVisible=true,),

            ],
          ),
          Visibility(

            visible: viewVisible,
            child:  new FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                    icon: const Icon(Icons.book),
                    labelText: 'Seleccione la carrera de su Interes (Prioridad)',
                    errorText: state.hasError ? state.errorText : null,
                  ),
                  isEmpty: _carrS1== '',
                  child: new DropdownButtonHideUnderline(
                    child: new DropdownButton<String>(
                      value: _carrS1,
                      isDense: true,
                      hint: Text("Seleccione una opción"),
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,

                      ),
                      onChanged: (String newValue) {

                        data.carrera2 = newValue;
                        _carrS1 = newValue;
                        state.didChange(newValue);

                      },
                      items: _carrL .map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
              validator: (val) {
                return val != '' ? null : 'Seleccione una carrera';
              },
            ),
          ),
        ],
      ),),


    // new Step(
    //     title: const Text('Fifth Step'),
    //     subtitle: const Text('Subtitle'),
    //     isActive: true,
    //     state: StepState.complete,
    //     content: const Text('Enjoy Step Fifth'))
  ];

  @override
  Widget build(BuildContext context) {

    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      Scaffold
          .of(context)
          .showSnackBar(new SnackBar(content: new Text(message)));
    }

    void _submitDetails() {
      final FormState formState = _formKey.currentState;

      if (!formState.validate()) {
        showSnackBarMessage('Por favor ingrese los datos solicitados');
      } else {
        formState.save();
        print("Name: ${data.name}");
        print("Phone: ${data.phone}");

        print("Age: ${data.carrera1}");
        _signUp(fullName: data.name,cellphone: data.phone,gender: data.gender,dni: data.dni,province: data.province,academic: data.school,carrera1: data.carrera1,carrera2: data.carrera2);
      }
    }

    return new Container(
        child: new Form(
          key: _formKey,
          child: new ListView(children: <Widget>[
            new Stepper(
              steps: steps,
              type: StepperType.vertical,
              currentStep: this.currStep,
              onStepContinue: () {
                setState(() {
                  if (currStep < steps.length - 1) {
                    currStep = currStep + 1;
                  } else {
                    currStep = 0;
                  }
                  // else {
                  // Scaffold
                  //     .of(context)
                  //     .showSnackBar(new SnackBar(content: new Text('$currStep')));

                  // if (currStep == 1) {
                  //   print('First Step');
                  //   print('object' + FocusScope.of(context).toStringDeep());
                  // }

                  // }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (currStep > 0) {
                    currStep = currStep - 1;
                  } else {
                    currStep = 0;
                  }
                });
              },
              onStepTapped: (step) {
                setState(() {
                  currStep = step;
                });
              },
            ),
            new RaisedButton(
              child: new Text(
                'Save details',
                style: new TextStyle(color: Colors.white),
              ),
              onPressed: _submitDetails,
              color: Colors.blue,
            ),
          ]),
        ));
  }
  void _signUp(
      {   String userID,
        String fullName,
        String cellphone,
        String dni,
        String gender,
        String province,
        String academic,
        String carrera1,
        String carrera2,
        context}) async {

    try {
      SystemChannels.textInput.invokeMethod('TextInput.hide');

      await AuthService.getCurrentFirebaseUser().then((FirebaseUser user) {
        AuthService.addUser(new User(
          userID: user.uid,
          email: user.email,
          fullName: fullName,
          cellphone: cellphone,
          dni: dni,
          gender: gender,
          province: province,
          academic: academic,
          carrera1: carrera1,
          carrera2: carrera2,
        ), context);
      });

    } catch (e) {
      print("Fallo el Registro: $e");

    }
  }



}