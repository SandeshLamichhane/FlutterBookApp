import 'package:flutter/material.dart';
import 'package:jiban/HomePage/MyBook/Adress/OrderAddressModel.dart';

class ManageOrder extends StatefulWidget {
  const ManageOrder({ Key? key }) : super(key: key);

  @override
  _ManageOrderState createState() => _ManageOrderState();
}

class _ManageOrderState extends State<ManageOrder> {
  orderAddessModel obj=orderAddessModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:Text("आफ्नो अर्डर हेर्नुहोस")
        ),
        body:  orderAddessModel.listofOrderAddress.length>=1?
        ListView.builder(
    
          itemCount: orderAddessModel.listofOrderAddress.length,
          itemBuilder: (BuildContext context, int index){
          return 
          
          
          
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){},
                child: ListTile(
                  leading: Text((index+1).toString()),
                  title: Text(
                    orderAddessModel.listofOrderAddress[index].orderUserName.toString()+'('+
                         orderAddessModel.listofOrderAddress[index].orderPhoneNumber.toString()+')',
                         style: Theme.of(context).textTheme.headline2?.copyWith(
                           color:Colors.purple,
                           fontSize:18,
                           wordSpacing: 1.3,
                           letterSpacing:1.3
                         ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text( orderAddessModel.listofOrderAddress[index].orderAddress.toString(),
                        maxLines:2,
                        overflow: TextOverflow.clip,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                           wordSpacing: 1.3,
                             letterSpacing:1.3,
                             color: Colors.black
                        ),
                        
                        ),
                       
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text( orderAddessModel.listofOrderAddress[index].orderDate.toString(),
                          maxLines:2,
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color:Colors.grey,
                            fontStyle: FontStyle.italic,fontSize:12
                          )
                          ),
                        ),
           
              
                      ],
                    ),
                  ),
                  trailing:  
                   orderAddessModel.listofOrderAddress[index].hasverified ==false?
          
                   Icon(Icons.new_releases):
                   Icon(Icons.checkroom_outlined),
                   
                   )
              ),
            ),
          );
          }
        ) 
          
       
         
       :
        Container(
          child: Text("No data available"),
        )
    )
  
          
 
      
    );
  }
}