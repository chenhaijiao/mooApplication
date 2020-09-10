import 'package:flutter/material.dart';
import 'package:studio/model/new_songs.dart';
import 'package:studio/pages/tabs/discoverPage.dart';
import 'package:studio/services/screenAdpter.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:studio/model/play_songs.dart';
import 'package:dio/dio.dart';
import 'package:studio/config/config.dart';
// import 'package:studio/model/SongUrlModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:studio/services/StringService.dart';
import 'package:studio/model/search_songs.dart';
import 'package:studio/model/search_songs.dart';
import 'package:studio/model/new_songs.dart';
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
  var songName = "";
  var artistName = "";
  var type = "";
  var songsCount = 0;
  var url = "";
  var duration = 0.0;
  PlaySongs playSongs;
  List Img =[];
  Map arguments;
  Play({this.arguments});
  SearchSongs searchSongs;
  // var songUrlModel;
  var songUrl = "";
  NewSongs newSongs;
  @override
  void initState() {

    super.initState();

    this.audioPlayer = AudioPlayer();
    setState(() {
       this.Img = [

'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599759880582&di=349bb01c1e33cf780c23534b8c4cb8d1&imgtype=0&src=http%3A%2F%2Fpic.soutu123.com%2Fback_pic%2F04%2F30%2F60%2F97584136b04ff4c.jpg%2521%2Ffw%2F700%2Fquality%2F90%2Funsharp%2Ftrue%2Fcompress%2Ftrue',
'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1974590446,605664058&fm=26&gp=0.jpg',
'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=163944003,3688502714&fm=15&gp=0.jpg',
'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599759716488&di=a9594ad6e71fd80078a5216335c99f34&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201503%2F25%2F20150325060224_hWWwS.jpeg',
'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2692363474,3984166099&fm=15&gp=0.jpg',

'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599759172837&di=eda1d1ec57a643d127815f3361fbd437&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201509%2F13%2F20150913185738_iu2cs.png',
'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599759172838&di=c79ef133f4deca5400d8459fc45f169f&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201801%2F22%2F20180122132657_5jhac.jpeg',
'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599759626968&di=23624786b3528064554fecb3cc9db553&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fmobile%2Fa%2F53c768a408889.jpg',
'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2823024655,2150443274&fm=26&gp=0.jpg',
'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599759172844&di=d43cb9edb31dd594094307edd35c3f80&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201705%2F22%2F161831z0tfcdc9d8tt33v3.png',

'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599759626968&di=516d1325f73d0ce4d751a7be89b0793f&imgtype=0&src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20171011%2F437bf088834642cda18b79c279d11c4b.jpeg',
'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3381529818,3698058114&fm=26&gp=0.jpg',
'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599759211052&di=2233aa12de8b36b98bb600dce788312a&imgtype=0&src=http%3A%2F%2Fimg3.imgtn.bdimg.com%2Fit%2Fu%3D3911106243%2C590107508%26fm%3D214%26gp%3D0.jpg',
'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1655756550,3286029587&fm=26&gp=0.jpg',
'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=31980444,388689616&fm=26&gp=0.jpg',

'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1431977191,3212537415&fm=26&gp=0.jpg',
'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599759405416&di=2d45fd80cf0052b25492c6efd9549ace&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201511%2F30%2F20151130233124_AHUFm.jpeg',
'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3751665601,1269464183&fm=26&gp=0.jpg',
'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=163944003,3688502714&fm=15&gp=0.jpg',
'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1348675706,3442063458&fm=26&gp=0.jpg',


'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2692363474,3984166099&fm=15&gp=0.jpg',
'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1799341907,4096815425&fm=26&gp=0.jpg',
'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599759170034&di=22a3ed8dd781ea2d77e5a5872c7cb7bd&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201509%2F13%2F20150913185738_iu2cs.png',
'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599759170035&di=63e8658cc739d9349be163f4d6bd2380&imgtype=0&src=http%3A%2F%2Fbbs-fd.zol-img.com.cn%2Ft_s800x5000%2Fg5%2FM00%2F01%2F00%2FChMkJlZq9-uIDcBqAAdh7HKmzggAAGDNgFsFk0AB2IE402.jpg',
'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2823024655,2150443274&fm=26&gp=0.jpg',

'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1352193686,3407600701&fm=26&gp=0.jpg',
'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599759211052&di=2233aa12de8b36b98bb600dce788312a&imgtype=0&src=http%3A%2F%2Fimg3.imgtn.bdimg.com%2Fit%2Fu%3D3911106243%2C590107508%26fm%3D214%26gp%3D0.jpg',
'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3381529818,3698058114&fm=26&gp=0.jpg',
'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=415367735,2034295639&fm=15&gp=0.jpg',
'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4246337513,1721503604&fm=26&gp=0.jpg',
'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=31980444,388689616&fm=26&gp=0.jpg',
'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599759172844&di=d43cb9edb31dd594094307edd35c3f80&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201705%2F22%2F161831z0tfcdc9d8tt33v3.png',
      ];
          
    });
    if(this.arguments['type']=='searchSongs'){

        setState(() {
          this.searchSongs = this.arguments['songsList'];
          this.url = this.searchSongs.result.songs[arguments['index']].artists[0].img1v1Url;
          this.artistName = this.searchSongs.result.songs[arguments['index']].artists[0].name;
          this.songName = this.searchSongs.result.songs[arguments['index']].name;
           StringService.setTagyData("recentPlaySongsId", this.arguments['id']);
           StringService.setTagyData("recentPlaySongsSname", this.searchSongs.result.songs[arguments['index']].name);
           StringService.setTagyData("recentPlaySongsAname", this.searchSongs.result.songs[arguments['index']].artists[0].name);
          getSongUrl();
          this.type = this.arguments['type'];
          this.songsCount = this.searchSongs.result.songs.length;
        });
      print(this.searchSongs.code);
      // 'songsList':this.searchSongs,
      // 'index':index,
      // 'id':this.searchSongs.result.songs[index].id,
    }else if(this.arguments['type']=='newSongs'){
        setState(() {
          this.newSongs = this.arguments['newSongs'];
          this.url = this.newSongs.playlist.tracks[arguments['index']].al.picUrl;
          this.artistName = this.newSongs.playlist.tracks[arguments['index']].ar[0].name;
          this.songName = newSongs.playlist.tracks[arguments['index']].name;
          //  StringService.setTagyData("recentPlaySongsId", this.arguments['id']+'');
          //  StringService.setTagyData("recentPlaySongsImgUrl", this.searchSongs.result.songs[int.parse(arguments['index'])].artists[0].img1v1Url);
          //  StringService.setTagyData("recentPlaySongsSname", this.searchSongs.result.songs[int.parse(arguments['index'])].name+''+this.arguments['index']);
          //  StringService.setTagyData("recentPlaySongsAname", this.searchSongs.result.songs[int.parse(arguments['index'])].artists[0].name+''+this.arguments['index']);
           StringService.setTagyData("recentPlaySongsId", this.arguments['id']);
          //  StringService.setTagyData("recentPlaySongsImgUrl", this.searchSongs.result.songs[arguments['index']].artists[0].img1v1Url);
           StringService.setTagyData("recentPlaySongsSname", this.songName);
           StringService.setTagyData("recentPlaySongsAname", this.artistName);
          print("111111111111111111111111111111111");
          getSongUrl();
          this.type = this.arguments['type'];
          this.songsCount = this.newSongs.playlist.tracks.length;
        });
    }
  }
  getSongUrl() async {
    https://autumnfish.cn/song/url
    var api = "https://api.imjad.cn/cloudmusic/?type=song&id=${this.arguments['id']}";
      print(api);
      var result = await Dio().get(api);
      print(result.data);
       Map _playSongs = Map<String, dynamic>.from(result.data); 
      setState(() {
          playSongs = PlaySongs.fromJson(_playSongs);
          if(playSongs.data[0].url != null){
                this.songUrl = playSongs.data[0].url;
                print(this.songUrl);
                audioPlayer.setUrl(this.songUrl); // prepare the player with this audio but do not start playing
                audioPlayer.setReleaseMode(ReleaseMode.STOP);
                play(this.songUrl);
                this.load = "歌曲加载成功";
          }
    });
    print("jieguo");
    print("结果${this.songUrl}");
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
            // print(p.inMilliseconds);
            // print("1");
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
  resume(){
    audioPlayer.resume(); 
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
        print("pause");
      }else{
        //  pause();
        // this._isPlay = true;
        //  play(this.songUrlModel.data[0].url);
        // play("http://m7.music.126.net/20191230114256/bc2c9149f9721aee048763d7aff49d38/ymusic/9cc1/3f9f/16e8/ce3f58a0768376f72746cdf9cd27bc7c.mp3");
        resume();
        this._isPlay = true;
        print("resume");
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
            child:CachedNetworkImage(
                                           width: ScreenAdapter.getScreenWidth(),
              height: ScreenAdapter.getScreenHeight(),
                                            fit: BoxFit.cover,
                                            // imageUrl: '${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',
                                          //  imageUrl: 'http://dmimg.5054399.com/allimg/pkm/pk/22.jpg',
                                            imageUrl: '${this.Img[arguments['index']]}',
                                            placeholder: (context, url) =>  Container(
                                                                width: ScreenAdapter.getScreenWidth(),
                                                                height: ScreenAdapter.getScreenHeight(),
                                                                decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                    image: AssetImage("images/image_start.png"),
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),
            ),
            this._isPlay
            ?Container(width: 0,height: 0,):
            Positioned(
              top: 80,
              left: 0,
              child: Container(
                width: ScreenAdapter.getScreenWidth(),
                height: ScreenAdapter.getScreenHeight()-160,
                // color: Color.fromARGB(0, 0, 0, 0),
                // color: Color.fromRGBO(0, 0, 0, 0.2),
                child: Center(
                  child: new ImageIcon(AssetImage('images/playSong.png'), color: Colors.white,size:50),
                ),
              )  
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 120,
              child: Container(
                width: ScreenAdapter.getScreenWidth(),
                height: 60,
                // color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        // color: Colors.black,
                        width: ScreenAdapter.getScreenWidth()/2,
                        child: Text("${this.songName}",
                        maxLines: 1,
          overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child :Container(
                          width: 20.0,
                          height: 20.0,
                           decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // color: Colors.red,

                              // image: CachedNetworkImage(),
                          ),

                         child:CachedNetworkImage(
                            // width: 20,
                            // height: 20,
                            fit: BoxFit.cover,
                            
                            // imageUrl: '${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',
                            imageUrl: '${this.url}',
                            placeholder: (context, url) =>  Container(
                                               width: 20.0,
                                                height: 20.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                  image:new AssetImage('images/image_start.png',),

                                                    fit: BoxFit.cover,
                                                  ),
                                              ),),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                            
                       )
                    ),
                    Positioned(
                      bottom: 0,
                      left: 32,
                      child: Container(
                        // color: Colors.black,
                        child: Text("${this.artistName}",
                        style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 17,
                      child: this._isLove?
                      new ImageIcon(AssetImage('images/collect.png'), color: Colors.red,size:30)
                      :new ImageIcon(AssetImage('images/collect.png'), color: Colors.white,size:30),
                    ),
                    Positioned(
                      right: 0,
                      top: 17,
                      child: new ImageIcon(AssetImage('images/download.png'), color: Colors.white,size:30),
                    ),
                  ],
                ),
              ),
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
            ,
            Positioned(
              top: 80,
              height: ScreenAdapter.getScreenHeight()-250,
              width: ScreenAdapter.getScreenWidth(),   
              child: GestureDetector(
                child: Container(
                  height: ScreenAdapter.getScreenHeight()-250,
                  width: ScreenAdapter.getScreenWidth(), 
                  color:Color.fromRGBO(0, 0, 0, 0),
                  // color:Colors.red,
                  // child: ,
                ),
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
                 onLongPress: (){
                    print("111");
                    var index = arguments['index'];
                    if(index == 0){
                      if(this.type == "newSongs"){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ThePlayPage(
                            arguments:{    
                                            'id': this.newSongs.playlist.tracks[this.songsCount-1].id,
                                            'newSongs':this.newSongs,
                                            'index':this.songsCount-1,
                                            'type':'newSongs',
                                      }
                            )));
                      }else if(this.type == "searchSongs"){
                            Navigator.push(context, MaterialPageRoute(
                                              builder: (context) => ThePlayPage(arguments:{
                                                'type':'searchSongs',
                                                'songsList':this.searchSongs,
                                                'index':this.songsCount-1,
                                                'id':this.searchSongs.result.songs[this.songsCount-1].id,
                                  }
                            )));
                      }
                    }else{
                      if(this.type == "newSongs"){
                            Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ThePlayPage(
                            arguments:{    
                                            'id': this.newSongs.playlist.tracks[index-1].id,
                                            'newSongs':this.newSongs,
                                            'index':index-1,
                                            'type':'newSongs',
                                      }
                            )));

                         }else if(this.type == "searchSongs"){
                            Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => ThePlayPage(arguments:{
                                              'type':'searchSongs',
                                              'songsList':this.searchSongs,
                                              'index':index-1,
                                              'id':this.searchSongs.result.songs[index-1].id,
                                            }
                          )));
                      }
                    }

                    
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
                  // child: Text("${this.audioPlayer.getDuration()}",
                  // style: TextStyle(color: Colors.white),
                  // ),
                  onDoubleTap: (){
                   setState(() {
                     if(this._isLove){
                       this._isLove = false;
                     }else{
                       this._isLove = true;
                     }
                   });
                 },
                  onTap: (){
                    print("111");
                    var index = arguments['index'];
                    if(index == this.songsCount-1){
                      if(this.type == "newSongs"){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ThePlayPage(
                            arguments:{    
                                            'id': this.newSongs.playlist.tracks[0].id,
                                            'newSongs':this.newSongs,
                                            'index':0,
                                            'type':'newSongs',
                                      }
                            )));
                      }else if(this.type == "searchSongs"){
                            Navigator.push(context, MaterialPageRoute(
                                              builder: (context) => ThePlayPage(arguments:{
                                                'type':'searchSongs',
                                                'songsList':this.searchSongs,
                                                'index':0,
                                                'id':this.searchSongs.result.songs[0].id,
                                  }
                            )));
                      }
                    }else{
                      if(this.type == "newSongs"){
                            Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ThePlayPage(
                            arguments:{    
                                            'id': this.newSongs.playlist.tracks[index+1].id,
                                            'newSongs':this.newSongs,
                                            'index':index+1,
                                            'type':'newSongs',
                                      }
                            )));

                         }else if(this.type == "searchSongs"){
                            Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => ThePlayPage(arguments:{
                                              'type':'searchSongs',
                                              'songsList':this.searchSongs,
                                              'index':index+1,
                                              'id':this.searchSongs.result.songs[index+1].id,
                                            }
                          )));
                      }
                    }
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
                // color: Colors.red,
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