import 'package:jiban/Constant/nameConstant.dart';

class ReportProblemModel {
  late String title;
  late String description;
  late int datetime;
 late  String? byuserName;
  late String? byuserId;
  late String? byuseremail;
 late bool hasseenbyAdmin;
  ReportProblemModel({
  required this.title,
  required this.description,
 required this.datetime,
  this.byuserName,
  this.byuseremail,
  this.hasseenbyAdmin=false
  });

  Map<String, dynamic> toMap(ReportProblemModel reportProblemModel){
  Map<String, dynamic> mapData= Map();

  mapData[fieldtitle]=reportProblemModel.title;
  mapData[fielddescription]=reportProblemModel.description;
  mapData[fieldSerialDate]= DateTime.now().microsecondsSinceEpoch;
  mapData[fieldcurrentUserEmail] ="Sc0328y3@gmail.com";
  mapData[fieldcurrentUserName]="Unknown Lamichhane";
  mapData[fieldhasseenbyAdmin]=false;
  return mapData;

  }

  ReportProblemModel.fromMap(Map<String ,dynamic> mapData){
     title= mapData[fieldtitle]= title;
  description= mapData[fielddescription] ;
  datetime= mapData[fieldSerialDate] ;
  byuseremail=  mapData[fieldcurrentUserEmail]  ;
 byuserName= mapData[fieldcurrentUserName] ;
 hasseenbyAdmin=mapData[fieldhasseenbyAdmin] as bool;

  }

  static List<ReportProblemModel> listofproblem=[];
}