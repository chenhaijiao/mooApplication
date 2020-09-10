import 'package:flutter/material.dart';
import 'package:studio/model/search_songs.dart';
import 'package:studio/services/screenAdpter.dart';
import 'package:studio/pages/tabs/settingPage.dart';
import 'package:studio/pages/tabs/discoverPage.dart';
import 'package:dio/dio.dart';
import 'package:studio/config/config.dart';
import 'package:studio/pages/tabs/searchPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:studio/model/SearchSongsModel.dart';
import 'package:studio/widgets/loading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:studio/model/NowPlaySongModel.dart';
import 'package:studio/provider/save_sp_data.dart';
import 'package:studio/pages/tabs/playPage.dart';
import 'dart:convert';
// import 'package:studio/model/SearchSongs.dart';

class SearchSongsPage extends StatefulWidget{

  @override
   final Map arguments;
  const SearchSongsPage({Key key, this.arguments}) : super(key: key);
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SearchSong(arguments:arguments);
  }
}
class SearchSong extends State<SearchSongsPage>  with TickerProviderStateMixin{
  Map arguments;
  SearchSong({this.arguments});
  SearchSongs searchSongs;
  NowPlaySong _nowPlaySong;
  List Img = [];
  var flag = false;
  var _keyword = "";
    var _isPlay = false;
  AnimationController controller;
  Animation animation;
 void _getNowPlaySongInfo() async {
    NowPlaySong nowPlaySong = await SP.getNowPlaySongInfo();
    // print(tagList);
    setState(() {
      this._nowPlaySong = nowPlaySong;
      if(this._nowPlaySong.pause){
        _isPlay = true;
      }
    });
    print("搜索歌曲页面${this._nowPlaySong}");
  }
 void _setNowPlaySongInfo({int id ,double nowTimer,String url,int playListIndex,bool pause}) async{
   setState(() {
     this._nowPlaySong.pause = pause;
     this._nowPlaySong.nowTimer = nowTimer;
     this._nowPlaySong.id = id;
     this._nowPlaySong.url = url;
     this._nowPlaySong.playListIndex = playListIndex;
   });
 }
  void startSong(){
    setState(() {
       _isPlay = true;
       controller = AnimationController(duration: const Duration(seconds: 5), vsync: this);
        // this.controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
            this.animation = Tween(begin: 0.0, end: 1.0).animate(controller);
            this.controller.addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                print("completed");
                this.controller.repeat();
              } else if (status == AnimationStatus.dismissed) {
                print("dismissed");
                this.controller.forward();
              } else if (status == AnimationStatus.forward) {
                print("forward");
              } else if (status == AnimationStatus.reverse) {
                print("reverse");
              }
      });
      if(_isPlay){
              controller.forward();
            }else{
              controller.dispose();
            }
    });
  }
  void pauseSong(){
    
    controller.dispose();
    setState(() {
      _isPlay = false;
    });
  }
   @override
  Future initState(){
    super.initState();
    setState(() {
      this._keyword = arguments['keywords'];
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
    setState(() {
       controller = AnimationController(duration: const Duration(seconds: 5), vsync: this);
        // this.controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
            this.animation = Tween(begin: 0.0, end: 1.0).animate(controller);
            this.controller.addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                print("completed");
                this.controller.repeat();
              } else if (status == AnimationStatus.dismissed) {
                print("dismissed");
                this.controller.forward();
              } else if (status == AnimationStatus.forward) {
                print("forward");
              } else if (status == AnimationStatus.reverse) {
                print("reverse");
              }
            });
            if(_isPlay){
              controller.forward();
            }else{
              controller.dispose();
            }
            // controller.forward();
    });
    // _getNowPlaySongInfo();
    print("搜索歌曲页面${this._keyword}");
    getSongs();
    // super.initState();
  }
  var songsCount = 0;
  getSongs() async {
      var api = "https://autumnfish.cn/search?keywords=${this.arguments['keywords']}&limit=30";
      print(api);
      var result = await Dio().get(api);
      print(result.data);
       Map _searchSuggest = Map<String, dynamic>.from(result.data); 
      setState(() {
      this.searchSongs = SearchSongs.fromJson(_searchSuggest);
      this.flag = true;
      this.songsCount = this.searchSongs.result.songCount;
    });
    print("jieguo");
    print("结果${this.searchSongs.code}");
  }
  @override
  Widget build(BuildContext context) {
    if(!this.flag){
      return  Scaffold(
      backgroundColor: const Color(0xFF1a1a1a),
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1a1a1a),
        centerTitle: true,
        title: Text("歌曲",
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 17,
        ),
        ),
        ),
        body:Stack(
        children: <Widget>[
          Hero(
                               tag: 'zhuanpan',
                               child: Stack(
                                 children: <Widget>[
                                   Positioned(
                                left: 25,
                                bottom: 30,
                                child: Container(
                                   width: 160,
                                   height: 40,
                                    decoration: new BoxDecoration(
                                    //背景
                                    color: Colors.black,
                                    //设置四周圆角 角度
                                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                    //设置四周边框
                                    border: new Border.all(width: 1, color: Colors.black),
                                  ),
                                  //  color: Colors.red,
                                  // decoration: ,
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        left: 45,
                                        child: Container(
                                          width: 80,
                                          height: 40,
                                          // color: Colors.red,
                                          child:InkWell(
                                            onTap: (){
                                                print("跳转到播放页面");
                                            },
                                            child:  Center(
                                                child: this._isPlay == true?Text("00:01",
                                                style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),
                                                ):Text("00:01",
                                                style: TextStyle(color: Colors.grey,fontSize: 24,fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                          )
                                        ),
                                      ),
                                      Positioned(
                                        right: 1,
                                        child: InkWell(
                                           highlightColor: Colors.transparent,
                                           radius: 0.0,
                                           onTap: (){
                                             print("Pause");
                                            //  this.dispose();
                                            if(this._isPlay){
                                              this.pauseSong();
                                              print(this._isPlay);
                                            }else{
                                              this.startSong();
                                               print(this._isPlay);
                                            } 
                                           },
                                          child: Container(
                                            width: 45,
                                            height: 40,
                                            // color: Colors.red,
                                            child: Center(
                                              child: this._isPlay == true?new ImageIcon(AssetImage('images/pauseSong.png'), color: Colors.grey,size:18):
                                              new ImageIcon(AssetImage('images/playSong.png'), color: Colors.white,size:16),
                                            ),
                                          ),
                                        )
                                      )
                                    ],
                                  ),
                                ),
                              ),
                                   Positioned(
                                bottom: 20,
                                left: 15,
                                child: Container(
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        width: 60,
                                        height: 60,
                                        child: Stack(
                                          children: <Widget>[
                                            Container(
                                              width: 60,
                                              height: 60,
                                              child: RotationTransition(
                                                alignment: Alignment.center,
                                                turns: controller,
                                                child: InkWell(
                                                  onTap: (){
                                                    print("nextSong");
                                                  },
                                                   highlightColor: Colors.transparent,
                                                   radius: 0.0,
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: new BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: CircleAvatar(
                                                        radius: 40,
                                                        backgroundImage: AssetImage(
                                                          'images/zhuanpan.png'
                                                        ),
                                                      ),
                                                  ),
                                                )
                                                
                                              ),
                                            )
                                            
                                          ],
                                        )
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            
                                 ],
                               ),
                             )
            ,
          Positioned(
            top: 120,
              child: Container(
                height:ScreenAdapter.getScreenHeight()/2,
                width: ScreenAdapter.getScreenWidth(),
                color: Colors.red,
                child:Stack(
                  children: <Widget>[ 
                    Container(
                      child: Center(
                        child: Material(
                          color: Color(0xFF1a1a1a),
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
      ));
    }
    ScreenAdapter.init(context);
    if(this.flag){
    return Scaffold(
      backgroundColor: const Color(0xFF1a1a1a),
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1a1a1a),
        centerTitle: true,
        title: Text("歌曲",
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 17,
        ),
        ),
        ),
        body:Stack(
          children: <Widget>[
             Container(
              margin: EdgeInsets.only(
                top: 70,
                // left: 15,
              ),
              child: this.flag?ScrollConfiguration(
                  behavior: OverScrollBehavior(),
                  child: this.searchSongs.result.songs.length>0
                ?ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    print("object");
                    return Container(
           margin: EdgeInsets.only(
                //  top: 10,
                 left: 15,
                 right: 15,
                 bottom: 15,
            ),
            height: 60,
            child: InkWell(
              highlightColor: Colors.transparent,
              radius: 0.0,
              onTap: (){
                print("点击了某首歌");
                // ThePlayPage
                 Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => ThePlayPage(arguments:{
                                        'type':'searchSongs',
                                        'songsList':this.searchSongs,
                                        'index':index,
                                        'id':this.searchSongs.result.songs[index].id,
                                      }
                                          )));
              },
              child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0),
                          ),
                          child:CachedNetworkImage(
                                             width: 60.0,
                                             height: 60.0,
                                            fit: BoxFit.cover,
                                            // imageUrl: '${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',
                                          //  imageUrl: 'http://dmimg.5054399.com/allimg/pkm/pk/22.jpg',
                                            imageUrl: '${this.Img[index]}',
                                            placeholder: (context, url) =>  Container(
                                                                width: 60.0,
                                                                height: 60.0,
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape.rectangle,
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                  image: DecorationImage(
                                                                    // image: ,
                                                                    // this.searchSuggest.result != null
                                                                    //      ?new NetworkImage('${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',)
                                                                        image:new AssetImage('images/image_start.png',),
                                                                    //      :new AssetImage('images/logo_moomusic.png',),

                                                                    fit: BoxFit.cover,
                                                                  ),
                                                              ),),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),
                        )
                    ),
                    Positioned(
                      left: 75,
                      top: 8,
                      child: Text("${this.searchSongs.result.songs[index].name}",
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                      ),
                    ),
                    Positioned(
                      left: 75,
                      bottom: 8,
                      child: Text("${this.searchSongs.result.songs[index].artists[0].name}",
                      style: TextStyle(color: Colors.grey,fontSize: 15),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 20,
                      child: new ImageIcon(AssetImage('images/extra.png'), color: Colors.grey,size:20),
                    )
                  ],
                ),
            )
        );
                  },
                  // itemCount: 10,
                  itemCount: this.searchSongs.result.songs.length,
                )
                :Text("")
              ):Text(""),
            ),
            Positioned(
              top: 0,
              left: 15,
              child: Container(
                height: 55,
                width: ScreenAdapter.getScreenWidth()-30,
                // color: Colors.red,
                child:Stack(
                  children: <Widget>[ 
                    Positioned(
                      left: 0,
                      top: 15,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        radius: 0.0,
                        onTap: (){
                          print("播放歌曲");
                        },
                        child: Container(
                            width: 60.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.yellow,
                            ),
                            child: Center(
                              child: new ImageIcon(AssetImage('images/playSong.png'), color: Colors.black,size:13),
                            ),
                        ),
                      )
                    ),
                     Positioned(
                      top: 22,
                      left: 70,
                      child: Text("${this.songsCount>30?30:this.songsCount}",
                      style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 15,
                      child: new ImageIcon(AssetImage('images/selectList.png'), color: Colors.grey,size:27),
                    ),
                    // Text("${this.searchSongs.code!=null?this.searchSongs.code:0}"),
                  ],
                )
              ),
            ),
           Hero(
                               tag: 'zhuanpan',
                               child: Stack(
                                 children: <Widget>[
                                   Positioned(
                                left: 25,
                                bottom: 30,
                                child: Container(
                                   width: 160,
                                   height: 40,
                                    decoration: new BoxDecoration(
                                    //背景
                                    color: Colors.black,
                                    //设置四周圆角 角度
                                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                    //设置四周边框
                                    border: new Border.all(width: 1, color: Colors.black),
                                  ),
                                  //  color: Colors.red,
                                  // decoration: ,
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        left: 45,
                                        child: Container(
                                          width: 80,
                                          height: 40,
                                          // color: Colors.red,
                                          child:InkWell(
                                            onTap: (){
                                                print("跳转到播放页面");
                                            },
                                            child:  Center(
                                                child: this._isPlay == true?Text("00:01",
                                                style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),
                                                ):Text("00:01",
                                                style: TextStyle(color: Colors.grey,fontSize: 24,fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                          )
                                        ),
                                      ),
                                      Positioned(
                                        right: 1,
                                        child: InkWell(
                                           highlightColor: Colors.transparent,
                                           radius: 0.0,
                                           onTap: (){
                                             print("Pause");
                                            //  this.dispose();
                                            if(this._isPlay){
                                              this.pauseSong();
                                              print(this._isPlay);
                                            }else{
                                              this.startSong();
                                               print(this._isPlay);
                                            } 
                                           },
                                          child: Container(
                                            width: 45,
                                            height: 40,
                                            // color: Colors.red,
                                            child: Center(
                                              child: this._isPlay == true?new ImageIcon(AssetImage('images/pauseSong.png'), color: Colors.grey,size:18):
                                              new ImageIcon(AssetImage('images/playSong.png'), color: Colors.white,size:16),
                                            ),
                                          ),
                                        )
                                      )
                                    ],
                                  ),
                                ),
                              ),
                                   Positioned(
                                bottom: 20,
                                left: 15,
                                child: Container(
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        width: 60,
                                        height: 60,
                                        child: Stack(
                                          children: <Widget>[
                                            Container(
                                              width: 60,
                                              height: 60,
                                              child: RotationTransition(
                                                alignment: Alignment.center,
                                                turns: controller,
                                                child: InkWell(
                                                  onTap: (){
                                                    print("nextSong");
                                                  },
                                                   highlightColor: Colors.transparent,
                                                   radius: 0.0,
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: new BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: CircleAvatar(
                                                        radius: 40,
                                                        backgroundImage: AssetImage(
                                                          'images/zhuanpan.png'
                                                        ),
                                                      ),
                                                  ),
                                                )
                                                
                                              ),
                                            )
                                            
                                          ],
                                        )
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            
                                 ],
                               ),
                             )
             
          ],
        )
      );
  }
  }
}
