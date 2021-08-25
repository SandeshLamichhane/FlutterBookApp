import 'package:flutter/material.dart';
import 'package:jiban/Constant/inpdecoration.dart';
import 'package:jiban/FieldWidget/gunasoTextfield/gunasotextfield.dart';
import 'package:jiban/reportProblem/reportProblemModel.dart';

class ReportProblem extends StatefulWidget {
  const ReportProblem({Key? key}) : super(key: key);

  @override
  _ReportProblemState createState() => _ReportProblemState();
}

class _ReportProblemState extends State<ReportProblem> {
  var formKye = GlobalKey<FormState>();
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  textInputdecoration x = textInputdecoration();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("तपाइको सल्लाह सुझाव"),
        ),
        body: Form(
          key: formKye,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (val) {
                  if (val?.trim() == "" || val == null) {
                    return "शिर्षक राख्नुहोस";
                  }
                  return null;
                },
                focusNode: f1,
                decoration: textInputdecoration.getInputdecoration(
                    hintText: "शिर्षक  लेख्नुहोस", context: context),
                textInputAction: TextInputAction.next,

                onEditingComplete: () {
                  f1.unfocus();
                  FocusScope.of(context).requestFocus(f2);
                },
                controller: titleController,
                // focus to next
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: descriptionController,
                focusNode: f2,
                decoration: textInputdecoration.getInputdecoration(
                    hintText: "बृस्तित रुपमा वर्णन गर्नुहोस", context: context),
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                maxLines: 10,
                  validator: (val){
              if(val?.trim()=="" ||val==null){
                return "आफ्नो सल्लाह-सुझावलाइ वर्णन गर्नुहोस";
              }
              return null;
            },
                // Unfocus and hide keyboard
              ),
              SizedBox(
                height: 40,
              ),
              ClipRRect(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton.icon(
                      onPressed: () {
                       if(formKye.currentState!.validate()){
                   var x=       ReportProblemModel(
                            title: titleController.text.trim(),
                            description: descriptionController.text.trim(),
                            byuserName: "sandesh lamichhae",
                            byuseremail: "sckhdfshf @gmail.com",
                            datetime:DateTime.now().microsecondsSinceEpoch
    
                          );
                          ReportProblemModel.listofproblem.add(x);
                          titleController.clear();
                          descriptionController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Container(
                            child: Text("सल्लाह-सुझावको लागी धेरै धेरै धन्यवाद"),
                          )));



                       }
                      },
                      icon: Icon(Icons.savings),
                      label: Text("पठाउनुहोस")),
                ),
              )
            ],
          ),
        ));
  }
}
