import 'package:flutter/material.dart';
import 'package:jiban/FieldWidget/titleTextfield/titleTextfield.dart';

class AddNewVideo extends StatefulWidget {
  const AddNewVideo({ Key? key }) : super(key: key);

  @override
  _AddNewVideoState createState() => _AddNewVideoState();
}

class _AddNewVideoState extends State<AddNewVideo> {
TextEditingController titleController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("भिडियो म्यानेज गर्नुहोस"),
          actions: [
            IconButton(onPressed: (){}, icon:  Icon(Icons.all_inbox_sharp))
          ],
        ),
        body: ListView(
          children: <Widget>[
           titleTextfield(
              hintText: "कृपया शिर्षक लेख्नुहोस",
              maxlines: 3,
              onChnageField: (val){
             //   selectedtitle=val;
              },
              customController: titleController,
            ),

            
          ],
        ),
        
      ),
    );
  }
}