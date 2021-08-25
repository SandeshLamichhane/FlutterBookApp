import 'package:flutter/material.dart';
import 'package:jiban/Constant/loader.dart';
import 'package:jiban/Constant/varibaleConstant.dart';
import 'package:jiban/FieldWidget/allextfield/alltextfield.dart';
import 'package:jiban/FieldWidget/nameTextfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:jiban/FieldWidget/phoneTextfiel/phoneTextfield.dart';
import 'package:jiban/HomePage/MyBook/Adress/orderaddressController.dart';
import 'package:jiban/HomePage/MyBook/Adress/success.dart';


class OrderAddress extends StatefulWidget {
  const OrderAddress({ Key? key }) : super(key: key);

  @override
  _OrderAddressState createState() => _OrderAddressState();
}

class _OrderAddressState extends State<OrderAddress> {
  VariableConstant variableConstant= VariableConstant();
    OrderAddressController orcontroller= OrderAddressController();
  var _formKey=GlobalKey<FormState>();
  String? namevalidator;
  String? phoneNumberValidator;
  String? districtValidator;
  String? addressValidator;

  String? selectedName;
  String? selecteddistrictName;
  String? selectedphoneNo;
  String? selectedaddressName;

 
  @override
  void initState() { 
    super.initState();
 namevalidator=null;
 phoneNumberValidator=null;
 districtValidator=null;
 addressValidator=null;

 selectedName="";
 selecteddistrictName="";
 selectedphoneNo="";
 selectedaddressName="";
    
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("आफ्नो नाम ठेगाना राख्नुहोस") ,
        ),

        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(20),
            children:<Widget>[
               Text("कृपया हामीलाई आफ्नो ठेगाना बताउनुहोस, हामी तपाइको दैलोमा किताब ल्याइदिन्छौ | तपाइको  गोपनीयताको पूर्ण सम्मान गर्छौं | "),
             SizedBox(
               height: 20,
             ),
              nameTextfield(
                hintText: "कृपया आफ्नो  नाम  लेख्नुहोस",
                onValidator: (val){
                  return namevalidator;
                },
                  onChnageField: (val){
                     selectedName=val;
                  },
              ),
              SizedBox(height: 13,),
        
              phoneTextfield(
                hintText: "कृपया आफ्नो फोन न लेख्नुहोस",
                onValidator: (val){
                  return phoneNumberValidator;
                },
                onChnageField:(val){
                  selectedphoneNo=val;
                }
              )
              ,
              SizedBox(height: 13,),
                   Container(
                child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: DropdownSearch(
                                         
                                        showAsSuffixIcons: true,
                                        searchBoxStyle: TextStyle(color:Colors.black),
                                        dropdownSearchBaseStyle:TextStyle(color: Colors.red),
                                        onChanged: (value){
                                          selecteddistrictName=value as String;
                                           
                                        },
                                         
                                        showSearchBox: true,
                                        showClearButton: false,
                                        searchBoxDecoration: InputDecoration(
                                          hintText: "आफ्नो जिल्ला छान्नुहोस्"
                                        ),
                                         items: variableConstant.allNepalDistricts,
                                        hint: "आफ्नो जिल्ला छान्नुहोस्",
                                        
                                        dropDownButton: Icon(Icons.arrow_downward, color:Colors.black),
                                         dropdownSearchDecoration: InputDecoration(
                                            errorStyle: TextStyle(fontStyle: FontStyle.italic),
                                         errorBorder: OutlineInputBorder(///
   borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(width: 1.5, color: Colors.blue),                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            
                                          borderSide: BorderSide(width:1.5, color: Colors.green),
                                          ),

                                          prefixIcon: Icon(Icons.search, color:Colors.black),
                                            labelStyle: TextStyle(
                                            color:  Theme.of(context).primaryColor,
                                            fontFamily: "RobotoMono",
                                              fontSize: 18.0),
                                          labelText: "आफ्नो जिल्ला छान्नुहोस",
                                           
                                          hintStyle:TextStyle(color:  Theme.of(context).primaryColor),
                                          focusColor: Colors.red,
                                          border:  InputBorder.none,
                                         filled: true,
                                         fillColor: Colors.green.withOpacity(0.1)
                                        ),
                                        validator: (val){
                                          return districtValidator;
                                        },
                                      ),
                                    ) ),
             SizedBox(height: 10,),
        
             allTextfield(
               iconData:Icons.mark_chat_unread,
               hintText:'आफ्नो ठेगाना बताउनुहोस',
               onValidator: (val){
                 return addressValidator;
               },
               onChnageField:(val){
                 selectedaddressName=val;
               }
        
             ),
             //Enter 
           
        
            SizedBox(height: 15,),
            Text("तपाइको अर्डर प्रमाणित भएलगत्तै, दैलोमा किताब आउंछ"),
          SizedBox(height: 30,),
            ClipRRect(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                  namevalidator=    orcontroller.validateName(selectedName);
                   phoneNumberValidator= orcontroller.validatePhone(selectedphoneNo);
                   districtValidator= orcontroller.validateDistrict(selecteddistrictName);
                  addressValidator=  orcontroller.validateaddress(selectedaddressName);
                 if( _formKey.currentState!.validate()){
                 orcontroller.placeOrder(
                   selectedName,selectedphoneNo, selecteddistrictName, selectedaddressName,
                   context,
                   (){
                   //get to success page
                   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext contex){
                       return Success();
                   })); 
                   }
                   );
                 }
                  },
                   child: Text("अर्डर गर्नुहोस")),
              ),
            )
             
              
            ]
        
          ),
        ),
      ),
      
    );
  }
}