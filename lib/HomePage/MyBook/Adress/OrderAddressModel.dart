import 'package:jiban/Constant/nameConstant.dart';
import 'package:jiban/HomePage/MyBook/Adress/OrderAddress.dart';

class orderAddessModel{
  String?  orderUserName;
String ? orderAddress ;
String ?  orderDistrict;
String ? orderPhoneNumber;

String ? orderDate; 
bool? hasverified;
String ? respondby;
String? respondDate;
String ? bookdelivaryDate;

orderAddessModel({
 // required  
  this.orderUserName,
   
   this.orderAddress ,
  this.orderDistrict,
   this.orderPhoneNumber,
 this.orderDate,
  this.hasverified,
 this.respondby,
 this.respondDate,
 this.bookdelivaryDate
});
 
Map<String, dynamic> toMap(orderAddessModel md){
  Map<String, dynamic> mapData= Map();
    mapData[fieldorderUserName]=md.orderUserName;
    mapData[fieldorderUseraddress]=md.orderAddress;
    mapData[fieldorderPhoneNumber]=md.orderPhoneNumber;
    mapData[fieldorderDistrictfrom]=md.orderDistrict;
    mapData[fieldorderPhoneNumber]=md.orderPhoneNumber;
    mapData[fieldorderDate]=md.orderDate;
    mapData[fieldorderhasverified]=md.hasverified;
    mapData[fieldorderrespondby]=md.respondby;
    mapData[fieldorderdelivaryDate]=md.bookdelivaryDate;
    mapData[fieldrespondDate]=md.respondDate;
  
 return  mapData;
}

   orderAddessModel.fromMap(Map<String , dynamic> mapData){
 
   orderUserName= mapData[fieldorderUserName];
  orderAddress=  mapData[fieldorderUseraddress];
    orderPhoneNumber=mapData[fieldorderPhoneNumber];
   orderDistrict= mapData[fieldorderDistrictfrom];
   orderPhoneNumber= mapData[fieldorderPhoneNumber];
  orderDate=  mapData[fieldorderDate];
     hasverified= mapData[fieldorderhasverified] as bool;
   respondby= mapData[fieldorderrespondby];
    bookdelivaryDate=mapData[fieldorderdelivaryDate];
   respondDate= mapData[fieldrespondDate];
   
}
 static List <orderAddessModel> listofOrderAddress=[];
 
}
