import 'dart:convert';
 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:epub_viewer/epub_viewer.dart';
import 'package:jiban/Admin/adminDashboard.dart';
import 'package:jiban/HomePage/HighLight/screens/home_screens.dart';
import 'package:jiban/HomePage/Vedant/bodytype.dart';
import 'package:jiban/reportProblem/reportProblem.dart';

class Setting extends StatefulWidget {
  const Setting({ Key? key }) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      children: <Widget>[
  
      ListTile(leading: Icon(Icons.checklist_rounded),
      title: Text("Admin"),
      onTap: (){
        //Get to admin
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
          return  adminDashboard();
        }));
      },
      ),
          ListTile(leading: Icon(Icons.checklist_rounded),
      title: Text("केहि समस्या"),
      onTap: (){
        //Get to admin
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
          return   ReportProblem();
        }));
      },
      ),
       ListTile(leading: Icon(Icons.checklist_rounded),
      title: Text("बोडी "),
      onTap: (){
        //Get to admin
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
          return    bodyType();
        }));
      },
      ),
        
        
      Center(
        child: ElevatedButton(onPressed: ()async{
     
      
    
       //  Directory appDocDir =
             //             await getApplicationDocumentsDirectory();
                   //   print('$appDocDir');
    
                     // String iosBookPath = '${appDocDir.path}/assets/book.epub';
                     
                      String androidBookPath = 'file:/// assets/book.epub';
                      EpubViewer.setConfig(
                          themeColor: Theme.of(context).primaryColor,
                          identifier: "iosBook",
                          scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
                          allowSharing: true,
                          enableTts: true,
                          nightMode: false);
    //                    EpubViewer.open(
    //                      Platform.isAndroid ? androidBookPath : iosBookPath,
    //                      lastLocation: EpubLocator.fromJson({
    //                        "bookId": "2239",
    //                        "href": "/OEBPS/ch06.xhtml",
    //                        "created": 1539934158390,
    //                        "locations": {
    //                          "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
    //                        }
    //                      }),
    //                    );
    
                      await EpubViewer.openAsset(
                        'assets/book.epub',
                        lastLocation: EpubLocator.fromJson({
                          "bookId": "2239",
                          "href": "/OEBPS/ch06.xhtml",
                          "created": 1539934158390,
                          "locations": {
                            "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
                          }
                        }),
                      );
                      // get current locator
                      EpubViewer.locatorStream.listen((locator) {
                        print(
                            'LOCATOR: ${EpubLocator.fromJson(jsonDecode(locator))}');
                      });
    
    
        }, child: Text("save"),     
      )
      ),
      ]
    );
  }

  void _dismissDialog() {
    
    Navigator.pop(context);
  
  }
}