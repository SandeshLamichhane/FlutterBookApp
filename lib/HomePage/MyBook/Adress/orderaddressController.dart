import 'package:flutter/cupertino.dart';
import 'package:jiban/Constant/loader.dart';
import 'package:jiban/HomePage/MyBook/Adress/OrderAddressModel.dart';
import 'package:nepali_utils/nepali_utils.dart';


class OrderAddressController {
   
  
  validateName(String? name){
   if(name==null|| name==""){
     return "खालि";
   }
    return null;
  }

   validatePhone(String? name){
   if(name==null|| name==""){
     return "खालि";
   }
    return null;
  }

 validateDistrict(String? name){
   if(name==null|| name==""){
     return "खालि";
   }
    return null;
  }


 validateaddress(String? name){
   if(name==null|| name==""){
     return "खालि";
   }
    return null;
  }

  void placeOrder(
    String? selectedName, 
  String? selectedphoneNo, 
  String? selecteddistrictName, 
  String? selectedaddressName, 
    BuildContext context,
  Null Function() param4) {

    ////////////
    print(selectedName.toString()+selectedphoneNo.toString()+selecteddistrictName.toString()+
    selectedaddressName.toString());

    orderAddessModel modelx= orderAddessModel();
  
   //
   Loader.show(context: context);
   Future.delayed(Duration(seconds: 3));
 


orderAddessModel objectaddressModel= orderAddessModel(
  orderUserName: selectedName,
   orderAddress : selectedaddressName,
    orderDistrict: selecteddistrictName,
     orderPhoneNumber: selectedphoneNo,
     orderDate: DateTime.now().toNepaliDateTime().toString(),
     hasverified: false,
     respondby:"Admin",
     respondDate: "",
     bookdelivaryDate: "",
     );

    orderAddessModel.listofOrderAddress.add(objectaddressModel);
 Loader.hide(context: context);
 param4();
  }



}