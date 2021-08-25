import 'package:flutter/material.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jiban/Admin/ManageReads/allreads.dart';
 import 'package:jiban/FieldWidget/allextfield/alltextfield.dart';
import 'package:jiban/FieldWidget/titleTextfield/titleTextfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiban/HomePage/HighLight/highlightModel.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as datepicker;
import 'package:nepali_date_picker/nepali_date_picker.dart';



class EditReads extends StatefulWidget {
   String? selectedTitle;
   String?  selecteddescription;
   var selectedImage;
     int serialNo;
     String? uploadDatetime;

    EditReads({ Key? key,
  required  this.selectedTitle,
  required  this.selecteddescription,
  required  this.selectedImage,
   required   this.serialNo,
   required this.uploadDatetime
   }) : super(key: key);
     
  @override
  _EditReadsState createState() => _EditReadsState();
}

class _EditReadsState extends State<EditReads> {
 ImagePicker picker = ImagePicker();
 
late TextEditingController titleController;
late TextEditingController descriptionController;
late var imagefile;
late int serialNo;

  
 @override
 void initState() { 
   super.initState();
   titleController=TextEditingController(text: widget.selectedTitle);
   descriptionController=TextEditingController(text:widget.selecteddescription);
   serialNo=widget.serialNo;
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
               widget.selectedTitle=val;
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
               
              },
              customController: descriptionController,
            ),
 
 

            SizedBox(height: 20,),
            InkWell(
              onTap: ()async{
                 XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if(image!=null){
  
   setState(() {
    widget.selectedImage= File(image.path);
   });
  }
              },
              child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.red[200]),
                  child:  widget.selectedImage != null
                      ? Image.file(
                             widget.selectedImage,
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

         child: ElevatedButton.icon(
           onPressed: (){
            
        if(widget.selectedImage==null ){
          return;
        }else{
          //add to the 
          var highLightReadModel=   HighLightReadModel(
            uploadBy: "Sandesh Lamichhane",
            title:titleController.text.trim(),
            description: descriptionController.text.trim(),
            imageUrl: widget.selectedImage,
            shareText: descriptionController.text.trim(),
            isONpublic: false,
            uploadDatetime:  widget.uploadDatetime,
            serialNo:  widget.serialNo,

          );
        
          } 
           }
           ,
           icon:Icon(Icons.push_pin), 
          label: Text("save")),
       )
     )

          ],
          
        ),

    
      ),
    );
  }

  
  
}