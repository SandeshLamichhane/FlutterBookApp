import 'dart:io';

import 'package:flutter/material.dart';
 import 'package:jiban/Admin/ManageReads/allreads.dart';
 import 'package:jiban/FieldWidget/allextfield/alltextfield.dart';
import 'package:jiban/FieldWidget/titleTextfield/titleTextfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiban/HomePage/HighLight/highlightModel.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as datepicker;
import 'package:nepali_date_picker/nepali_date_picker.dart';



class ManageReads extends StatefulWidget {
  const ManageReads({ Key? key }) : super(key: key);

  @override
  _ManageReadsState createState() => _ManageReadsState();
}

class _ManageReadsState extends State<ManageReads> {
 ImagePicker picker = ImagePicker();
   var _image;
   String selectedDateTime="";
   String selectedtitle="";
   String selectedDescription="";
   
 @override
 void initState() { 
   super.initState();
   
 }
 TextEditingController titleController=TextEditingController();
  TextEditingController  descriptionController=TextEditingController();

 @override
 void dispose() { 
   titleController.dispose();
   descriptionController.dispose();
   super.dispose();
 }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("पुस्तकको पोस्ट राख्नुहोस"),
          actions: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                Allreads() ) 
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right:15.0),
                child: Icon(Icons.album_sharp),
              ),
            )
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            titleTextfield(
              hintText: "कृपया शिर्षक लेख्नुहोस",
              maxlines: 3,
              onChnageField: (val){
                selectedtitle=val;
              },
              customController: titleController,
            ),
                 SizedBox(
              height: 20,
            ),
         

           titleTextfield(
              hintText: "कृपया वर्णन गर्नुहोस",
              maxlines: 10,
              onChnageField:(val){
                selectedDescription=val;
              },
              customController:descriptionController
            ),
            
 SizedBox(height: 20,),
          
 InkWell(
   onTap: ()async{
     NepaliDateTime? _selectedDateTime = await datepicker.showMaterialDatePicker(
    context: context,
    initialDate: NepaliDateTime.now(),
    firstDate: NepaliDateTime(2000),
    lastDate: NepaliDateTime(2090),
    initialDatePickerMode: DatePickerMode.day,
);
 selectedDateTime= _selectedDateTime.toString();
 setState(() {
   
 });
  FocusScope.of(context).unfocus();
   },
   child: Container(
     child:Text( selectedDateTime==""? "Select date time":selectedDateTime.toString())
   ),
 ),


            SizedBox(height: 20,),
            InkWell(
              onTap: ()async{
                 XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if(image!=null){
  
   setState(() {
     _image= File(image.path);
   });
  }
              },
              child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.red[200]),
                  child: _image != null
                      ? Image.file(
                            _image,
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.fitHeight,
                          )
                      : Container(
                          decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1)),
                          width: 200,
                          height: 200,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.grey[800],
                          ),
                        ),
                ),
            ),
     
  SizedBox(
    height:30,
  ),

     ClipRRect(
       child:SizedBox(
         height: 60,

         child: ElevatedButton.icon(onPressed: ()async{
          //first of all insert the dat
      //  print(selectedtitle+ selectedDescription+ selectedDateTime+_image.toString());

     


        print(_image);
        if(_image==null || selectedDateTime==""){
          return;
        }else{
          //add to the 
          try{
          var highLightReadModel=   HighLightReadModel(
            uploadBy: "Sandesh Lamichhane",
            title: selectedtitle,
            description: selectedDescription,
            imageUrl: _image,
            shareText: selectedDescription,
            isONpublic: false,
            uploadDatetime: selectedDateTime,
            serialNo: DateTime.now().microsecondsSinceEpoch
          );
          HighLightReadModel.listofHighLightReadMode.add(
         highLightReadModel
          );
          

        //add also in the Hive database 



          print('+++'+HighLightReadModel.listofHighLightReadMode[0].serialNo.toString());
         // success
         //clear all data
         _image=null;
         titleController.clear();
         descriptionController.clear();
         selectedDateTime="";
         setState(() {
           
         });
        }catch(e){
          print(e.toString());
        }
        }




         }, icon:Icon(Icons.push_pin), label: Text("save")),
       )
     )

          ],
          
        ),

    
      ),
    );
  }

  
  
}

 