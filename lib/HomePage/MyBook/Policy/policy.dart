import 'package:flutter/material.dart';
import 'package:jiban/Constant/varibaleConstant.dart';
import 'package:jiban/HomePage/MyBook/Adress/OrderAddress.dart';

class Policy extends StatefulWidget {
  const Policy({ Key? key }) : super(key: key);

  @override
  _PolicyState createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  VariableConstant variableConstant=VariableConstant();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        appBar: AppBar(
        title:Text("सम्पूर्ण जीवन-शास्त्र")
        ),   
      body: Container(
          decoration: BoxDecoration(
                gradient: variableConstant.linearGradient
          ),
    
  


        child: ListView(
         children:[

           Padding(
             padding: const EdgeInsets.all(12.0),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(10.0),
               child: Container(
                 padding: EdgeInsets.all(16.0),
                 decoration: BoxDecoration(
                   gradient: variableConstant.linearGradient,
                 ),
                 height: 300,
                 child:Column(
                
                   children:<Widget>[
                     Padding(
                       padding: const EdgeInsets.only(top:12.0),
                       child: Text("सम्पूर्ण जीवन-शास्त्र किताब घरमै अडर गरेर पढ्नुहोस",
                       maxLines: 2,overflow: TextOverflow.ellipsis,
                       style: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.purple, fontSize: 19)
                       ),
                     ),
                     SizedBox(height: 8,),
                     Text("मूल्य रु :२५० ", style: Theme.of(context).textTheme.headline4?.copyWith(fontSize:28 ),),
                     SizedBox(height: 10,),
                     Text( "एक हातले किताब लिनुहोस्, अर्को हातले किताब दिनुहोस",
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                        color:Colors.indigo, fontSize: 13
                      )) ,
                      
                    SizedBox(height: 20,),
                    ClipRRect(
                      child: SizedBox(
                        height:50,
                        child: ElevatedButton.icon(
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                            return OrderAddress();
                            }));
                        },
                         icon: Icon(Icons.read_more), label: Text("घरमै अडर गर्नुहोस", style: TextStyle(fontSize: 18),)),
                      ),
                    )
             
                   ]
                 )
               ),
             ),
           ),

           SizedBox(height: 30,),

       Padding(
             padding: const EdgeInsets.all(12.0),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(10.0),
               child: Container(
                 padding: EdgeInsets.all(16.0),
                 decoration: BoxDecoration(
                   gradient: variableConstant.linearGradient1,
                 ),
                 height: 180,
                 child:Column(
                
                   children:<Widget>[
                     Padding(
                       padding: const EdgeInsets.only(top:12.0),
                       child: Text("१५ दिनसम्म निशुल्क अध्यन गर्नुहोस",
                       maxLines: 2,overflow: TextOverflow.ellipsis,
                       style: Theme.of(context).textTheme.headline1?.copyWith(color: Colors.purple, fontSize: 19)
                       ),
                     ),
                     SizedBox(height: 8,),
            
                      
                    SizedBox(height: 20,),
                    ClipRRect(
                      child: SizedBox(
                        height:50,
                        child: ElevatedButton.icon(
                          onPressed: (){
                        },
                         icon: Icon(Icons.book_online_outlined), label: Text("अगाडि बढ्नुहोस्", style: TextStyle(fontSize: 18),)),
                      ),
                    )
             
                   ]
                 )
               ),
             ),
           ),
           
         ]
        ),
      ),

      )
      
    );
  }
}