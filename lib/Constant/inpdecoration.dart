import 'package:flutter/material.dart';

class textInputdecoration{
 

static InputDecoration  getInputdecoration({
  required String hintText,
 required  BuildContext context, IconData? iconData}){
  
  return  InputDecoration(
      //   errorText:   isValidPhoneNumber(CurrentOnchangeValue.toString()),
         errorStyle: TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
          
           focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.green, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(width: 1.5, color: Colors.green),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(width: 1.5, color: Colors.blue),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(width: 1.5, color: Colors.green),
          ),
          contentPadding:
              const EdgeInsets.only(left: 18.0, bottom: 18.0, top: 19.0),
          filled: true,
          fillColor: Colors.green.withOpacity(0.1),
          labelText: hintText,
          labelStyle: TextStyle(
              color:  Theme.of(context).primaryColor,
              fontFamily: "RobotoMono",
              fontSize: 18.0));

}

}