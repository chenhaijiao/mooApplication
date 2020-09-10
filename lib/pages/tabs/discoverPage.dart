import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:studio/pages/tabs/discoverPage.dart';
import 'package:studio/pages/tabs/myMooPage.dart';
import 'package:studio/pages/tabs/playPage.dart';
import 'package:studio/services/screenAdpter.dart';
import 'package:studio/pages/tabs/searchPage.dart';
import 'package:studio/services/TagService.dart';
import 'package:studio/model/NowPlaySongModel.dart';
import 'package:studio/provider/save_sp_data.dart';
import 'package:studio/model/new_songs.dart';
class DiscoverPage extends StatefulWidget{
  final Map arguments;
  const DiscoverPage({Key key, this.arguments}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>Discover(arguments:arguments);
}
class Discover extends State<DiscoverPage>  with TickerProviderStateMixin{
  var _isPlay = false;
  NowPlaySong _nowPlaySong;
  NewSongs newSongs;
  var _newSongsFlag = 0;
  Map arguments;
  var  _tagList = [];
  var controlen = false;
  Discover({this.arguments});
  AnimationController controller;
  Animation animation;
  // final _rotateTween = new Tween<double>(begin: -0.15, end: 0.0);
  void initState() {
    // TODO: implement initState
    super.initState();
    print("搜索歌曲页面");
    _getTagList();
    setState(() {
       controlen = false;
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
   _getNowPlaySongInfo();
   _getNewSongs();
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
      controller.forward();
            // controller.forward();
    });
  }
  void pauseSong(){
    
    controller.dispose();
    // print("shifang");
    // super.dispose();
    setState(() {
      _isPlay = false;
    });
  }
   _getNowPlaySongInfo() async {
    NowPlaySong nowPlaySong = await SP.getNowPlaySongInfo();
    // print(tagList);
    setState(() {
      this._nowPlaySong = nowPlaySong;
      if(this._nowPlaySong.pause){
        _isPlay = true;
      }
    });
    print("Discover新歌页面                                   ${this._nowPlaySong}");
  }
  _getTagList() async {
    TagService.setTagyData("#躺着听");
    TagService.setTagyData("#Swing");
    TagService.setTagyData("#Jazz Pop");
    TagService.setTagyData("#Post Rock");
    TagService.setTagyData("#Soul Blues");
    TagService.setTagyData("#Post-Disco");
    TagService.setTagyData("#New Age");
    TagService.setTagyData("#Speed Metal");
    TagService.setTagyData("#Ragga");
    TagService.setTagyData("#岁末盘点");
    TagService.setTagyData("#歌手");
    TagService.setTagyData("#Future Pop");
    TagService.setTagyData("#Revolution");
    TagService.setTagyData("#Tropical House");
    TagService.setTagyData("#华语音乐传媒大奖");
    TagService.setTagyData("#Melodic Dubstep");
    TagService.setTagyData("#Hardcore Dancing");
    TagService.setTagyData("#Trap Rap");
    TagService.setTagyData("#Urban Blues");
    TagService.setTagyData("#Electric");
    List tagList = await TagService.getTagList();
    // print(tagList);
    if(this._tagList.length >= 10){
      TagService.removeTagDataById(0);
      setState(() {
        this._tagList = tagList.sublist(tagList.length-10);
      });
    }else{
      if(this.controlen){
         setState(() {
        this._tagList = tagList;
      });
      }else{
        setState(() {
        this._tagList = tagList.sublist(tagList.length-10);
        this.controlen = true;
        });
      }
     
    }
    // print("热搜榜详情列表：${this._tagList}");
  }
   onclickHeadImg(){
    print("111111");
     Navigator.push(context, MaterialPageRoute(
        builder: (context) => MyMooPage()));
  } 
  _getNewSongs() async {
    var api = "https://api.imjad.cn/cloudmusic/?type=playlist&id=309390784";
      var result = await Dio().get(api);
      Map _newSongs = Map<String, dynamic>.from(result.data); 
      setState(() {
        this.newSongs = NewSongs.fromJson(_newSongs);
        this._newSongsFlag = newSongs.playlist.tracks.length > 6 ? 6 : newSongs.playlist.tracks.length;
    });
    print("jieguo");
    print("结果${this.newSongs}");
  }
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
     return Scaffold(
        backgroundColor: const Color(0xFF1a1a1a),
      extendBody: true,
       appBar:  PreferredSize(
        child: AppBar(
          elevation: 0,
         backgroundColor: const Color(0xFF1a1a1a),
          automaticallyImplyLeading:false,
         title: Container(
          //  width: 120.0,
            color:  const Color(0xFF1a1a1a),
            margin: EdgeInsets.only(
              top: 20
            ),
            child: InkWell(
              onTap: (){
                if(this._newSongsFlag != 0){
                Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ThePlayPage(
                         arguments:{    
                                        'id': this.newSongs.playlist.tracks[0].id,
                                        'newSongs':this.newSongs,
                                        'index':0,
                                        'type':'newSongs',
                                  }
                        )));
                }
                    
              },
              child:  Text("DISCOVER",
                style: TextStyle(fontSize: 26.0,color: Colors.white,fontWeight: FontWeight.bold),
              )
            ),
          ),
         actions: <Widget>[
           InkWell(
             highlightColor: Colors.transparent,
                    radius: 0.0,
                          onTap: ()
                           {
                            onclickHeadImg();
                          },
                          child:
           Container(
                      width: 40.0,
                      height: 40.0,
                      margin: EdgeInsets.only(
                        top: 20
                      ),
                       decoration: new BoxDecoration(
                          //背景
                          color: Colors.yellow,
                          //设置四周圆角 角度
                           shape: BoxShape.circle,
                          // borderRadius: BorderRadius.all(Radius.circular(150)),
                          //  image: DecorationImage(
                          //     image: AssetImage(
                          //       'images/image_start.png'
                          //     ),
                          //     fit: BoxFit.cover),
                          //设置四周边框
                          border: new Border.all(width: 2,color: Colors.white),
                        ),
                      // color: Colors.red,
                      //   child:  InkWell(
                      //     onTap: () {
                      //       onclickHeadImg();
                      //     },
                          child: ClipOval(
                              //头像半径
                              // radius: 20,
                              
                            child: Image.asset( 'images/image_start.png',height: 20,width: 20,fit: BoxFit.cover,),
                              //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                             
                            ),
                        // ),
                      ))
         ],
       ),
        preferredSize: Size.fromHeight(76)
     ),
     
      
     body: ScrollConfiguration(
                    behavior: OverScrollBehavior(),
                    child:ListView(
                      children: <Widget>[
                        ListView(
                            shrinkWrap: true,
                            physics:NeverScrollableScrollPhysics(),
                              children: <Widget>[  
                                Container(
                                  child: Search(),
                                ),
                                
                              ],),    
                            
                          Container(
             margin: EdgeInsets.only(
                 top: 25,
                 left: 15,
                 right: 15,
                 bottom: 10,
              ),
             child: Column(children: <Widget>[
             InkWell(
               highlightColor: Colors.transparent,
               radius: 0.0,
               onTap: (){
                 print("歌曲");
                 _getTagList();
                  // Navigator.push(context, MaterialPageRoute(
                  //                     builder: (context) => SearchSongsPage(arguments:{
                  //                       'keywords':this._keyword
                  //       }
                  // )));
               },
               child: Container(
                 height: 50,
                //  color: Colors.yellow,
                 child: Stack(
                   children: <Widget>[
                     Positioned(
                       top: 10,
                       left: 0,
                       child: Container(
                        //  color: Colors.red,
                         width: 300,
                         child:  RichText(
                                                              text:TextSpan(
                                                                text: "MOO Track",
                                                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),
                                                                children: [
                                                                  TextSpan(
                                                                    text: "_新歌",
                                                                    style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.normal)
                                                                  )
                                                                ]
                                                              ),
                                                              
                                                          ),
                       ),
                     ),
                     Positioned(
                        right: 0,
                        top: 14,
                        child: Container(
                        //  color: Colors.blue,

                            child: new ImageIcon(AssetImage('images/in.png'), color: Colors.grey,size:14),
                          ),
                     )
                   ],
                 ),
               ),),],),),    
                          
                          ScrollConfiguration(
                behavior: OverScrollBehavior(),
                        
                  child: this._newSongsFlag>0?ListView.builder(
                  shrinkWrap: true,
                  physics:NeverScrollableScrollPhysics(),//禁用滑动事件
                  
                  itemBuilder: (BuildContext context, int index) {
                    // print("object");
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
                              Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => ThePlayPage(
                                    arguments:{    
                                                    'id': this.newSongs.playlist.tracks[index].id,
                                                    'newSongs':this.newSongs,
                                                    'index':index,
                                                    'type':'newSongs',
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
                                            imageUrl: '${this.newSongs.playlist.tracks[index].al.picUrl}',
                                            // imageUrl: '${searchSuggest.result.songs[index].artists[0].img1v1Url}',
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
                                    child: Text("${this.newSongs.playlist.tracks[index].name}",
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                                    ),
                                  ),
                                  Positioned(
                                    left: 75,
                                    bottom: 8,
                                    child: Text("${this.newSongs.playlist.tracks[index].ar[0].name}",
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
                  itemCount: this._newSongsFlag,
                  // itemCount: this.searchSuggest.result.songs.length,
                )
                :Container(width: 0,height: 0),
              ),   
                          
                //           ScrollConfiguration(
                // behavior: OverScrollBehavior(),
                //   child:ListView(
                //     shrinkWrap: true,
                //     physics:NeverScrollableScrollPhysics(),
                //     children: <Widget>[
                      
                  //   ],
                  // )
                  //       )
                             Container(
                                  child: Container(
                                    height: 240.0,
                                    // color: Colors.red,
                                    margin: EdgeInsets.only(
                                      top: 30,
                                      // bottom: 40,
                                      left: 15,
                                      right: 15,
                                    ),
                                    //  color:const Color(0xFF1a1a1a),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          // width: 100,
                                          // color: Colors.black,
                                          height: 30,
                                          margin: EdgeInsets.only(
                                                bottom: 20,
                                          ),
                                          child: Stack(
                                            children: <Widget>[
                                              Positioned(
                                                left: 0,
                                                child: Container(
                                                    
                                                    width: 250,
                                                    // height: 40,
                                                    // color: Colors.white,
                                                    // child: Center(
                                                      child: RichText(
                                                              text:TextSpan(
                                                                text: "MOO Tag",
                                                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),
                                                                children: [
                                                                  TextSpan(
                                                                    text: "_探索标签",
                                                                    style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.normal)
                                                                  )
                                                                ]
                                                              ),
                                                              
                                                          ),
                                                    // ),
                                                  ),
                                              ),
                                              Positioned(
                                                right: 0,
                                                child: InkWell(
                                                   highlightColor: Colors.transparent,
                                                    radius: 0.0,
                                                  onTap: (){
                                                    _getTagList();
                                                  },
                                                  child: Container(
                                                  
                                                    // width: 200,
                                                    // height: 40,
                                                    // color: Colors.white,
                                                    child: new ImageIcon(AssetImage('images/flush.png'), color: Colors.grey,size:22),
                                                  ),
                                                )
                                              )
                                            ],
                                          ),
                                        ),
                                      Container(
                                        // color: Colors.black,
                                        // height: 40,
                                        width: ScreenAdapter.getScreenWidth()-30,
                                        child: this._tagList.length > 0
                                                  ? Wrap(
                                                      children: this._tagList.map((value) {
                                                        // print
                                                        // print(value);
                                                          return Container(
                                                            margin: EdgeInsets.only(
                                                              // left: 20,
                                                              right: 20,
                                                              top: 5,
                                                              bottom: 5,
                                                            ),
                                                            height: 26,
                                                            // color: Colors.red,
                                                            child: Container(
                                                              padding: EdgeInsets.only(
                                                                right: 15,
                                                                left: 15,
                                                                top: 3
                                                              ),
                                                              decoration: new BoxDecoration(
                                                                //背景
                                                                color: Colors.yellow,
                                                                //设置四周圆角 角度
                                                                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                                                                //设置四周边框
                                                                border: new Border.all(width: 1, color: Colors.yellow),
                                                              ), 
                                                              child: Text(value,
                                                              style: TextStyle(color: Colors.black,fontSize: 13),
                                                            ),
                                                            )
                                                          );
                                                      },
                                                ).toList()
                                          ):Text(""),
                                      )
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
     )
     );
  }
}

class Search extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      height: 40.0,
      margin: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      //  color:const Color(0xFF1a1a1a),
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
        ),
        color: Colors.black,
        child: InkWell(
          highlightColor: Colors.transparent,
          radius: 0.0,
          onTap: (){
            print("11111");
            Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => SearchPage(arguments:{
                                        'keywords':"",
                                      }
                                          )));
          },
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 15,
                child: Container(
                  height: 40,
                  child: Center(
                    child :new ImageIcon(AssetImage('images/search.png'), color: Colors.yellow,size:20)
                  ) 
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
// class Tag extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     ScreenAdapter.init(context);
//     return Container(
//       height: 200.0,
//       color: Colors.red,
//       margin: EdgeInsets.only(
//         top: 40,
//         // bottom: 40,
//         left: 15,
//         right: 15,
//       ),
//       //  color:const Color(0xFF1a1a1a),
//       child: Column(
//         children: <Widget>[
//           Container(
//             // width: 100,
//             // color: Colors.black,
//             height: 30,
//             margin: EdgeInsets.only(
//                   bottom: 30,
//             ),
//             child: Stack(
//               children: <Widget>[
//                 Positioned(
//                   left: 0,
//                   child: Container(
                      
//                       width: 250,
//                       // height: 40,
//                       // color: Colors.white,
//                       // child: Center(
//                         child: RichText(
//                                 text:TextSpan(
//                                   text: "MOO Tag",
//                                   style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),
//                                   children: [
//                                     TextSpan(
//                                       text: "_探索标签",
//                                       style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.normal)
//                                     )
//                                   ]
//                                 ),
                                
//                             ),
//                       // ),
//                     ),
//                 ),
//                 Positioned(
//                   right: 0,
//                   child: Container(
                     
//                       // width: 200,
//                       // height: 40,
//                       // color: Colors.white,
//                       child: new ImageIcon(AssetImage('images/flush.png'), color: Colors.grey,size:22),
//                     ),
//                 )
//               ],
//             ),
//           ),
//         Container(
//           color: Colors.black,
//           height: 40,
//           width: ScreenAdapter.getScreenWidth()-30,
//           child: this._tagList.length > 0
//                     ? Wrap(
//                         children: this._tagList.map((value) {
//                           // print
//                           print(value);
//                             return Container(
//                               margin: EdgeInsets.only(
//                                 left: 20,
//                                 top: 8,
//                                 bottom: 8,
//                               ),
//                               child: Text(value,
//                                 style: TextStyle(color: Colors.white,fontSize: 17),
//                               ),
//                             );
//                         },
//                   ).toList()
//             ):Text("1111111"),
//         )
//         ],
//       )
//     );
//   }
  
// }

