import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiban/HomePage/MyBook/MyBookModel.dart';
import 'package:jiban/HomePage/MyBook/MyBookModel.dart';
import 'package:jiban/HomePage/MyBook/Policy/policy.dart';
import 'package:jiban/HomePage/MyBook/myBook.dart';
import 'package:readmore/readmore.dart';

class vedant extends StatefulWidget {
  const vedant({ Key? key }) : super(key: key);

  @override
  _vedantState createState() => _vedantState();
}

class _vedantState extends State<vedant> {
  ScrollController _scrollController= ScrollController();
  MybookModel _mybookModel=MybookModel();
  @override
  Widget build(BuildContext context) {
      var size=MediaQuery.of(context).size;

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10,
      vertical: 15),
     //shrinkWrap: true,
      children: <Widget>[
     displayImageText(size),
     SizedBox(height: 10,),
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Text("संदेश लामिछाने", style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.black, fontSize: 12)),
     ),
     
    abouttheBookIndex(),
      abouttheBook(),
      ],
    
    );
 
     
}

  displayImageText(Size d) {

return Container(
  height: 200,
  child:   Row(
    mainAxisSize: MainAxisSize.min,
  
    children: <Widget>[
  
      Container(
        decoration: BoxDecoration(
                  boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.9),
        spreadRadius: 2,
        blurRadius: 6,
        offset: Offset(0, 5), // changes position of shadow
              )],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
         child: Container(
          height: 200,
            width: (d.width)*0.5 ,
            decoration: BoxDecoration(
        
              image: DecorationImage(
                
                fit: BoxFit.fill,
                image:  AssetImage("assets/cover.png"),

              )
            ),
          ),
        ),
      ),
    Expanded(
      child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 4,),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('सम्पूर्ण जीवन-शास्त्र', maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                       style:Theme.of(context).textTheme.headline1,),
                    ),
                     SizedBox(height: 10,),
                    Expanded(child: Text( 'जीवनका हरेक प्रश्नको सजिलो उत्तर', 
                     maxLines: 2, overflow: TextOverflow.ellipsis,
                      style:Theme.of(context).textTheme.bodyText2,
                      )),

                      SizedBox(height: 10,),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                               onSurface: Colors.red
                            ),
                            onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context){
                              return Policy();
                            })
                          );
                           
                          }, child: Text("पढ्नुहोस्")),
                        ),
                      )
                  ],
                ),
              ),
    )
  
    
  
    ],
  
  ),
);

  }

  abouttheBookIndex() {
   return ListView(
    //mainAxisSize: MainAxisSize.min,
   // crossAxisAlignment: CrossAxisAlignment.start,
 shrinkWrap: true,
     physics: ScrollPhysics(),

     children: <Widget>[
       SizedBox(height:15),
       Text("किताबको बारेमा", overflow: TextOverflow.fade, style: Theme.of(context).textTheme.headline2,),
       SizedBox(height: 10,),
           ReadMoreText(""" 
       यो जीवन के को लागी हो । जीवनमा केको लागी संघर्ष गर्नुपर्छ । जीवनको उधेश्य, पैसाको पछाडि भाग्नु हो ! या अरु नै हुन्छ । आफ्नै स्वार्थमा निहित हुनुपर्छ या परमार्थको लागी जीवन खापाउनुपर्छ । सत्काम र निस्काम मध्ये कुनलाई रोज्नुपर्छ । धर्म अथवा नियत कर्मको बाटो हिंडे कहाँ पुगिन्छ र अधर्मको बाटो कहाँ टुगिन्छ । कुकर्म गरे, के झेल्नुपर्छ अनि सत्कर्म गरे, के भोगिन्छ । ईश्वरको दिमाग हुन्छ या हुँदैन, यदि हुन्छ भने उनको धर्मशास्त्रमा विश्वास गर्न सकिन्छ कि सकिंदैन । हजारौं भक्तको पुकार ईश्वरले सुन्छन कि सुन्दैनन् । ब्राम्हण, छेत्री, वैश्य र शुद्र को हुन । भावनात्मक र वौद्धिक दिमाग के हो । के कुराले आफैलाई कमजोर बनाउछ र के कुराले आफैलाई मजबुत  बनाउछ । दुख कोस्लाई पर्छ । असल व्यक्तिको निधारमा दुख लेखिएको हुन्छ कि हुँदैन । जीवनमा सोचेको मात्र घट्छ या नसोचेको नि घट्न जान्छ । असल मानिस बन्नु, साधन हो या साध्य । कस्तो जीवन जिउनुपर्छ । जीवनको महत्वबोध बढाउन के गर्नुपर्छ । जीवनमा के गरेर मर्नुपर्छ । वैराग्यको भावबाट उत्पन्न यस्ता विचारहरुलाई केन्द्रविन्दुमा राखी, यो किताब लेखिएको छ । राम्रो मानिसलाई नि नराम्रो घट्दा, गरीब मानिसलाई नि रोगले सताउॅदा, जीवनको यथार्थलाई बुझ्ने कौतुहलता जो कोहिलाई नि जाग्न सक्छ । यस्तै प्रश्नहरुको उत्तरमा यो किताब समाहित छ । किताबको दोस्रो शिर्षक तमसोमा ज्योतिर्गमय बृहदआर्यनिका उपनिषद्बबाट लीईएको हो । यहि उपनिषद्को श्लोकलाई आदर्श मानी जीवनको अन्धकार मेटाउन, अनेकौं विचारहरु यस किताबमा प्रस्तुत गरिएका छन । मूलतः किताब पुरुष भाषामा भएतापनि यहाँ भनिएका विचारहरु सबैका लागी सरोवर छन । अन्तोत मेरो पछाडि रहि किताब लेख्नमा पिठ थप-थपाउनेहरुप्रति निकै आभारी छु । मेरो औंला समाती हिड्न सिकाउनेहरुको, सदैव ऋणी रहने छु । 
       
       पढ्दै जाँदा कहीँकतै कमी रहेको भए मलाई कोच्दै जानुहोला र पढ्दै जाँदा उपयोगी लागे, मलाई आशिर्वाद दिंदै जानुहोला । """,
           moreStyle: TextStyle(color: Colors.pink),
               lessStyle: TextStyle(color: Colors.pink),
               textAlign:TextAlign.justify,
           style: Theme.of(context).textTheme.bodyText1?.copyWith(
             
             color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300, wordSpacing: 1.3, letterSpacing: 1.3
           ),
             
           )


     ],
   );
  }

   abouttheBook() {
   return ListView(
   // mainAxisSize: MainAxisSize.min,
   // crossAxisAlignment: CrossAxisAlignment.start,
    shrinkWrap: true,
    physics: ScrollPhysics(),
     children: <Widget>[
       SizedBox(height:25),
       Text("अनुक्रमणिका", overflow: TextOverflow.fade, 
       style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.purple),),
       SizedBox(height: 10,),
           ListView.builder(
             shrinkWrap: true, physics: ScrollPhysics(),
             
             itemCount: _mybookModel.listofIndex.length,
             itemBuilder: (BuildContext context, int index){
               return  Row(
                 children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric( vertical:11.0),
                      child: Container(
                        width: 50,
                        child: Text((index+1).toString())),
                    ),
                    Flexible(child: Text(_mybookModel.listofIndex[index]),)
                 ],
               );
             }
             
             )


     ],
   );
  }

  
}