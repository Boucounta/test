import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/MesPages/HomePage.dart';
import 'BoutonParametre.dart';
import 'Couleurs.dart';
import 'LoginPage.dart';

class Donnees extends StatefulWidget {
  const Donnees({Key? key}) : super(key: key);

  @override
  State<Donnees> createState() => _DonneesState();
}

class _DonneesState extends State<Donnees> {
  final _keyFormProgramDialog = GlobalKey<FormState>();

  var _currentIndex = 0;
  var pompeIot;
  var selectManual = false, selectAuto = false;
  var selectOnOFF = false;
  late String manuelButtonState;
  @override
  Widget build(BuildContext context) {

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

              if (_currentIndex == 0)
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Container pour presenter les données du panneaux

                        Container(
                          height: _height / 5.3,
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: _width / 3.2,
                                        margin: EdgeInsets.only(right: 5,top: 22),
                                        child: Column(
                                          children: [

                                            SizedBox(height: 15,),
                                            Icon(Icons.watch_later_outlined,
                                              color: Colors.black,
                                                size: _size/40,
                                            ),
                                            SizedBox(height: 10,),
                                            Text(
                                            "Consommation",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: _size / 70,
                                                    fontWeight:
                                                    FontWeight.bold),
                                                textAlign: TextAlign.center),
                                            SizedBox(height: 10,),
                                            Text(
                                                "Eau",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: _size / 70,
                                                    fontWeight:
                                                    FontWeight.bold),
                                                textAlign: TextAlign.center),

                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 40),
                                          height: 70,
                                          width: 1.0,
                                          child: const VerticalDivider(
                                            color: Colors.black,
                                            width: 5,
                                            thickness: 3,
                                            indent: 0,

                                          )),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: SizedBox(
                                            // height: _size/30,
                                            width: _width / 4.1,
                                            child: Column(
                                              children: [
                                                Text(
                                                    AppLocalizations.of(context)!
                                                        .today,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: _size / 70,
                                                        fontWeight: FontWeight.bold)
                                                ),
                                                SizedBox(height: 15,),
                                                Text(
                                                  "['dT']} min",
                                                  style: TextStyle(
                                                      fontSize: _size / 80,
                                                      color:
                                                      Couleurs.apKColor,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                SizedBox(height: 10,),
                                                Text("['aT']} h",
                                                    style: TextStyle(
                                                        color:
                                                        Couleurs.apKColor,
                                                        fontSize: _size / 80,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                    textAlign: TextAlign.right),
                                                SizedBox(height: 10,),
                                                Text("m³",
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
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 40),
                                          height: 70,
                                          width: 1.0,
                                          child: const VerticalDivider(
                                            color: Colors.black,
                                            width: 5,
                                            thickness: 3,
                                            indent: 0,

                                          )),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: SizedBox(
                                            // height: _size/30,
                                            width: _width / 4.1,
                                            child: Column(
                                              children: [
                                                Text(
                                                    AppLocalizations.of(context)!
                                                        .total,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: _size / 70,
                                                        fontWeight: FontWeight.bold)
                                                ),
                                                SizedBox(height: 15,),
                                                Text(
                                                  "['dT']} min",
                                                  style: TextStyle(
                                                      fontSize: _size / 80,
                                                      color:
                                                      Couleurs.apKColor,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                SizedBox(height: 10,),
                                                Text("['Kw']} h",
                                                    style: TextStyle(
                                                        color:
                                                        Couleurs.apKColor,
                                                        fontSize: _size / 80,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                    textAlign: TextAlign.right),
                                                SizedBox(height: 10,),
                                                Text("m³",
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
                          height: _height / 7.3,
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
                          height: _height / 7.3,
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
                          height: _height / 7.3,
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
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      Container(
                        height: _height / 7.3,
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

                      ///la quatrieme page Home(if == 0  control)

                    ],
                  ),
                )
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

          /// Button for data
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_customize),
              label: AppLocalizations.of(context)!.data),



          /// Button for informations
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: AppLocalizations.of(context)!.infos),
        ],
      ),
    );
  }
}

