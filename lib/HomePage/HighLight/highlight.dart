 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiban/HomePage/HighLight/ViewImage/viewImage.dart';
import 'package:jiban/HomePage/HighLight/highLightController.dart';
import 'package:jiban/HomePage/HighLight/highlightModel.dart';
import 'package:jiban/HomePage/HighLight/screens/home_screens.dart';
import 'package:readmore/readmore.dart';
 import 'package:youtube_player_flutter/youtube_player_flutter.dart';
 import 'package:share/share.dart';


class HighLight extends StatefulWidget {
  const HighLight({ Key? key }) : super(key: key);

  @override
  _HighLightState createState() => _HighLightState();
}

class _HighLightState extends State<HighLight> {
  final ScrollController _scrollController= new ScrollController();
    final object=highlightController();

    late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    'nPt8bK2gbaU',
 
  ];

@override
  void initState() {
     super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.paused;
  }


 void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }
   @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }


 @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

 
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Material(
        color: Theme.of(context). scaffoldBackgroundColor,
        child: YoutubePlayerBuilder(
          onEnterFullScreen: (){
               
              object.MaximizeScreen();
              print(highlightController.isfullScreen);
          },
          onExitFullScreen: (){
            object.MaximizeScreen();
              print(highlightController.isfullScreen);
          },
             player: YoutubePlayer(
        controller: _controller,
    ), 
    builder: (context, player)=>
           Column(
                   mainAxisSize: MainAxisSize.min,
                   children: <Widget>[
                    SafeArea(
                      child:
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius. only(bottomLeft:Radius.circular(10.0), bottomRight: Radius.circular(15.0)),
                          child: Container(
                            height: 30.0,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(bottom: 6.0), //Same as `blurRadius` i guess
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Theme.of(context).scaffoldBackgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 1.0,  
        
                                ),
                              ],
                            ),
                            child: Text("सम्पूर्ण जीवन-शास्त्र", style: Theme.of(context).textTheme.bodyText2,),
                          ),
                        ),
                      ),
                    ),
               DefaultTabController(
                 length: 2, 
                 child: Flexible(
                   child: Column(
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Container(
                               child: TabBar(
                                 overlayColor:MaterialStateProperty.all(Colors.green.withOpacity(0.1)),
                                 unselectedLabelColor:  Theme.of(context).shadowColor,
                                 unselectedLabelStyle: Theme.of(context).textTheme.bodyText1,
                                 labelColor:  Theme.of(context).primaryColor,
                                 labelStyle: Theme.of(context).textTheme.bodyText2,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                 indicatorColor: Theme.of(context).primaryColor,
                                 tabs: [
                                 Tab(text: "पढ्नुहोस्", icon:Icon(CupertinoIcons.doc_text_fill)),
                                 Tab(text: "हेर्नुहोस",  icon:Icon(CupertinoIcons.eye)), 
                               ]),
                             ),
                                
                            
                          Flexible(
                            child: Container( 
                             //Add this to give height
                                                   
                                           
                              child: TabBarView(children: [
                            
                              createRead(),
                              HomeScreen() 
                        
                               
                             ])),
                          )
                        
                     ],
                 
                   ),
                 ))]
          ),
        ),
      ),
    );
  }

  createRead() {
       return ListView.builder(
                         
                     padding: const EdgeInsets.symmetric(horizontal:00,vertical:8.0),
                      controller: _scrollController,
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
                                   Text(HighLightReadModel.listofHighLightReadMode[index].uploadDatetime.toString(), 
                                   style: Theme.of(context).textTheme.headline5,)
                        
                                  ]
                             
                             ),
                            SizedBox(height: 30,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: InkWell(
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                        return    viewDetailImage(
                                  imageUrl:       HighLightReadModel.listofHighLightReadMode[index].imageUrl,
                           );
                                }));
                             
                              },
                              child: Container(
                                                       
                              child: 
                                  Image.file(
                                  HighLightReadModel.listofHighLightReadMode[index].imageUrl,
                                width: double.maxFinite,
                                fit: BoxFit.fill,
                                  ),
                                                        height:250,
                            
                              
                                                      ),
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
                            
                        SizedBox(height: 17,)
                          
                                 ]
                              ),
                            ),
                          ),
                        );
                      });
  }

////////////////////////////////////////////////////////////////////////create video
 

   

  
   
  }
 