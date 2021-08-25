import 'dart:async';

import 'package:flutter/material.dart';

class highlightController {
  static  bool isfullScreen=false;
  StreamController<double> controller = StreamController<double>();
     MaximizeScreen(){
      isfullScreen=true;
       Stream stream = controller.stream;

     }
     MinimizeScreen(){
       isfullScreen=false;
     }
     
  
}