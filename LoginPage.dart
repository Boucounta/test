import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import 'Couleurs.dart';
import 'HomePage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Inscription.dart';

class LoginPage extends StatefulWidget {
  var message;
  LoginPage(this.message);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ///CREATIONS DES VARIABLES
  String username = '';
  String password = '';

  ///DECLARATIONS DES VARIABLES DANS LE BOUTON CONNEXION
  var dropdownValue = 'FRANCAIS';
  var locale;

  ///CREATIONS DES cles finaux
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final username_controller = TextEditingController();
  final motdp_controller = TextEditingController();

  var generatedPass;
  var myPass;
  var myUser;
  var myToken;
  var first = false;
  late Timer timer, timer1;
  //Varriables pour changer de langue sur l'interface de connexion
  /*List<dynamic> frenchWorld = [];
  List<dynamic> englishWorld = [];
  List<dynamic> wolofWorld = [];*/
  dynamic infosLanguage;
  var isOffline = false;
  // bool newuser;
  var mess;

  bool _obscureText = true;
  bool checkboxValue = false;

  Map<String, dynamic>? get payload => null;

  @override
  void initState() {
    super.initState();
    mess = widget.message;
    // getLanguage(context);
    timer1 = Timer.periodic(Duration(milliseconds: 200), (Timer t) {
      internetConnectivity();
    });
  }
  /*  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  } */

  @override
  void dispose() {
    timer1.cancel();
    super.dispose();
    username_controller.dispose();
    motdp_controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _size =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    bool checkboxValue = false;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: _size / 7,
              height: _size / 7,
              margin: const EdgeInsets.only(
                top: 65,
                bottom: 10,
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    image: AssetImage('assets/images/logoN.png'),
                    fit: BoxFit.fill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: username_controller,
                        style: TextStyle(fontFamily: Couleurs.Font),
                        cursorColor: Couleurs.apKColor,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.phoneNumber,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.0, style: BorderStyle.solid),
                          ),
                        ),
                        onChanged: (val) {
                          username = val;
                          setState(() {});
                        },
                        validator: (String? val) {
                          if (val != null && val.isEmpty) {
                            return AppLocalizations.of(context)!.entrnum;
                          }
                          return null;
                        }),
                    SizedBox(
                      height: _size / 30,
                    ),
                    TextFormField(
                        controller: motdp_controller,
                        style: TextStyle(fontFamily: Couleurs.Font),
                        cursorColor: Couleurs.apKColor,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.0, style: BorderStyle.solid),
                          ),
                          hintText: AppLocalizations.of(context)!.password,
                          suffixIcon: IconButton(
                              icon: _obscureText
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Couleurs.apKColor,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: Couleurs.apKColor,
                                    ),
                              //Methode pour rendre le mot de passe soit visible soit invisible
                              onPressed: () {
                                setState(() {
                                  if (_obscureText == true) {
                                    _obscureText = false;
                                  } else {
                                    _obscureText = true;
                                  }
                                });
                              }),
                        ),
                        onChanged: (val) {
                          password = val;
                          setState(() {});
                        },
                        validator: (String? val) {
                          if (val != null && val.isEmpty) {
                            return AppLocalizations.of(context)!.entrmdp;
                          } else if (val != null && val.length < 6) {
                            return AppLocalizations.of(context)!.entrmdp;
                          }
                          return null;
                        }),

                    //Ajout du Checkbox
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.remember,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: Couleurs.Font),
                        ),
                        Checkbox(
                          checkColor: Colors.black,
                          activeColor: Couleurs.apKColor,
                          value: checkboxValue,
                          onChanged: (bool? value) {
                            setState(() {
                              checkboxValue = value!;
                            });
                          },
                        ),
                      ],
                    ),

                    //Ajout du bouton de connexion
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              var username = username_controller.text;
                              var password = motdp_controller.text;

                                showAlertDialogProgrss(context);
                               /* if (checkboxValue) {
                                  storage.write(
                                      key: 'password',
                                      value: motdp_controller.text);
                                  storage.write(
                                      key: 'phone',
                                      value: username_controller.text);
                                } else {
                                  storage.write(key: 'password', value: null);
                                  storage.write(key: 'username', value: null);
                                }*/
                              }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage(),
                                  ),
                                );

                                displayDialog(context, "An error Occured",
                                    "Numéro de téléphone et / ou mot de passe incorrect(s).");
                              },
                          elevation: 5,
                          minWidth: MediaQuery.of(context).size.width / 2,
                          color: Colors.orange,
                          textColor: Colors.white,
                          child: Text(
                            AppLocalizations.of(context)!.login,
                            style: const TextStyle(
                                fontSize: 22, fontFamily: 'Museo500'),
                          )),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                          onPressed: () {},
                          colorBrightness: Brightness.light,
                          elevation: 0,
                          color: Colors.white,
                          child: Text(
                            AppLocalizations.of(context)!.forgetPassword,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: Couleurs.Font,
                                color: Couleurs.apKColor),
                          )),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: OutlineButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Inscription(),
                                ));
                          },
                          borderSide: const BorderSide(
                              width: 1.0, color: Colors.black26),
                          textColor: Colors.black54,
                          child: Text(
                            AppLocalizations.of(context)!.newins,
                            style: const TextStyle(
                                fontSize: 20, fontFamily: 'Museo500'),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: _size / 25,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(children: [
                    Text(
                      "Nadji.Bi SWP",
                      style: TextStyle(
                          fontSize: 15,
                          color: Couleurs.apKColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: Couleurs.Font),
                    ),
                    Text(
                      AppLocalizations.of(context)!.developerName,
                      style: TextStyle(
                          fontSize: 10,
                          color: Couleurs.apKColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: Couleurs.Font),
                    ),
                  ]),
                ),
                SizedBox(
                  width: _size / 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                        if (dropdownValue == 'Francais') {
                          locale.languageCode = Locale('fr');
                        } else if (dropdownValue == 'English') {
                          locale.languageCode = Locale('en');
                        }
                      });
                    },
                    items: <String>["FRANCAIS", "ENGLISH", "WOLOF"]
                        .map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            title,
            style: TextStyle(
              color: (title == 'Error' || title == 'Erreur')
                  ? Colors.red[900]
                  : Colors.green[800],
              fontWeight: FontWeight.bold,
              fontFamily: Couleurs.Font,
            ),
            textAlign: TextAlign.center,
          ),
          content: Text(text),
          actions: [
            FlatButton(
              child: const Text(
                "OK",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
  Future<String?> attemptLogIn(String username, String password) async {
    var res = await http.post(Uri.parse("$Couleurs.host"),
        body: {"username": username, "password": password});
    if (res.statusCode == 200) {
      return res.body;
    }
    return null;
  }
  /*Future getLanguage(context) async {
    await DefaultAssetBundle.of(context)
        .loadString("{lib/l10n/app_en.arb},{lib/l10n/app_fr.arb}")
        .then((result) {
      var mJson = json.decode(result);
      setState(() {
        frenchWorld = mJson['french'];
        englishWorld = mJson['english'];
        wolofWorld = mJson['wolof'];
      });
    });
    _checkSaveCredential();
  }
  /// check if crendential is save for the first time
  Future<Null> _checkSaveCredential() async {
    final all = await storage.readAll();
    setState(() {
      if (all['langue'] != null) {
        dropdownValue = all['locale']  !;
      }
      if (all['password'] != null && all['phone'] != null) {
        checkboxValue = true;
        this.numtel_controller.text = all['phone']!;
        this.motdp_controller.text = all['password']!;
      }
      if (dropdownValue == "FRANCAIS") {
        locale.languageCode =  Locale('fr');
      }
      if (dropdownValue == "ENGLISH") {
        locale.languageCode =  Locale('en');
      }
      if (dropdownValue == "WOLOF") {
        locale.languageCode =  Locale('sn');

      }
      if (all['myPass'] != null && all['myUser'] != null) {
        this.myPass = all['myPass'];
        this.myUser = all['myUser'];
        this.myToken = all['mytoken'];
      } else {
        this.first = true;
      }
    });
  }*/

  Future<Null> internetConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          this.isOffline = false;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        this.isOffline = true;
      });
    }
  }

  void showAlertDialogProgrss(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
            color: Colors.white,
            backgroundColor: Couleurs.apKColor,
          ),
          Container(
              margin: EdgeInsets.only(left: 5),
              child: const Text("Chargement ...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class SERVER_IP {}
