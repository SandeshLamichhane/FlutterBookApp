  import 'package:flutter/material.dart';
import 'package:jiban/HomePage/HomePage.dart';

class Success extends StatefulWidget {
  const Success({ Key? key }) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: (){
     Navigator.push(context, MaterialPageRoute(
       builder:  (BuildContext context){
         return HomePage();
       }));
        },
        child: Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_rounded,
                size: 50,
                 color: Colors.green,),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(19.0),
                    child: Text("सफलतापूर्ण तपाइको अर्डर सम्पन्न भयो", 
                    textAlign: TextAlign.justify,
                    style:TextStyle(fontSize: 20,
                    fontWeight: FontWeight.w800,
                     color:Colors.purple,
                     
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}