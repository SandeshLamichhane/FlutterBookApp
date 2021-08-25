
 import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  Loader {
  @override
 static String text="कृपया पर्खनुहोस..."; 
  static bool  currentstatus=false;
 
  Loader.show({
    required BuildContext context,
    String text="कृपया पर्खनुहोस...", bool display=true})   {
   if(currentstatus==false && display==false){
  //no need to Get.back 
   return;
   }
    if(currentstatus==true && display==true){
     // no need to display
     return;
   }  
   currentstatus=display;
   if(display==false){
    Navigator.pop(context);
     return;
   }

     showDialog(
        barrierDismissible: false,
       context: context, builder: (BuildContext context){
       return
          Platform.isAndroid?  WillPopScope( 
      onWillPop: () async{  
     currentstatus=false;
     return true; }, 
      child: 
       LoadAlertDialog(text )):
      LoadAlertDialog(text);
       }

            
     );
 
 
  }

  Loader.hide({required BuildContext context, bool display=false}){
   if(currentstatus==false && display==false){
  //no need to Get.back 
   return;
   }
    if(currentstatus==true && display==true){
     // no need to display
     return;
   }  
   currentstatus=display;
   if(display==false){
    Navigator.pop(context);
     return;
   }

  }

  static LoadAlertDialog(String text) {
     return  
     AlertDialog(
          
          backgroundColor: Colors.white,
           content:
              Container(
                  height: 50,
                    child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Center(
                   child:     Container(
  
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         CircularProgressIndicator(),
                         Text(text, style: TextStyle(color: Colors.black, fontWeight:FontWeight.w800,),)
                       ],
                     ),)
                 
               ),)
             ),
  ); 
  }
 
}
 