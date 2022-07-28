import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/MesPages/Couleurs.dart';
import 'package:untitled/MesPages/Inscription.dart';

import 'LoginPage.dart';

class Demarage extends StatefulWidget {
  const Demarage({Key? key}) : super(key: key);

  @override
  State<Demarage> createState() => _DemarageState();
}

class _DemarageState extends State<Demarage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(null),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    var _size =
        MediaQuery.of(context).size.height + MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
        body: Stack(fit: StackFit.expand, children: <Widget>[
      Container(
        decoration: BoxDecoration(color: Couleurs.apKColor),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 110.0,
                    child: Image(
                      image: AssetImage("assets/images/Logo500.png"),
                      height: 160,
                      width: 160,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10.0)),
                ],
              )),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                      //height: _size/6
                      height: 80,
                      child: Text(
                        "Welcome to your Nadji.Bi\nSolar Services Center", // "Welcome to Solar platform"
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: _size / 52,
                            fontWeight: FontWeight.bold,
                            fontFamily: Couleurs.Font),
                        textAlign: TextAlign.center,
                      )),
                )
              ],
            ),
          ),
        ],
      )
    ]));
  }
}
