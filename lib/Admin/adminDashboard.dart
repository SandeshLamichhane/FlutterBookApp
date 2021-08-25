import 'package:flutter/material.dart';
import 'package:jiban/Admin/ManageOrder/manageOrder.dart';
import 'package:jiban/Admin/ManageReads/ManageReads.dart';
import 'package:jiban/Admin/ManageSuggestion/suggestion.dart';

class adminDashboard extends StatefulWidget {
  const adminDashboard({ Key? key }) : super(key: key);

  @override
  _adminDashboardState createState() => _adminDashboardState();
}

class _adminDashboardState extends State<adminDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:   GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
        Center(
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageOrder()));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                [
                   Icon((Icons.iso_sharp)),
                   const Text("अर्डर हेर्नुहोस")
                ]
                   ),
                color: Colors.teal[100],
              ),
            ),
          ),
        ),
         Center(
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageReads()));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                [
                   Icon((Icons.outbox_rounded)),
                   const Text("पोस्ट राख्नुहोस")
                ]
                   ),
                color: Colors.teal[100],
              ),
            ),
          ),
        ),

          Center(
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>suggestion()));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                [
                   Icon((Icons.description_outlined)),
                   const Text("सल्लाह-सुझाव")
                ]
                   ),
                color: Colors.teal[100],
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Sound of screams but the'),
          color: Colors.teal[300],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Who scream'),
          color: Colors.teal[400],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Revolution is coming...'),
          color: Colors.teal[500],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Revolution, they...'),
          color: Colors.teal[600],
        ),
        ],
      ),
      ),
    );
  }
}