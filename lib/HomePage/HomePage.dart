import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiban/Constant/varibaleConstant.dart';
import 'package:jiban/HomePage/HighLight/highLightController.dart';
import 'package:jiban/HomePage/HighLight/highlight.dart';
import 'package:jiban/HomePage/MyBook/myBook.dart';
import 'package:jiban/HomePage/Setting/setting.dart';
import 'package:jiban/HomePage/Vedant/vedanta.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
VariableConstant vd= VariableConstant();
 
 int currentBottomIndex=0;
  @override
  Widget build(BuildContext context) {
      return SafeArea(
      child:  OrientationBuilder(builder: 
        (BuildContext context, Orientation orientation) {
      
        return  
        Scaffold(
           body: currentBottomIndex==0?
                 HighLight() :
                 currentBottomIndex==1?
                 vedant():
                 currentBottomIndex==2?
                 MyBook():
                 currentBottomIndex==3?
                 Setting():
                  HighLight(),
      
      
          bottomNavigationBar:orientation == Orientation.landscape?null:
          
          BottomNavigationBar (
            onTap: (index){
            setState(() {    currentBottomIndex=index; });
            },
            currentIndex:currentBottomIndex ,
           
      
            unselectedFontSize: 15,
            unselectedIconTheme: IconThemeData(color: Theme.of(context).shadowColor, size: 25),
            unselectedItemColor:  Theme.of(context).shadowColor,
            selectedFontSize: 20,
            selectedIconTheme: IconThemeData(color: Theme.of(context).primaryColor, size: 25),
            selectedItemColor:  Theme.of(context).primaryColor,
             selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
             items:  <BottomNavigationBarItem>[
        BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
          label: """घर""",
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.circle_grid_hex_fill),
          label: """वेदान्त""",
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.book_circle),
          label: """मेरो किताब """,
        ),
          BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.ellipsis_circle),
          label: """अन्य""",
        )
             ]));
        }
      )
      
    );
  }
}