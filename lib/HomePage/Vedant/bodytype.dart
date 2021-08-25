 
 import 'package:flutter/material.dart';

 class bodyType extends StatefulWidget {
   const bodyType({ Key? key }) : super(key: key);
 
   @override
   _bodyTypeState createState() => _bodyTypeState();
 }
 
 class _bodyTypeState extends State<bodyType> {
   PageController pageController=PageController(
     initialPage: 1
   );
        bool selectedColor=false;
      List<List<int>> value=[];
  
 
   @override
   void dispose() { 
     pageController.dispose();
     super.dispose();
   }
   @override
   Widget build(BuildContext context) {

     return Scaffold(
       appBar: AppBar(),
       body: Stack(
         children:[ 
           PageView.builder(
               // physics: NeverScrollableScrollPhysics(),
             controller: pageController,
           itemCount: 10,
           itemBuilder: (BuildContext context, int index){
             return Column(
               children:List.generate(3, (index) {
                 return Card(
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: InkWell(
                       onTap: (){
                        selectedColor= !selectedColor;
                        print(selectedColor);
                        setState(() {
                          
                        });
                       },
                       child: Container(
                          color:  selectedColor==false? Colors.white:Colors.red,
                          height: 200,
                         child:  Text("Vaat")
                       ),
                     ),
                   ),
                 );
               })
             );
           }),
           Positioned( bottom: 0, left: 0, child:
           FloatingActionButton(
             heroTag: "sa",
             onPressed: (){},child: Text("Prev"),) ),

            Positioned( bottom: 0, right: 0, child:
           FloatingActionButton(onPressed: (){
   pageController.animateToPage(pageController.page!.toInt() + 1,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeIn
    );
           },child: Text("Next"),) )
         ]
       ),
     );
   }
 }

  