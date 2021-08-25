
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class  gunasoTextfield extends StatelessWidget {
  IconData iconData;
  String hintText;
  String fieldType; // email, phone,password,
   TextEditingController? customController;
  Function(String)? onChnageField;
  Function(String)? onValidator;
  bool focusNext;
  
  String CurrentOnchangeValue="";

    gunasoTextfield({ Key? key ,
 
    this.iconData = Icons.info_outline_rounded,
    this.fieldType = "phone",
    this.hintText="Enter ",
     this.customController,
    this.onChnageField,
    this.onValidator,
    required this.focusNext
  }): super(key: key);
 
 final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: customController,
    //  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]'))],
        textInputAction:TextInputAction.next ,
        
      //  maxLength: 6,
    validator: (value) {
     return  onValidator!(value as String); 
     },
      obscureText: false, // _obscuretext,
      onChanged: (value) {
        onChnageField!(value );
        CurrentOnchangeValue=value;
      },
        
        onEditingComplete: (){
                FocusScope.of(context).requestFocus(focus);
              },
      decoration: InputDecoration(
      //   errorText:   isValidPhoneNumber(CurrentOnchangeValue.toString()),
         errorStyle: TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
          prefixIcon: Icon(iconData, color:  Theme.of(context).shadowColor),
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
              const EdgeInsets.only(left: 25.0, bottom: 18.0, top: 19.0),
          filled: true,
          fillColor: Colors.green.withOpacity(0.1),
          labelText: hintText,
          labelStyle: TextStyle(
              color:  Theme.of(context).primaryColor,
              fontFamily: "RobotoMono",
              fontSize: 18.0)),
    );
  }
}