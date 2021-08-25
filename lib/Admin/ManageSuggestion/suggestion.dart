import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiban/reportProblem/reportProblemModel.dart';

class suggestion extends StatefulWidget {
  const suggestion({ Key? key }) : super(key: key);

  @override
  _suggestionState createState() => _suggestionState();
}

class _suggestionState extends State<suggestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('सल्लाह सुझाव'),
      ),
      body: ListView.builder(itemCount: ReportProblemModel.listofproblem.length,

        itemBuilder:(BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(ReportProblemModel.listofproblem[index].title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:MainAxisAlignment.start,
                      children: <Widget>[
                    Text(ReportProblemModel.listofproblem[index].description),
                    SizedBox(height: 20,),
                    Text( DateTime.fromMicrosecondsSinceEpoch( ReportProblemModel.listofproblem[index].datetime).toString(),
                  overflow: TextOverflow.ellipsis,
                  ),
                   SizedBox(height: 20,),
                    Text( 
                      ReportProblemModel.listofproblem[index].byuseremail.toString(),
                  overflow: TextOverflow.ellipsis,maxLines: 2,
                  )
                      ]
                    
                    ),
                  trailing:
                  ReportProblemModel.listofproblem[index].hasseenbyAdmin?
                   IconButton(onPressed: (){
            
                  }, icon: Icon(CupertinoIcons.eye_fill)):
                       IconButton(onPressed: (){
            
                  }, icon: Icon(CupertinoIcons.eye_slash)),
             
                  leading:Icon(Icons.data_usage, size: 30,) ,
                ),
              ),
            ),
          );
          
        } ),
      
    );
  }
}