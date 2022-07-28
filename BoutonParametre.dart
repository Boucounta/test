import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/MesPages/Couleurs.dart';

import 'LoginPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class BoutParametre extends StatefulWidget {
  dynamic infosUser;


  @override
  State<BoutParametre> createState() => _BoutParametreState();
}

class _BoutParametreState extends State<BoutParametre> {

  final _keyForm = GlobalKey<FormState>();
  String lastPassword = '';
  String newpassword = '';
  String confPassword = '';

  /*Timer timer, timer1;
  bool isOffline = false;

  final storage = FlutterSecureStorage();*/
  @override
  Widget build(BuildContext context) {

    var _size = MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Couleurs.apKColor,
        elevation: 0,
        title: Text(AppLocalizations.of(context)!.parameter,
          style: TextStyle(fontSize: 15,fontFamily: Couleurs.Font,color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white,),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only()),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width*0.89,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.exit_to_app, color: Couleurs.apKColor,size: _size/40,),
                                title: Text(AppLocalizations.of(context)!.logout, style: TextStyle(fontSize: _size/70,color: Colors.black, fontWeight: FontWeight.bold)),
                                onTap: (){
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage(null)), (Route<dynamic> route) => false);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.edit, color: Couleurs.apKColor,size: _size/40,),
                                title: Text(AppLocalizations.of(context)!.btChangePassword, style: TextStyle(fontSize: _size/70,color: Colors.black, fontWeight: FontWeight.bold),),
                                onTap: (){
                                  _showAlertDialog(context);
                                },
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  ///Methode pour enregistrer le nouveau mot de passe
  Future<void> _showAlertDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              margin: EdgeInsets.only(bottom: 8.0),
              // width: (MediaQuery.of(context).size.width + MediaQuery.of(context).size.height)/4,
              // height: (MediaQuery.of(context).size.width + MediaQuery.of(context).size.height)/3.1,
              color: Colors.white,
              child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        // height: 70, //MediaQuery.of(context).size.height/9
                        // width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(bottom: 8.0),
                          decoration: BoxDecoration(
                              color: Couleurs.apKColor,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.zero, bottom: Radius.zero)),
                          child: Column(children: <Widget>[
                            ListTile(
                              title: Text(AppLocalizations.of(context)!.titledialogChangePassword,
                                style: TextStyle(fontSize: 25, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ])),
                      Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
                        child: Form(
                          key: _keyForm,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: AppLocalizations.of(context)!.lastPassword,
                                    border: OutlineInputBorder()),
                                obscureText: true,
                                cursorColor: Couleurs.apKColor,
                                /*validator: (val) => val.length < 4
                                    ? 'Entrer votre dernier mot de passe'
                                    : null,*/
                                onChanged: (val) => lastPassword = val,
                              ),

                              SizedBox(
                                  height:
                                  15.0), //cree l espace entre les deux champs de texte
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: AppLocalizations.of(context)!.newPassword,
                                    border: OutlineInputBorder()),
                                obscureText: true,
                                cursorColor: Couleurs.apKColor,
                                onChanged: (val) => newpassword = val,
                                validator: (val) => lastPassword.length < 4
                                    ? AppLocalizations.of(context)!.passwordLengthError
                                    : null,
                              ),

                              SizedBox(height: 15.0),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText:  AppLocalizations.of(context)!.confirmNewPassword,
                                    border: OutlineInputBorder()),
                                obscureText: true,
                                cursorColor: Couleurs.apKColor,
                                onChanged: (val) => confPassword = val,
                                validator: (val) => confPassword != newpassword
                                    ?  AppLocalizations.of(context)!.errorUseSamePassword
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.circular(5.0),
                          color: Couleurs.apKColor,
                          child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width / 2,
                              //padding: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 0.0),
                              child: Text(AppLocalizations.of(context)!.btSave,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () async {
                                }
                              ),
                        ),
                      )
                    ],
                  )),
            ),
          );
        });
  }
}
