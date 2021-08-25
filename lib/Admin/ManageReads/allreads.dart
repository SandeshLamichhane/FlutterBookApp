import 'package:flutter/material.dart';
import 'package:jiban/Admin/ManageReads/EditReads.dart';
import 'package:jiban/HomePage/HighLight/highlightModel.dart';
import 'package:readmore/readmore.dart';
import 'package:share/share.dart';

class Allreads extends StatefulWidget {
  const Allreads({ Key? key }) : super(key: key);

  @override
  _AllreadsState createState() => _AllreadsState();
}

class _AllreadsState extends State<Allreads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All reads"),
      ),
      body: ListView.builder(
                           
                       padding: const EdgeInsets.symmetric(horizontal:00,vertical:8.0),
                     //   controller: _scrollController,
                        itemCount: HighLightReadModel.listofHighLightReadMode.length,
                        itemBuilder: (BuildContext context, int index){
                          return Card(
                             elevation:2,
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height:30,
                                    ),
    
    
                               Row(
                                    children :<Widget>[
                                          Flexible(
                                            child: Text(HighLightReadModel.listofHighLightReadMode[index].title.toString(), 
                                            style: Theme.of(context).textTheme.headline1,
                                            
                                            ),
                                          )
                                        ]
                                                                              ),
                                                        
                                SizedBox(height: 12,),
                                  Row(
                                    children:<Widget>[
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage:  AssetImage("assets/my.png"),
                                      ),
                                      SizedBox(width: 5,),
                                      Text("संदेश लामिछाने", style: Theme.of(context).textTheme.headline5,),
                          
                                      Spacer(),
                                     Text(HighLightReadModel.listofHighLightReadMode[index].uploadDatetime.toString(), style: Theme.of(context).textTheme.headline5,)
                          
                                    ]
                               
                               ),
                              SizedBox(height: 30,),
                          
                        if( HighLightReadModel.listofHighLightReadMode[index].imageUrl!=null)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                              width: double.maxFinite,
                             height:250,
                              child:  Image.file(

                                HighLightReadModel.listofHighLightReadMode[index].imageUrl,
                                  width: 200.0,
                            height: 200.0,
                            fit: BoxFit.fitHeight,
                              )
                            ),
                            ),
                          
                          SizedBox(height: 20,),
                           ReadMoreText(
                             HighLightReadModel.listofHighLightReadMode[index].description.toString(),
                            delimiterStyle: TextStyle(color: Colors.red),
                           style:  Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight:FontWeight.w300),
                            trimLines: 2,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color:Colors.red),
                          ),
                          //YoutubePlayer(controller: controller),
                          
                           SizedBox(height:13),
                          
                           ClipRRect(
                            child:
                            InkWell(
                              onTap: (){
                           Share.share(HighLightReadModel.listofHighLightReadMode[index].description.toString(), subject:"subject");
                              },
                              child:Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment:  MainAxisAlignment.start, 
                              children: [
                                Icon(Icons.share, color: Theme.of(context).shadowColor,),
                                SizedBox(width: 15,),
                                Text("Share", style: Theme.of(context).textTheme.headline5?.copyWith(
                                   fontSize: 19
                                ),),
                              ],
                              )
                            )
                          
                           ),
                              
                          SizedBox(height: 17,),
                          Row(
                            children: [
                              ElevatedButton.icon(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                  return EditReads(
                                    uploadDatetime: HighLightReadModel.listofHighLightReadMode[index].uploadDatetime,
                                    selectedTitle: HighLightReadModel.listofHighLightReadMode[index].title,
                                    selecteddescription: HighLightReadModel.listofHighLightReadMode[index].description,
                                   selectedImage:HighLightReadModel.listofHighLightReadMode[index].imageUrl
                                   ,
                                   serialNo: int.parse( HighLightReadModel.listofHighLightReadMode[index].serialNo.toString())
                                  );
                                }));
                              },
                               icon: Icon(Icons.edit),
                                label: Text("edit")
                                ),
                                Spacer(),
                                 
                                 HighLightReadModel.listofHighLightReadMode[index].isONpublic?
                                  ElevatedButton.icon(onPressed: (){
                                        HighLightReadModel.listofHighLightReadMode[index].isONpublic=false;
                          setState(() {   });
                                  },
                               icon: Icon(Icons.edit),
                                label: Text("Go private")
                                ):
                                  ElevatedButton.icon(onPressed: (){
                                     HighLightReadModel.listofHighLightReadMode[index].isONpublic=true;
                                      setState(() {   });
                                  },
                               icon: Icon(Icons.edit),
                                label: Text("Go public")
                                ),
                                  Spacer(),
                                   ElevatedButton.icon(onPressed: (){
                      
              HighLightReadModel.listofHighLightReadMode.remove( HighLightReadModel.listofHighLightReadMode[index]);
             setState(() {
               
             });
                                   },
                               icon: Icon(Icons.edit),
                                label: Text("Delete")
                                ),

                            ],
                          )
                            
                                   ]
                                ),
                              ),
                            ),
                          );
                        }),
    );;
  }
}