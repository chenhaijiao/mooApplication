import 'package:flutter/material.dart';
import 'package:studio/pages/tabs/discoverPage.dart';
import 'package:studio/services/screenAdpter.dart';
// import 'package:studio/model/SearchSongsModel.dart';
import 'package:studio/model/search_songs.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:studio/config/config.dart';
// import 'package:studio/model/SongUrlModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:studio/services/StringService.dart';
class ThePlayPage extends StatefulWidget{
  final Map arguments;
  const ThePlayPage({Key key, this.arguments}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new Play(arguments:arguments);
  }
}
class Play extends State<ThePlayPage>{
  AudioPlayer audioPlayer = AudioPlayer();
  var load = "加载中";
  var _isPlay = false;
  var _isLove = false;
  Map arguments;
  Play({this.arguments});
  // Entity searchSongs;
  // SongUrlModel songUrlModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(this.arguments['id']);
    this.audioPlayer = AudioPlayer();
  }
  _getSongsmp3(){
    
  }
  play(String mp3) async {
      int result = await audioPlayer.play(mp3);
      if (result == 1) {
        // success
        print('play success');
        setState(() {
          // audioPlayer.setVolume (0.5);
          this._isPlay = true;
          audioPlayer.onAudioPositionChanged.listen((p) async {
            // p参数可以获取当前进度，也是可以调整的，比如p.inMilliseconds
            print(p.inMilliseconds);
            print("1");
          });
          print("监听");
        });
      } else {
        print('play failed');
        setState(() {
          this._isPlay = false;
        });
      }
    }
  pause() async {
      int result = await audioPlayer.pause();
      if (result == 1) {
        // success
        print('pause success');
      } else {
        print('pause failed');
      }
    }
  onTapOne(){
    setState(() {
      if(this._isPlay){
        this._isPlay = false;
        pause();
        //  play(this.songUrlModel.data[0].url);
      }else{
        //  pause();
        // this._isPlay = true;
        //  play(this.songUrlModel.data[0].url);
        play("http://m7.music.126.net/20191230114256/bc2c9149f9721aee048763d7aff49d38/ymusic/9cc1/3f9f/16e8/ce3f58a0768376f72746cdf9cd27bc7c.mp3");
      }
    });
    // print("ontap${this._isPlay}");
  }
   //上一曲下一曲时释放资源
    @override
  void deactivate() async{
    print('结束');
    int result = await audioPlayer.release();
    if (result == 1) {
      print('release success');
    } else {
      print('release failed');
    }
    super.deactivate();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(load == "歌曲加载失败"){
      return Scaffold(
        body : Stack(
          children: <Widget>[
            Container(
             width: ScreenAdapter.getScreenWidth(),
              height: ScreenAdapter.getScreenHeight(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/image_start.png"),
                fit: BoxFit.cover,
              ),
            ),
            // child: FocusTestRoute(),
            ),
            Positioned(
              top: 40,
              left: 15,
              child: Container(
          //  width: ScreenAdapter.getScreenWidth(),
                // color:  const Color(0xFF1a1a1a),
                color: Color.fromARGB(0, 0, 0, 0),
                child: InkWell(
                  onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => DiscoverPage()));
                  },
                  child:  Text("PLAY",
                  // textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 26.0,color: Colors.white,fontWeight: FontWeight.bold),
                  )
                ),
              ),
            )
            ,this._isPlay
            ?Container(width: 0,height: 0,):
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: ScreenAdapter.getScreenWidth(),
                height: ScreenAdapter.getScreenHeight()-60,
                // color: Color.fromARGB(0, 0, 0, 0),
                // color: Color.fromRGBO(0, 0, 0, 0.2),
                child: Center(
                  child: Text("歌曲资源加载失败",
                            style: TextStyle(color: Colors.grey,fontSize: 18
                            ),
                ),
              )  
            ),
            )
          ],
        )
       );
    }
    ScreenAdapter.init(context);
    // if(load == "歌曲加载成功"){

    if(load == "歌曲加载成功"){
    return Scaffold(
        body : Stack(
          children: <Widget>[
            Container(
             width: ScreenAdapter.getScreenWidth(),
              height: ScreenAdapter.getScreenHeight(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/image_start.png"),
                fit: BoxFit.cover,
              ),
            ),
            // child: FocusTestRoute(),
            ),
            Positioned(
              top: 40,
              left: 15,
              child: Container(
          //  width: ScreenAdapter.getScreenWidth(),
                // color:  const Color(0xFF1a1a1a),
                color: Color.fromARGB(0, 0, 0, 0),
                child: InkWell(
                  onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => DiscoverPage()));
                  },
                  child:  Text("PLAY",
                  // textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 26.0,color: Colors.white,fontWeight: FontWeight.bold),
                  )
                ),
              ),
            )
            ,this._isPlay
            ?Container(width: 0,height: 0,):
            Positioned(
              top: 80,
              left: 0,
              child: Container(
                width: ScreenAdapter.getScreenWidth(),
                height: ScreenAdapter.getScreenHeight()-160,
                // color: Color.fromARGB(0, 0, 0, 0),
                color: Color.fromRGBO(0, 0, 0, 0.2),
                child: Center(
                  child: new ImageIcon(AssetImage('images/playSong.png'), color: Colors.white,size:50),
                ),
              )  
            ),
            Positioned(
              top: 80,
              height: ScreenAdapter.getScreenHeight()-250,
              width: ScreenAdapter.getScreenWidth(),
              child: GestureDetector(
                 onTapUp: (_) => onTapOne(),
                 onDoubleTap: (){
                   setState(() {
                     if(this._isLove){
                       this._isLove = false;
                     }else{
                       this._isLove = true;
                     }
                   });
                 },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: ScreenAdapter.getScreenWidth(),
                height: 150,
                // color: Colors.blue,
                child: GestureDetector(
                  onDoubleTap: (){
                   setState(() {
                     if(this._isLove){
                       this._isLove = false;
                     }else{
                       this._isLove = true;
                     }
                   });
                 },
                ),
              ),
            )
          ],
        )
       );
    }
    return Scaffold(
        body : Stack(
          children: <Widget>[
            Container(
             width: ScreenAdapter.getScreenWidth(),
              height: ScreenAdapter.getScreenHeight(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/image_start.png"),
                fit: BoxFit.cover,
              ),
            ),
            // child: FocusTestRoute(),
            ),
            Positioned(
              top: 40,
              left: 15,
              child: Container(
          //  width: ScreenAdapter.getScreenWidth(),
                // color:  const Color(0xFF1a1a1a),
                color: Color.fromARGB(0, 0, 0, 0),
                child: InkWell(
                  onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => DiscoverPage()));
                  },
                  child:  Text("PLAY",
                  // textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 26.0,color: Colors.white,fontWeight: FontWeight.bold),
                  )
                ),
              ),
            ),
            Positioned(
            top: 80,
              child: Container(
                height:ScreenAdapter.getScreenHeight()-80,
                width: ScreenAdapter.getScreenWidth(),
                color: Colors.red,
                child:Stack(
                  children: <Widget>[ 
                    Container(
                      child: Center(
                        child: Material(
                          // color: Color(0xFF1a1a1a),
                          color: Color.fromRGBO(0, 0, 0, 1),
                        child: SpinKitFadingCircle(
                            itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  color: index.isEven ? Colors.yellow : Colors.yellow,
                                ),
                              );
                            },
                          ),
                      ),
                      )
                    )
                    // Text("${this.searchSongs.code!=null?this.searchSongs.code:0}"),
                  ],
                )
              ),
            )        
          ],
        )
       );
  }
}