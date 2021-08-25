import 'package:jiban/Constant/nameConstant.dart';

class HighLightReadModel{
String? uploadDatetime;
String? title;
String? description;
var imageUrl;
String? shareText;
String ? uploadBy;
int ? serialNo;
bool isONpublic =false;


HighLightReadModel({
  this.uploadDatetime,this.title, 
  this.description, this.imageUrl, this.shareText, this.uploadBy, required  this.isONpublic,
   this.serialNo

});

Map<String, dynamic> toMap (HighLightReadModel highLightReadModel){

Map<String, dynamic> mapData= Map();
mapData[fieldtitle]=highLightReadModel.title;
mapData[fielddescription]=highLightReadModel.description;
mapData[fieldiamgeUrl]=highLightReadModel.imageUrl;
mapData[fieldUploadtime]=highLightReadModel.uploadDatetime;
mapData[fieldSerialDate]=highLightReadModel.serialNo;
mapData[fieldisOnPublic]=highLightReadModel.isONpublic;

  return mapData;
}

HighLightReadModel.toMap(Map<String, dynamic> mapData ){
 title= mapData[fieldtitle];
description=mapData[fielddescription];
imageUrl=mapData[fieldiamgeUrl];
uploadDatetime=mapData[fieldUploadtime];
serialNo=mapData[fieldSerialDate];
isONpublic=mapData[fieldisOnPublic];
}

static List<HighLightReadModel> listofHighLightReadMode=[];
}

class HighLightVideoModel{
String? uploadDatetime;
String? title;
var videoUrl;
String ? uploadBy;
int ? serialNo;
bool isONpublic =false;


HighLightVideoModel({
  this.uploadDatetime,this.title, 
  this.videoUrl,  this.uploadBy, required  this.isONpublic,
   this.serialNo

});

Map<String, dynamic> toMap (HighLightVideoModel highLightVideoModel){

Map<String, dynamic> mapData= Map();
mapData[fieldtitle]=highLightVideoModel.title;
mapData[fieldVideoUrl]=highLightVideoModel.videoUrl;
mapData[fieldUploadtime]=highLightVideoModel.uploadDatetime;
mapData[fieldSerialDate]=highLightVideoModel.serialNo;
mapData[fieldisOnPublic]=highLightVideoModel.isONpublic;
 return mapData;
}

HighLightVideoModel.toMap(Map<String, dynamic> mapData ){
 title= mapData[fieldtitle];
 videoUrl=mapData[fieldVideoUrl];
uploadDatetime=mapData[fieldUploadtime];
serialNo=mapData[fieldSerialDate];
isONpublic=mapData[fieldisOnPublic];
}

static List<HighLightVideoModel> listofHighLightVideoModel=[
//x3CnlZ2BnAw
  HighLightVideoModel(
    isONpublic: false,
    uploadDatetime: "2076/2/1",
    title: "Tero baauko taauko",
    videoUrl: "9Y_MLsvbX4o",
    uploadBy: "Sandesh",
  serialNo: DateTime.now().microsecondsSinceEpoch
    ),
      HighLightVideoModel(
    isONpublic: false,
    uploadDatetime: "2076/2/1",
    title: "Tero baauko taauko",
    videoUrl: "x3CnlZ2BnAw",
    uploadBy: "Sandesh",
  serialNo: DateTime.now().microsecondsSinceEpoch
    )
];
}