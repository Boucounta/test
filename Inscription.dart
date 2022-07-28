import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/MesPages/Donnees.dart';
import '../main.dart';
import 'BoutonParametre.dart';
import 'Couleurs.dart';
import 'HomePage.dart';
import 'LoginPage.dart';



class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);



  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  // FirebaseAuth _auth = FirebaseAuth.instance;
  // FirebaseUser currentUtil;
  ///CREATIONS DES VARIABLES
  String username = '';
  String email = '';
  String linenumber = '';
  String password = '';

  ///CREATIONS DES cles finaux
  final _formKey = GlobalKey <FormState>();
  // final CollectionReference collectionUtil = Firestore.instance.collection('utilisateurs');
  final linenumber_controller = TextEditingController();
  final email_controller = TextEditingController();
  final username_controller = TextEditingController();
  final mdp_controller = TextEditingController();

  bool _obscureText = true;
  bool validate = true;
  var isOffline = false;

  get jwt => null;
  @override
  Widget build(BuildContext context) {

   /* FirebaseAuth.instance.currentUser().then((FirebaseUser util){
      setState(() {
        this.currentUtil = util;
      });
    });*/
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
              width: _size / 9,
              height: _size / 9,
              margin: const EdgeInsets.only(
                top: 50, bottom: 6,),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    image: AssetImage('assets/images/logoN.png'),
                    fit: BoxFit.fill),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Container(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: username_controller,
                          style: TextStyle(fontFamily: Couleurs.Font),
                          cursorColor: Couleurs.apKColor,
                          decoration:  InputDecoration(
                            labelText: AppLocalizations.of(context)!.nom,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0,style: BorderStyle.solid),
                            ),
                          ),
                          onChanged: (val) {
                            username = val;
                            setState(() {});
                          },
                          validator: (String? val) {
                            if(val != null && val.isEmpty  ) {
                              return AppLocalizations.of(context)!.entrnom;
                            }
                            return null;
                          }

                      ),SizedBox(height: _size / 70,),
                      TextFormField(
                        controller: email_controller,
                          style: TextStyle(fontFamily: Couleurs.Font),
                          cursorColor: Couleurs.apKColor,
                          decoration:  InputDecoration(
                            labelText: AppLocalizations.of(context)!.email,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0,style: BorderStyle.solid),
                            ),
                          ),
                          onChanged: (val) {
                            email = val;
                            setState(() {});
                          },
                          validator: (String? val) {
                            if(val != null && val.isEmpty  ) {
                              return AppLocalizations.of(context)!.entremail;
                            }
                            return null;
                          }
                        // validator: (val) => val.isEmpty ?
                        // AppLocalizations.of(context)!.entremail : null,
                      ),SizedBox(height: _size / 70,),
                      TextFormField(
                        controller: linenumber_controller,
                          style: TextStyle(fontFamily: Couleurs.Font),
                          cursorColor: Couleurs.apKColor,
                          decoration:  InputDecoration(
                            labelText: AppLocalizations.of(context)!.phoneNumber,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0,style: BorderStyle.solid),
                            ),
                          ),
                          onChanged: (val) {
                            linenumber = val;
                            setState(() {});
                          },
                          validator: (String? val) {
                            if(val != null && val.isEmpty  ) {
                              return AppLocalizations.of(context)!.entrnum;
                            }else if (val != null && val.length < 9 ){
                              return AppLocalizations.of(context)!.entrnum;
                            }
                            return null;
                          }

                      ),SizedBox(height: _size / 70,),
                      TextFormField(
                          controller: mdp_controller,
                          style: TextStyle(fontFamily: Couleurs.Font),
                          cursorColor: Couleurs.apKColor,
                          decoration:  InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0,style: BorderStyle.solid),),
                            hintText: AppLocalizations.of(context)!.password,
                            suffixIcon: IconButton(
                                icon: _obscureText
                                    ? Icon(Icons.visibility_off, color: Couleurs.apKColor,)
                                    : Icon(Icons.visibility, color: Couleurs.apKColor,),
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
                            if(val != null && val.isEmpty  ) {
                              return AppLocalizations.of(context)!.entrmdp;
                            }else if (val != null && val.length < 6 ){
                              return AppLocalizations.of(context)!.entrmdp;
                            }
                            return null;
                          }

                      ),SizedBox(height: _size / 70,),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: MaterialButton(
                            onPressed: ()  {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage(),),
                              );
                             /* if(_formKey.currentState!.validate()){
                                var linenumber = num_controller.text;
                                var email = email_controller.text;
                                var password = mdp_controller.text;
                                var nom = nom_controller.text;
                                showAlertDialogProgrss(context);

                                var res = await attemptSignUp(nom, email, password, linenumber);
                                if(res == 201) {
                                  displayDialog(context, "Success", "The user was created.Log in now");
                                  storage.write(key: "jwt", value: jwt);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage.fromBase64(jwt),),
                                  );
                                }else if(res == 409){
                                  displayDialog(context, "The username is already registered", "Please try to sign up using another username or log in if you already");
                                }else{
                                  displayDialog(context, "error", "An  error occurred");
                                }
                              }*/

                            },

                            elevation: 5,
                            minWidth: MediaQuery.of(context).size.width / 2,
                            color: Colors.orange,
                            textColor: Colors.white,
                            child:  Text( AppLocalizations.of(context)!.insc,
                              style: TextStyle(fontSize: 22,fontFamily: 'Museo500'),
                            )
                        ),
                      ),SizedBox(height: 9,),
                      //Ajout du bouton de connexion

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: OutlineButton(
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Donnees(),));
                              /* var username = _usernameController.text;
                                   var password = _passwordController.text;
                                  var jwt = await attemptLogIn(username, password);
                                     if(jwt != null){
                                   storage.write(key:"jwt",value: jwt);*/

                              /*}  else{
                                displayDialog(context, "An error Occured", "Numéro de téléphone et / ou mot de passe incorrect(s).");
                                }*/
                            },
                            borderSide: BorderSide(width: 1.0,color: Colors.black26),

                            textColor: Colors.black54,
                            child:  Text( AppLocalizations.of(context)!.seconnct,
                              style: TextStyle(fontSize: 20,fontFamily: 'Museo500'),
                            )
                        ),
                      ),


                      SizedBox(
                        height: _size / 25,
                      ),
                      Center(
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
                        ]
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
  Future<int> attemptSignUp(String username,String email,String linenumber, String password) async{
    var res = await http.post(Uri.parse("$Couleurs.host"),
        body: {
          "username": username,
          "password": password,
          "email": email,
          "linenumber": linenumber
        }
    );
      return res.statusCode;
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
}
