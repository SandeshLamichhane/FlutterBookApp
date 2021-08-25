import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jiban/HomePage/HighLight/models/channel_model.dart';
import 'package:jiban/HomePage/HighLight/models/video_models.dart';
import 'package:jiban/HomePage/HighLight/screens/video_screens.dart';
import 'package:jiban/HomePage/HighLight/services/api_services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

 

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    Channel? _channel;
  bool _isLoading = false;
 bool _hasInternet=false;
   final Connectivity _connectivity = Connectivity();
   late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
  checkInternet();
  super.initState();
     _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((val){
          print("Listening to internet");
         if(val==ConnectivityResult.none){
              _hasInternet=false;setState(() {
              
              });
         }else{
           _hasInternet=true;
           setState(() {
                
              });

         }
          
        });

  }
   @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCIQH5kMBCvkuZM2lceGC8FA',
         onsuccess: (chn){
              setState(() {
      _channel = chn;
    });
         }
        );
 
  }

  _buildProfileInfo() {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
           // backgroundImage: NetworkImage?(_channel?.profilePictureUrl),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _channel!.title.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${_channel!.subscriberCount} subscribers',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(id: video.id.toString()),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        height: 140.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(video.thumbnailUrl.toString()),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel!.uploadPlaylistId.toString());
     List<Video> allVideos = _channel!.videos!..addAll(moreVideos);
    setState(() {
      _channel!.videos = allVideos;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return// Scaffold(
     // appBar: AppBar(
     //   title: Text('YouTube Channel'),
     // ),
      //body: 
      
      !_hasInternet?
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wifi_calling, size:45),
                Text("इन्टरनेट संग जोडिनुहोस", style:TextStyle(fontWeight: FontWeight.w800, color:Colors.purple))
              ],
            ) ,
          ),
        ),
      ):

      _channel != null
          ? NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollDetails) {
                if (!_isLoading &&
                    _channel!.videos!.length != int.parse(_channel!.videoCount.toString()) &&
                    scrollDetails.metrics.pixels ==
                        scrollDetails.metrics.maxScrollExtent) {
                  _loadMoreVideos();
                }
                return false;
              },
              child: ListView.builder(
                itemCount: 1 + _channel!.videos!.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return _buildProfileInfo();
                  }
                  Video video = _channel!.videos![index - 1];
                  return _buildVideo(video);
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor, // Red
                ),
              ),
            );
    //);
  }
 
  void checkInternet()async {
    var connectivityResult = await (Connectivity().checkConnectivity());
  if(connectivityResult == ConnectivityResult.none) {
 // In Home screen show the value Connection Status o non
 _hasInternet=false;
}else{
   _hasInternet=true;

    _initChannel();
 
  

}
  }
}
 