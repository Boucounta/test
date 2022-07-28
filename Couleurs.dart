
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Couleurs{
 // static String host="http://localhost:3306";
  static final Color apKColor = Color(0xfff58a00);
  static final  Font = 'Museo500';



  static String formatNumber(String number){
    return number.substring(0,2)+" "+number.substring(2,5)+" "+number.substring(5,7)+" "+number.substring(7,9);
  }
}