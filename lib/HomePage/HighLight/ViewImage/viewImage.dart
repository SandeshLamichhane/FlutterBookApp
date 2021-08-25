import 'package:flutter/material.dart';

class viewDetailImage extends StatefulWidget {
    viewDetailImage({ Key? key, this.imageUrl }) : super(key: key);
   var imageUrl;
  @override
  _viewDetailImageState createState() => _viewDetailImageState();
}

class _viewDetailImageState extends State<viewDetailImage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:0.0),
                  child: Container(
                  child: Image.file(widget.imageUrl),
            ),
                ),
              ),
            Row(
              children: <Widget>[
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon:  Icon(Icons.arrow_back))
              ],
            ),
           
             
          ],
          ),
        
      ),
    );
  }
}