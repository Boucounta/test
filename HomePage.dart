import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/MesPages/BoutonParametre.dart';
import 'package:untitled/MesPages/Couleurs.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'LoginPage.dart';

class HomePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const HomePage({Key? key}) : super(key: key);



  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _keyFormProgramDialog = GlobalKey<FormState>();

  dynamic infosUser;
  var infosCustomer;
  //var infosCustomer;

  late List<dynamic> pumpFaultsData;
  var infosPompe;
  var data;
  var lastDate;
  var pompeIot;
  var commandState;
  var commandsend;
  var sendCommand;
  var faults;
  var end;
  var elecValue1;
  //Timer timer, timer1;
  var isOffline = false;
  var _currentIndex = 0;
  var selectManual = false, selectAuto = false;
  var selectOnOFF = false;
  var test = false;
  List<dynamic> nowFaultData = [];

  /// Declaration des variables pour la gestion des couleurs des different bouton lors d'un click
  var DataButtonColor,
      DefauaultButtonColor,
      ControlButtonColor,
      InfosButtonColor,
      FigureButtonColor;

   String? switchButtonState;
   String? manuelButtonState;

  /*@override
  void initState() {
    super.initState();
    loadData();

    Timer(Duration(seconds: 1), () {
      showAlertDialogProgrss(context);
    });

    */ /*timer1 = Timer.periodic(Duration(milliseconds: 50), (Timer t) {
      internetConnectivity();
    })*/ /*;
  }*/
  /*  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  } */

 /* @override *//*  *//*
  void dispose() {
    //timer1.cancel();
    super.dispose();
  }*/

  /// Declaration des variables pour la gestion des etats des boutons switch et mode
  /*String switchButtonState;
  String manuelButtonState;
*/
  @override
  Widget build(BuildContext context) {
    var isOffline = false;

    var _height = MediaQuery.of(context)
        .size
        .height; //+ MediaQuery.of(context).size.width;
    var _width = MediaQuery.of(context)
        .size
        .width; // + MediaQuery.of(context).size.width;
    var _size =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Couleurs.apKColor,
        title: Text(
          "Nadji.bi SWP",
          style: TextStyle(
              fontFamily: Couleurs.Font,
              fontSize: _size / 50,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                //clique du paramettre
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BoutParametre(),
                    ));
              },
              icon: Icon(
                Icons.settings,
                size: _size / 40,
                color: Colors.black,
              ))
        ],
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(
                              "Votre connexion est expirée. Veuillez-vous reconnecter."),
                        ));
                },
                icon:
                    Icon(Icons.refresh, size: _size / 40, color: Colors.black));
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
                      ///la premiere page du HOME (if=3 infos)
                      if (_currentIndex == 3)
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ///ADDRESS du proprietaite
                                Container(
                                  height: _height / 6.5,
                                  width: MediaQuery.of(context).size.width,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Couleurs.apKColor, width: 3.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Text(
                                                AppLocalizations.of(context)!
                                                    .address,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: _size / 65,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                  child: SizedBox(
                                                    child: Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .detailsPump,
                                                      style: TextStyle(
                                                          color:
                                                              Couleurs.apKColor,
                                                          fontSize: _size / 80,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                  child: SizedBox(
                                                    child: Text(
                                                            'username',
                                                        style: TextStyle(
                                                            color: Couleurs
                                                                .apKColor,
                                                            fontSize:
                                                                _size / 80,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textAlign:
                                                            TextAlign.right),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                ///L'identité du PROPRIETAIRE
                                Container(
                                  height: _height / 6.5,
                                  width: MediaQuery.of(context).size.width,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Couleurs.apKColor, width: 3.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .owner,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: _size / 65,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                  child: SizedBox(
                                                    child: Text(
                                                          'username',
                                                      style: TextStyle(
                                                          color:
                                                              Couleurs.apKColor,
                                                          fontSize: _size / 80,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                ///SAV
                                Container(
                                  height: _height / 6.5,
                                  width: MediaQuery.of(context).size.width,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Couleurs.apKColor, width: 3.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Text(
                                                AppLocalizations.of(context)!
                                                    .sav,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: _size / 65,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                  child: SizedBox(
                                                    child: Text(
                                                        "'user']['platform']",
                                                        style: TextStyle(
                                                            color: Couleurs
                                                                .apKColor,
                                                            fontSize:
                                                                _size / 80,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textAlign:
                                                            TextAlign.right),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0.0,
                                                          bottom: 8.0),
                                                  child: SizedBox(
                                                    child: InkWell(
                                                      child: Text("+221 ",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .lightBlue,
                                                              fontSize:
                                                                  _size / 80,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.right),
                                                      onTap: () {},
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                ///POMPE
                                Container(
                                  height: _height / 6.5,
                                  width:
                                      MediaQuery.of(context).size.width / 1.02,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Couleurs.apKColor, width: 3.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Text(
                                                AppLocalizations.of(context)!
                                                    .pump,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: _size / 65,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                  child: SizedBox(
                                                    // height: _size/30,
                                                    width: _width / 2.2,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .serialNumber,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    _size / 75,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            textAlign:
                                                                TextAlign.left),
                                                        Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .serialNumber,
                                                            style: TextStyle(
                                                                color: Couleurs
                                                                    .apKColor,
                                                                fontSize:
                                                                    _size / 80,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            textAlign: TextAlign
                                                                .right),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  height: _size / 30,
                                                  width: 1.0,
                                                  child: const VerticalDivider(
                                                    color: Colors.black,
                                                    width: 5,
                                                    thickness: 3,
                                                    indent: 0,
                                                    endIndent: 0,
                                                  )),
                                              Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                  child: SizedBox(
                                                    // height: _size/30,
                                                    width: _width / 2.2,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .availability,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    _size / 75,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            textAlign:
                                                                TextAlign.left),
                                                        // Text("${this.infosPompe['availability']}", style: TextStyle( /// à revoir dés que possible
                                                        //     color: GlobalVariable.appColor,
                                                        //     fontSize: _size/80,
                                                        //     fontWeight: FontWeight.bold),
                                                        //     textAlign: TextAlign.right),
                                                        Text("end",
                                                            style: TextStyle(
                                                                color: Couleurs
                                                                    .apKColor,
                                                                fontSize:
                                                                    _size / 80,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            textAlign: TextAlign
                                                                .right),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                ///DETAILS POMPE
                                Container(
                                  height: _height / 6.5,
                                  width: MediaQuery.of(context).size.width,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Couleurs.apKColor, width: 3.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Text(
                                                AppLocalizations.of(context)!
                                                    .detailsPump,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: _size / 65,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                  child: SizedBox(
                                                    // height: _size/30,
                                                    width: _width / 2.2,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .power,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    _size / 80,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            textAlign:
                                                                TextAlign.left),
                                                        Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .kwp,
                                                            style: TextStyle(
                                                                color: Couleurs
                                                                    .apKColor,
                                                                fontSize:
                                                                    _size / 80,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            textAlign: TextAlign
                                                                .right),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  height: _size / 30,
                                                  width: 1.0,
                                                  child: const VerticalDivider(
                                                    color: Colors.black,
                                                    width: 5,
                                                    thickness: 3,
                                                    indent: 0,
                                                    endIndent: 0,
                                                  )),
                                              Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                  child: SizedBox(
                                                    // height: _size/30,
                                                    width: _width / 2.2,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .voltage,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    _size / 80,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            textAlign:
                                                                TextAlign.left),
                                                        Text(
                                                            "equipmentVoltage']} V",
                                                            style: TextStyle(
                                                                color: Couleurs
                                                                    .apKColor,
                                                                fontSize:
                                                                    _size / 80,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            textAlign: TextAlign
                                                                .right),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                ///PANNEAUX SOLAIRE
                                Container(
                                  height: _height / 6.5,
                                  width: MediaQuery.of(context).size.width,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Couleurs.apKColor, width: 3.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Text(
                                                AppLocalizations.of(context)!
                                                    .detailsSolar,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: _size / 65,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: _width / 2.2,
                                                margin: EdgeInsets.only(top: 5),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .power,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize:
                                                                _size / 80,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        textAlign:
                                                            TextAlign.left),
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .kwp,
                                                      style: TextStyle(
                                                          color:
                                                              Couleurs.apKColor,
                                                          fontSize: _size / 80,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    //SizedBox(height: _height/130,),
                                                    // Text("${this.infosPompe['pvConfiguration']}", style: TextStyle(fontSize: _size/80,
                                                    //     color: GlobalVariable.appColor,
                                                    //     fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                  height: _size / 30,
                                                  width: 1.0,
                                                  child: const VerticalDivider(
                                                    color: Colors.black,
                                                    width: 5,
                                                    thickness: 3,
                                                    indent: 0,
                                                    endIndent: 0,
                                                  )),
                                              Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0,
                                                          bottom: 8.0),
                                                  child: SizedBox(
                                                    // height: _size/30,
                                                    width: _width / 2.2,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            AppLocalizations.of(
                                                                    context)!
                                                                .voltage,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    _size / 80,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            textAlign:
                                                                TextAlign.left),
                                                        Text("pvVoltage']} V",
                                                            style: TextStyle(
                                                                color: Couleurs
                                                                    .apKColor,
                                                                fontSize:
                                                                    _size / 80,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            textAlign: TextAlign
                                                                .right),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ///la deuxieme page du HOME (if=2  fauls)
                      if (_currentIndex == 2)
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                    child: this.nowFaultData.length == 0
                                        ? Container(
                                            margin: EdgeInsets.only(
                                                top: _height / 3),
                                            child: Center(
                                              child: Text(
                                                AppLocalizations.of(context)!
                                                    .noFault,
                                                style: const TextStyle(
                                                    color: Colors.black26,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        : ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: (this.nowFaultData == 0)
                                                ? 0
                                                : this.nowFaultData.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    3,
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  color: this.nowFaultData[
                                                                  index]
                                                              ['severity'] ==
                                                          "serious"
                                                      ? Colors.red
                                                      : Colors.yellow,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Faute" +
                                                            " ${this.nowFaultData[index]['errorCode'].toString().split(" ")[1]}",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize:
                                                                _size / 45,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                Couleurs.Font),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          "${this.nowFaultData[index]['fault']}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  _size / 45,
                                                              fontFamily:
                                                                  Couleurs
                                                                      .Font),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: _height / 30),
                                                      Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              height:
                                                                  _height / 13,
                                                              width: _width / 3,
                                                              color:
                                                                  Colors.white,
                                                              child:
                                                                  OutlineButton(
                                                                borderSide: BorderSide(
                                                                    width: 2.0,
                                                                    color: Couleurs
                                                                        .apKColor),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5.0),
                                                                ),
                                                                child: Text(
                                                                  "Causes",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          _size /
                                                                              54,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                                splashColor:
                                                                    Couleurs
                                                                        .apKColor,
                                                                onPressed:
                                                                    () {},
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  _width / 10,
                                                            ),
                                                            Container(
                                                              height:
                                                                  _height / 13,
                                                              width: _width / 3,
                                                              color:
                                                                  Colors.white,
                                                              child:
                                                                  OutlineButton(
                                                                      borderSide: BorderSide(
                                                                          width:
                                                                              2.0,
                                                                          color: Couleurs
                                                                              .apKColor),
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        "Solutions",
                                                                        style: TextStyle(
                                                                            fontSize: _size /
                                                                                54,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                      splashColor:
                                                                          Couleurs
                                                                              .apKColor,
                                                                      onPressed:
                                                                          () {}),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            })),
                              ],
                            ),
                          ),
                        ),

              /// la troisieme page Home (if==1 donnees)
              if (_currentIndex == 1)
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Container pour presenter les données du panneaux

                        Container(
                          height: _height / 6.3,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Couleurs.apKColor, width: 3.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                        AppLocalizations.of(context)!
                                            .operatingTime,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: _size / 70,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: _width / 2.2,
                                        margin: EdgeInsets.only(top: 5),
                                        child: Column(
                                          children: [
                                            Text(
                                                AppLocalizations.of(context)!
                                                    .today,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: _size / 75,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.left),
                                            SizedBox(
                                              //height: 38,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1.1 /
                                                  3,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "['dT']} min",
                                                    style: TextStyle(
                                                        fontSize: _size / 80,
                                                        color:
                                                            Couleurs.apKColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          height: _size / 25,
                                          width: 1.0,
                                          child: const VerticalDivider(
                                            color: Colors.black,
                                            width: 5,
                                            thickness: 3,
                                            indent: 0,
                                            endIndent: 0,
                                          )),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: SizedBox(
                                            // height: _size/30,
                                            width: _width / 2.2,
                                            child: Column(
                                              children: [
                                                Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .total,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: _size / 75,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.right),
                                                Text("['aT']} h",
                                                    style: TextStyle(
                                                        color:
                                                            Couleurs.apKColor,
                                                        fontSize: _size / 80,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.right),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          height: _height / 6.3,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Couleurs.apKColor, width: 3.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                        AppLocalizations.of(context)!.pumpPower,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: _size / 70,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: _width / 2.2,
                                        margin: EdgeInsets.only(top: 5),
                                        child: Column(
                                          children: [
                                            Text(
                                                AppLocalizations.of(context)!
                                                    .today,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: _size / 75,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.left),
                                            SizedBox(
                                              //height: 38,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1.1 /
                                                  3,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "['dE']} Kwh",
                                                    style: TextStyle(
                                                        fontSize: _size / 80,
                                                        color:
                                                            Couleurs.apKColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          height: _size / 25,
                                          width: 1.0,
                                          child: VerticalDivider(
                                            color: Colors.black,
                                            width: 5,
                                            thickness: 3,
                                            indent: 0,
                                            endIndent: 0,
                                          )),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: SizedBox(
                                            // height: _size/30,
                                            width: _width / 2.2,
                                            child: Column(
                                              children: [
                                                Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .total,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: _size / 75,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.right),
                                                Text(
                                                    "['cE']} Kwh",
                                                    style: TextStyle(
                                                        color:
                                                            Couleurs.apKColor,
                                                        fontSize: _size / 80,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.right),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      /// Deuxieme container pour les données de la batterie

                        Container(
                          height: _height / 6.3,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Couleurs.apKColor, width: 3.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                        AppLocalizations.of(context)!.pumpData,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: _size / 70,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: _width / 2.2,
                                        margin: EdgeInsets.only(top: 5),
                                        child: Column(
                                          children: [
                                            Text(
                                                AppLocalizations.of(context)!
                                                    .current,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: _size / 75,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.left),
                                            SizedBox(
                                              //height: 38,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  1.1 /
                                                  3,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "['L1']} A",
                                                    style: TextStyle(
                                                        fontSize: _size / 80,
                                                        color:
                                                            Couleurs.apKColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          height: _size / 25,
                                          width: 1.0,
                                          child: VerticalDivider(
                                            color: Colors.black,
                                            width: 5,
                                            thickness: 3,
                                            indent: 0,
                                            endIndent: 0,
                                          )),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: SizedBox(
                                            // height: _size/30,
                                            width: _width / 2.2,
                                            child: Column(
                                              children: [
                                                Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .frequency,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: _size / 75,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.right),
                                                Text("['F']} Hz",
                                                    style: TextStyle(
                                                        color:
                                                            Couleurs.apKColor,
                                                        fontSize: _size / 80,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.right),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      /// Troisiéme container pour les données du panneau

                        Container(
                          height: _height / 6.3,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Couleurs.apKColor, width: 3.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                        AppLocalizations.of(context)!.panelData,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: _size / 70,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: _width / 2.2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                  AppLocalizations.of(context)!
                                                      .voltage,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: _size / 80,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.left),
                                              Text("['pV']} V",
                                                  style: TextStyle(
                                                      color: Couleurs.apKColor,
                                                      fontSize: _size / 80,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.left)
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                          height: _size / 21,
                                          width: 1.0,
                                          child: const VerticalDivider(
                                            color: Colors.black,
                                            width: 5,
                                            thickness: 3,
                                            indent: 0,
                                            endIndent: 0,
                                          )),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: SizedBox(
                                            // height: _size/30,
                                            width: _width / 2.2,
                                            child: Column(
                                              children: [
                                                Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .current,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: _size / 80,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.right),
                                                Text("['pC']} A",
                                                    style: TextStyle(
                                                        color:
                                                            Couleurs.apKColor,
                                                        fontSize: _size / 80,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.right),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          height: _height / 6.3,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Couleurs.apKColor, width: 3.0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                        AppLocalizations.of(context)!
                                            .inverterTemperature,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: _size / 70,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: _width / 2.2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.wb_incandescent,
                                                color: Couleurs.apKColor,
                                                size: _size / 40,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                          height: _size / 21,
                                          width: 1.0,
                                          child: const VerticalDivider(
                                            color: Colors.black,
                                            width: 5,
                                            thickness: 3,
                                            indent: 0,
                                            endIndent: 0,
                                          )),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: SizedBox(
                                            // height: _size/30,
                                            width: _width / 2.2,
                                            child: Column(
                                              children: [
                                                Text("['T']} °C",
                                                    style: TextStyle(
                                                        color:
                                                            Couleurs.apKColor,
                                                        fontSize: _size / 80,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign:
                                                        TextAlign.center),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),


                    ],
                  ),
                ),
              ///la quatrieme page Home(if == 0  control)
              if (_currentIndex == 0)
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /// Display pompe state *******************************
                      Container(
                        height: _height / 4.5,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Couleurs.apKColor, width: 3.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              /// Reste du card
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: _width / 2.2,
                                    margin: EdgeInsets.only(top: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            AppLocalizations.of(
                                                context)!
                                                .state,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: _size / 50,
                                                fontWeight:
                                                FontWeight.bold)),
                                        Text(
                                          "$switchButtonState",
                                          style: TextStyle(
                                            color: this.selectOnOFF
                                                ? Colors.green[700]
                                                : Colors.red[700],
                                            fontSize: _size / 45,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      height: MediaQuery.of(context)
                                          .size
                                          .height /
                                          10,
                                      child: const VerticalDivider(
                                        color: Colors.black,
                                        width: 5,
                                        thickness: 3,
                                        indent: 0,
                                        endIndent: 0,
                                      )),
                                  Container(
                                    width: _width / 2.2,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            AppLocalizations.of(
                                                context)!
                                                .mode,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: _size / 50,
                                                fontWeight:
                                                FontWeight.bold)),
                                        Text(
                                          "$manuelButtonState",
                                          style: TextStyle(
                                            color: this.selectAuto
                                                ? Colors.green[700]
                                                : Colors.red[700],
                                            fontSize: _size / 45,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),

                      /// State command *************************************
                      Container(
                        height: _height / 4.5,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Couleurs.apKColor, width: 3.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              /// Icon du card
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text(
                                    AppLocalizations.of(context)!
                                        .commandState,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: _size / 60,
                                        fontWeight: FontWeight.bold)),
                              ),

                              /// Reste du card
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: _width / 2.2,
                                    margin: EdgeInsets.only(top: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: _height / 11,
                                          width: _width / 3.1,
                                          color: Colors.green[700],
                                          child: OutlineButton(
                                            borderSide:
                                            const BorderSide(
                                                width: 2.0,
                                                color:
                                                Colors.green),
                                            shape:
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  5.0),
                                            ),
                                            child: Text(
                                              AppLocalizations.of(
                                                  context)!
                                                  .btOn,
                                              style: TextStyle(
                                                  fontSize: _size / 60,
                                                  color: Colors.white),
                                            ),
                                            splashColor: Colors.white,
                                            onPressed: () async {
                                              /* if (this.isOffline) {
                                                            displayDialog(
                                                                context,
                                                                 "Erreur", "Pas de connexion internet.");
                                                          } else {
                                                            setState(() {
                                                              this.commandsend = "|377";
                                                              showAlertDialogProgrss(
                                                                  context);

                                                            });
                                                          }*/
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      height: MediaQuery.of(context)
                                          .size
                                          .height /
                                          10,
                                      child: const VerticalDivider(
                                        color: Colors.black,
                                        width: 5,
                                        thickness: 3,
                                        indent: 0,
                                        endIndent: 0,
                                      )),
                                  Container(
                                    width: _width / 2.2,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: _height / 11,
                                          width: _width / 3.1,
                                          color: Colors.red[700],
                                          child: OutlineButton(
                                            borderSide:
                                            const BorderSide(
                                                width: 2.0,
                                                color: Colors.red),
                                            shape:
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  5.0),
                                            ),
                                            child: Text(
                                              AppLocalizations.of(
                                                  context)!
                                                  .btOff,
                                              style: TextStyle(
                                                  fontSize: _size / 60,
                                                  color: Colors.white),
                                            ),
                                            splashColor: Colors.white,
                                            onPressed: () async {
                                              /* if (this.isOffline) {
                                                            displayDialog(
                                                                context,"Erreur",
                                                                "Pas de connexion internet.");
                                                          } else {
                                                            setState(() {
                                                              this.commandsend = "|277";
                                                              showAlertDialogProgrss(
                                                                  context);

                                                            });
                                                          }*/
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),

                      /// mode command *********************************
                      Container(
                        height: _height / 4.5,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Couleurs.apKColor, width: 3.0),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              /// Icon du card
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text(
                                    AppLocalizations.of(context)!
                                        .commandMode,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: _size / 60,
                                        fontWeight: FontWeight.bold)),
                              ),

                              /// Reste du card
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: _width / 2.2,
                                    margin: EdgeInsets.only(top: 5),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          color: Colors.green[700],
                                          height: _height / 11,
                                          width: _width / 3.1,
                                          child: OutlineButton(
                                              borderSide:
                                              const BorderSide(
                                                  width: 2.0,
                                                  color:
                                                  Colors.green),
                                              shape:
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(5.0),
                                              ),
                                              child: Text(
                                                AppLocalizations.of(
                                                    context)!
                                                    .auto,
                                                style: TextStyle(
                                                    fontSize:
                                                    _size / 60,
                                                    color:
                                                    Colors.white),
                                              ),
                                              splashColor: Colors.white,
                                              color: Couleurs.apKColor,
                                              //color: this.selectAuto ? GlobalData.appColor : Colors.white70,
                                              onPressed: () async {
                                                /*if (this.isOffline) {
                                                              displayDialog(
                                                                  context,
                                                                  "Erreur",
                                                                  "Pas de connexion internet.");
                                                            } else {
                                                              setState(() {
                                                                this.commandsend = "|770";
                                                                showAlertDialogProgrss(
                                                                    context);

                                                              });
                                                            }*/
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      height: MediaQuery.of(context)
                                          .size
                                          .height /
                                          10,
                                      child: const VerticalDivider(
                                        color: Colors.black,
                                        width: 5,
                                        thickness: 3,
                                        indent: 0,
                                        endIndent: 0,
                                      )),
                                  Container(
                                    width: _width / 2.2,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          color: Colors.red[700],
                                          height: _height / 11,
                                          width: _width / 3.1,
                                          child: OutlineButton(
                                            borderSide:
                                            const BorderSide(
                                                width: 2.0,
                                                color: Colors.red),
                                            shape:
                                            RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  5.0),
                                            ),
                                            child: Text(
                                              AppLocalizations.of(
                                                  context)!
                                                  .manual,
                                              style: TextStyle(
                                                  fontSize: _size / 60,
                                                  color: Colors.white),
                                            ),
                                            splashColor: Colors.white,
                                            color: Couleurs.apKColor,
                                            onPressed: () async {
                                              /*if (this.isOffline) {
                                                            displayDialog(
                                                                context,
                                                                 "Erreur",
                                                                 "Pas de connexion internet.");
                                                          } else {
                                                            setState(() {
                                                              this.commandsend = "|771";
                                                              showAlertDialogProgrss(
                                                                  context);
                                                            });
                                                          }*/
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white54,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          /// Button for control
          BottomNavigationBarItem(
              icon: const Icon(Icons.keyboard_command_key),
              label: AppLocalizations.of(context)!.control),

          /// Button for data
          BottomNavigationBarItem(
              icon: const Icon(Icons.dashboard_customize),
              label: AppLocalizations.of(context)!.data),

          /// Button for faults
          BottomNavigationBarItem(
              icon: const Icon(Icons.announcement_outlined),
              label: AppLocalizations.of(context)!.fault),

          /// Button for informations
          BottomNavigationBarItem(
              icon: const Icon(Icons.info),
              label: AppLocalizations.of(context)!.infos),

          /// Button for systeme
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: 'Systeme'),
        ],
      ),
    );
  }
}

class _showTextAlertDialog {}

/*Future<void> loadDevice() async {
  String url = Couleurs.host +
      "/user/getCustomerEquipment/${this.infosUser['username']}";
  await http.get(Uri.parse(url),
      headers: {'Authorization': "Bearer ${widget.jwt}"}).then((value) {
    if (value.statusCode == 200) {
      var listEquipment = json.decode(value.body);
      for (var equipment in listEquipment) {
        setState(() {
          if (equipment['equipmentType']['name'] == "Pompe") {
            this.infosPompe = equipment;
            print(infosPompe['address']);
          }
        });
      }
    }
  }).catchError((err) {
    print(err);
  });
  loadLastIotData();
}*/

/*Future<void> loadData() async {
  String url1 =
      Couleurs.host + "/user/getUser/${widget.payload['sub']}";
  await http.get(Uri.parse(url1),
      headers: {'Authorization': "Bearer ${widget.jwt}"}).then((resp) {
    setState(() {
      this.infosUser = json.decode(resp.body);
    });
  }).catchError((err) {
    print(err);
  });
  await loadDevice();
  //_checkSaveDailyData();
}*/

void displayDialog(context, title, text) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text(
            title,
            style: TextStyle(
                color: Couleurs.apKColor, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Text(
            text,
            textAlign: TextAlign.center,
          )),
    );

/*Future<void> loadLastIotData() async {
  String url1 = Couleurs.host +
      "/pumpClient/getData/${this.infosPompe['serialNumber']}";
  await http.get(Uri.parse(url1),
      headers: {'Authorization': "Bearer ${widget.jwt}"}).then((resp) {
    setState(() {
      this.data = json.decode(resp.body);
      var lastData = data;
      print(lastData);
      this.pompeIot =
          jsonDecode(lastData['data'].toString().replaceAll("\'", "\""));
      this.commandState = lastData['command'].toString().split("");
      initStatus();
      var fault1 = lastData['fault1'];
      var fault2 = lastData['fault2'];
      this.faults = fault1 + fault2;
      this.end = lastData['end'];
      getFaultData(context);
      if (!this.test) {
        this.test = true;
        Navigator.pop(context);
      }
    });
  }).catchError((err) {
    print(err);
  });
  //getUsers();
}*/

void showAlertDialogProgrss(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(
          color: Colors.white,
          backgroundColor: Couleurs.apKColor,
        ),
        Container(
            margin: EdgeInsets.only(left: 5), child: Text("Chargement ...")),
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

/*Future<bool> internetConnectivity() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      setState(() {
        this.isOffline = false;
      });
      return true;
    }
  } on SocketException catch (_) {
    setState(() {
      this.isOffline = true;
    });
    return false;
  }
  setState(() {
    this.isOffline = true;
  });
  return false;
}*/
/*Future getFaultData(context) async {
  var response = await DefaultAssetBundle.of(context)
      .loadString('assets/faultsData.json');
  var faultsData = json.decode(response);
  if (widget.infosLanguage != null &&
      widget.infosLanguage['error'] == "Error") {
    ///Ceci nous permet de verifier la langue choisie par l'utilisateur
    this.pumpFaultsData = faultsData['englishPumpFaults'];
  } else {
    this.pumpFaultsData = faultsData['frenchPumpFaults'];
  }
  addStatus();
}*/
/*initStatus() {
  setState(() {
    if (this.commandState[1] == "3") {
      this.switchButtonState = widget.infosLanguage != null
          ? widget.infosLanguage['on']
          : "Allumé";
      this.selectOnOFF = true;
    }
    if (this.commandState[1] == "2") {
      this.switchButtonState = widget.infosLanguage != null
          ? widget.infosLanguage['off']
          : "Éteint";
      this.selectOnOFF = false;
    }
    if (this.commandState[3] == "1") {
      this.manuelButtonState = widget.infosLanguage != null
          ? widget.infosLanguage['manual']
          : "Manuel";
      this.selectManual = true;
      this.selectAuto = false;
    }
    if (this.commandState[3] == "0") {
      this.manuelButtonState = widget.infosLanguage != null
          ? widget.infosLanguage['auto']
          : "Auto";
      this.selectAuto = true;
      this.selectManual = false;
    }
  });
}*/

/// Ajout de status de la fault
/*addStatus() {
  int i = 0;
  nowFaultData = [];
  for (var fault in this.pumpFaultsData) {
    fault['status'] = this.faults[i];
    if (this.faults[i] == "1") {
      setState(() {
        this.nowFaultData.add(fault);
      });
    }
    i = i + 1;
  }
}*/

/// Construction de la commande a envoyer
/*constructCmd() {
  var cmd = "";
  for (String l in this.commandState) {
    cmd = cmd + l;
  }
  setState(() {
    this.sendCommand = cmd;
  });
}*/
/*Future<void> changePompeCommand(BuildContext context) {
  String url = Couleurs.host +
      "/equipmentClient/changeCmd?sn=${this.infosPompe['serialNumber']}&cmd=${this.commandsend}";
  http.put(Uri.parse(url),
      headers: {'Authorization': "Bearer ${widget.jwt}"}).then((value) {
    if (value.statusCode == 200) {
      Timer(Duration(seconds: 15), () {
        //getAllDailyData(context);
        loadLastIotData();
        Navigator.pop(context);
      });
    } else {
      Navigator.pop(context);
      displayDialog(
          context,
          widget.infosLanguage != null
              ? widget.infosLanguage['errorLoginMessage']
              : "Erreur",
          widget.infosLanguage != null
              ? widget.infosLanguage['errorLoginMessage']
              : "Erreur");
    }
  }).catchError((err) {
    print(err);
  });
}*/
/*Future<void> getSomeDailyData(var date) async {
  String url = GlobalVariable.host +
      "/pompe/getLastDailyData/${this.infosPompe['serialNumber']}?date=$date";
  await http.get(Uri.parse(url),
      headers: {'Authorization': "Bearer ${widget.jwt}"}).then((value) {
    setState(() {
      var res = json.decode(value.body);
      var lastData = res[res.length - 1];
      this.lastDate = lastData['createdDate'];
      this.data = this.data + res;
      this.pompeIot =
          jsonDecode(lastData['data'].toString().replaceAll("\'", "\""));
      this.commandState = lastData['command'].toString().split("");
      initStatus();
      var fault1 = lastData['fault1'];
      var fault2 = lastData['fault2'];
      this.faults = fault1 + fault2;
      getFaultData(context);
      if (!this.test) {
        this.test = true;
        Navigator.pop(context);
      }
    });
    storage.write(key: 'dataPompe', value: json.encode(this.data));
  }).catchError((err) {
    print(err);
  });
}*/

/// Recuperation des donnees journaliere
/*Future<void> getAllDailyData(BuildContext context) async {
  String url = GlobalVariable.host +
      "/pompe/getDailyData/${this.infosPompe['serialNumber']}";
  await http.get(Uri.parse(url),
      headers: {'Authorization': "Bearer ${widget.jwt}"}).then((value) {
    setState(() {
      this.data = json.decode(value.body);
      var lastData = data[data.length - 1];
      this.lastDate = lastData['createdDate'];
      this.pompeIot =
          jsonDecode(lastData['data'].toString().replaceAll("\'", "\""));
      this.commandState = lastData['command'].toString().split("");
      initStatus();
      var fault1 = lastData['fault1'];
      var fault2 = lastData['fault2'];
      this.faults = fault1 + fault2;
      getFaultData(context);
      if (!this.test) {
        this.test = true;
        Navigator.pop(context);
      }
    });
    storage.write(key: 'dataPompe', value: json.encode(this.data));
  }).catchError((err) {
    print(err);
  });
}*/

/// check state data
/*Future<Null> _checkSaveDailyData() async {
  final all = await storage.readAll();
  var now = new DateTime.now().toString().split(" ")[0];
  if (all['dataPompe'] == null) {
    await getAllDailyData(context);
  } else {
    var res = json.decode(all['dataPompe']);
    setState(() {
      this.data = res;
    });
    if (res.isEmpty) {
      await getAllDailyData(context);
    } else if (now != res[0]['createdDate'].toString().split("T")[0]) {
      storage.write(key: 'dataPompe', value: null);
      await getAllDailyData(context);
    } else {
      var myLastDate = res[res.length - 1]['createdDate'];
      if (!this.isOffline) {
        await getSomeDailyData(myLastDate);
      }
    }
  }
}*/

//Ne pas effacer cette methode
Future<void> nothing() async {}

Color getColor(Set<MaterialState> states) {
  Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return Colors.white;
}

/*
void getUsers() async {
  String url = GlobalVariable.host + "/customers";
  await http.get(Uri.parse(url),
      headers: {'Authorization': "Bearer ${widget.jwt}"}).then((value) {
    setState(() {
      var results = json.decode(value.body);
      //print(result.length);
      print(results["_embedded"]);
    });
    storage.write(key: 'dataPompe', value: json.encode(this.data));
  }).catchError((err) {
    print(err);
  });
}
*/

String utf8convert(String text) {
  List<int> bytes = text.toString().codeUnits;
  return utf8.decode(bytes);
}

void setState(Null Function() param0) {}

class FontAwesomeIcons {}
