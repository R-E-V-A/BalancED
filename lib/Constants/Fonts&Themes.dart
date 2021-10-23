import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle financeurText = GoogleFonts.mulish(color: Colors.black);
List<String>articleType = ["Basic", "Crypto"];
List<bool>typeSelected = [false,false];
List<String> searchString=[];
int currIndex=0;
TextStyle paraText = GoogleFonts.poppins(color: Colors.white);
String profileUsername;
String profilepic;
int changePage(int val)
{
  return val;
}
String profileEmail;
List<String>courseTitle = ["Budgeting 101","Side Hustle","Investment","Credit Card Management","Retirement 101"];
List<String>courseDesc = ["Learn to budget your expenses.","Bring your skills together & start your successful side hustle.","Bring your inner invester to life and learn to invest smart.","Bring your inner invester to life and learn to invest smart.","Bring your inner invester to life and learn to invest smart."];
List<Color>courseColor = [Color(0xff441dfc),Color(0xff06b782),Color(0xffdca419),Colors.black,Colors.pinkAccent];
