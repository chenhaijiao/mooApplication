import 'package:flutter/material.dart';
import 'package:studio/pages/tabs/discoverPage.dart';
import 'package:dio/dio.dart';
import 'package:studio/config/config.dart';
import 'package:studio/services/screenAdpter.dart';
import 'package:studio/pages/tabs/searchPage.dart';
import 'package:studio/pages/tabs/searchKeywordsPage.dart';
import 'package:studio/model/SearchSuggestModel.dart';
import 'package:studio/pages/tabs/searchSongsPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchResultPage extends StatefulWidget{
  final Map arguments;
  const SearchResultPage({Key key, this.arguments}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>SearchResult(arguments:arguments);
  
}
class SearchResult extends State<SearchResultPage>  with TickerProviderStateMixin{
  @override
  Map arguments;
  var _keyword = "";
  var flag = 3;
  // SearchSuggest searchSuggest;
      var _isPlay = true;
  AnimationController controller;
  Animation animation;
 
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
    // print("shifang");
    // super.dispose();
    setState(() {
      _isPlay = false;
    });
  }
  
  @override
  Future initState(){
    super.initState();
    setState(() {
      this.flag = 3;
      print("this.falg${this.flag}");
      this._keyword = arguments['keywords'];
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
  
    print("搜索建议页面");
    // getSearchSuggest();
  }
  // getSearchSuggest() async {
  //     var api = "${Config.domain}search/suggest?keywords=${this.arguments['keywords']}";
  //   // var api = "${Config.domain}playlist/hot";
  //     var result = await Dio().get(api);
  //     var _searchSuggest =SearchSuggest.fromJson(result.data); 
  //     setState(() {
  //     this.searchSuggest = _searchSuggest;
  //   });
  //   print("jieguo");
  //   print("结果${this.searchSuggest.code}");
  //   if(this.searchSuggest.code == 200){
  //     // if(this.searchSuggest.result.albums!=null || this.searchSuggest.result.songs!=null || this.searchSuggest.result.mv!=null ||this.searchSuggest.result.artists!=null){
  //     if( this.searchSuggest.result.songs!=null){
  //       setState(() {
  //         //有搜索结果
  //         this.flag = 3;
  //       });
  //     }else{
  //       //无搜索结果
  //       setState(() {
  //         this.flag = 2;
  //       });
  //     }
  //   }else{
  //     //请求失败
  //     setState(() {
  //       this.flag = 1;
  //     });
  //   }
  //   print(this.flag);
  // }
  SearchResult({this.arguments});
  Widget build(BuildContext context) {
    // TODO: implement build
    ScreenAdapter.init(context);
    if(this.flag == 1){
      //请求失败
      print("请求失败t");
      return Scaffold(
        backgroundColor: const Color(0xFF1a1a1a),
        extendBody: true,
        appBar:  PreferredSize(
        child: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF1a1a1a),
          automaticallyImplyLeading:false,
          title: Container(
          // height: 160.0,
            margin: EdgeInsets.only(
              top: 20.0
              // left: 10,
              // right: 10,
            ),
      //  color:const Color(0xFF1a1a1a),
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
        ),
        color: Colors.black,
          child: Row(children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20
              ),
              height: 40,
              child: Center(
                child: new ImageIcon(AssetImage('images/search.png'), color: Colors.yellow,size:20),
              ),
            ),
            Container(
              child: Expanded(
                child: TextField(
                  autofocus: false,
                  onSubmitted: (value){
                    this._keyword = value;
                  },
                  onChanged: (value){
                    print("这个是 onChanged 时刻在监听，输出的信息是：${value}");
                    // this._keyword = value;
                    if(value !=null){
                       Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => SearchKeywordsPage(arguments:{
                                        'keywords':value
                                      }
                                          )));
                    }
                  },
                  controller: TextEditingController.fromValue(TextEditingValue(
                          text:  this._keyword == null ? "" : this._keyword,  //判断keyword是否为空
                          // 保持光标在最后

                          selection: TextSelection.fromPosition(TextPosition(
                              affinity: TextAffinity.downstream,
                              offset: '${this._keyword}'.length)))),
                  style: TextStyle(color: Colors.white,fontSize: 17),
                  cursorColor: Colors.yellow,
                  // textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                    hintText: "搜索",
                    hintStyle: TextStyle(fontSize: 17,color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              
            )
          ],)
        ),
      ),
         actions: <Widget>[
           InkWell(
             highlightColor: Colors.transparent,
             radius: 0.0,
              onTap: ()
                {
                  print("cancel");
                  Navigator.push(context, MaterialPageRoute(
                        builder: (context) => DiscoverPage()));
                },
                child:Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    right: 10,
                  ),
                  child: Center(
                    child: Text("取消",
                  style: TextStyle(color: Colors.white,fontSize: 15.0)
                  ),
                  )
                ),
           )
         ],
       ),
        preferredSize: Size.fromHeight(76)
     ),
     body:   Container(
                      // top: 100,
                      
                      width: ScreenAdapter.getScreenPxWidth(),
                      height: ScreenAdapter.getScreenHeight(),
                      child:  Center(
                            child: Text("请检查您的网络，请求资源失败",
                            style: TextStyle(color: Colors.grey,fontSize: 18
                            ),
                            ),
                          )
                    ),
    );
      
    }
    if(this.flag == 2){
      print("无搜索结果");
      //无搜索结果
           return Scaffold(
        backgroundColor: const Color(0xFF1a1a1a),
        extendBody: true,
        appBar:  PreferredSize(
        child: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF1a1a1a),
          automaticallyImplyLeading:false,
          title: Container(
          // height: 160.0,
            margin: EdgeInsets.only(
              top: 20.0
              // left: 10,
              // right: 10,
            ),
      //  color:const Color(0xFF1a1a1a),
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
        ),
        color: Colors.black,
          child: Row(children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20
              ),
              height: 40,
              child: Center(
                child: new ImageIcon(AssetImage('images/search.png'), color: Colors.yellow,size:20),
              ),
            ),
            Container(
              child: Expanded(
                child: TextField(
                  autofocus: false,
                  onSubmitted: (value){
                    this._keyword = value;
                  },
                  onChanged: (value){
                    print("这个是 onChanged 时刻在监听，输出的信息是：${value}");
                    // this._keyword = value;
                    if(value !=null){
                       Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => SearchKeywordsPage(arguments:{
                                        'keywords':value
                                      }
                                          )));
                    }
                  },
                  controller: TextEditingController.fromValue(TextEditingValue(
                          text:  this._keyword == null ? "" : this._keyword,  //判断keyword是否为空
                          // 保持光标在最后

                          selection: TextSelection.fromPosition(TextPosition(
                              affinity: TextAffinity.downstream,
                              offset: '${this._keyword}'.length)))),
                  style: TextStyle(color: Colors.white,fontSize: 17),
                  cursorColor: Colors.yellow,
                  // textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                    hintText: "搜索",
                    hintStyle: TextStyle(fontSize: 17,color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              
            )
          ],)
        ),
      ),
         actions: <Widget>[
           InkWell(
             highlightColor: Colors.transparent,
             radius: 0.0,
              onTap: ()
                {
                  print("cancel");
                  Navigator.push(context, MaterialPageRoute(
                        builder: (context) => DiscoverPage()));
                },
                child:Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    right: 10,
                  ),
                  child: Center(
                    child: Text("取消",
                  style: TextStyle(color: Colors.white,fontSize: 15.0)
                  ),
                  )
                ),
           )
         ],
       ),
        preferredSize: Size.fromHeight(76)
     ),
     body:   Container(
                      // top: 100,
                      
                      width: ScreenAdapter.getScreenPxWidth(),
                      height: ScreenAdapter.getScreenHeight(),
                      child:  Center(
                            child: Text("没有相关的搜索结果",
                            style: TextStyle(color: Colors.grey,fontSize: 18
                            ),
                            ),
                          )
                    ),
    );
    }
    if(this.flag == 3){
      print("搜索结果");
      print(this.flag);
    return Scaffold(
        backgroundColor: const Color(0xFF1a1a1a),
        extendBody: true,
        appBar:  PreferredSize(
        child: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF1a1a1a),
          automaticallyImplyLeading:false,
          title: Container(
          // height: 160.0,
            margin: EdgeInsets.only(
              top: 20.0
              // left: 10,
              // right: 10,
            ),
      //  color:const Color(0xFF1a1a1a),
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
        ),
        color: Colors.black,
          child: Row(children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20
              ),
              height: 40,
              child: Center(
                child: new ImageIcon(AssetImage('images/search.png'), color: Colors.yellow,size:20),
              ),
            ),
            Container(
              child: Expanded(
                child: TextField(
                  autofocus: false,
                  onSubmitted: (value){
                    this._keyword = value;
                  },
                  onChanged: (value){
                    print("这个是 onChanged 时刻在监听，输出的信息是：${value}");
                    // this._keyword = value;
                    if(value !=null){
                       Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => SearchKeywordsPage(arguments:{
                                        'keywords':value
                                      }
                                          )));
                    }
                  },
                  controller: TextEditingController.fromValue(TextEditingValue(
                          text:  this._keyword == null ? "" : this._keyword,  //判断keyword是否为空
                          // 保持光标在最后

                          selection: TextSelection.fromPosition(TextPosition(
                              affinity: TextAffinity.downstream,
                              offset: '${this._keyword}'.length)))),
                  style: TextStyle(color: Colors.white,fontSize: 17),
                  cursorColor: Colors.yellow,
                  // textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                    hintText: "搜索",
                    hintStyle: TextStyle(fontSize: 17,color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              
            )
          ],)
        ),
      ),
         actions: <Widget>[
           InkWell(
             highlightColor: Colors.transparent,
             radius: 0.0,
              onTap: ()
                {
                  print("cancel");
                  Navigator.push(context, MaterialPageRoute(
                        builder: (context) => DiscoverPage()));
                },
                child:Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    right: 10,
                  ),
                  child: Center(
                    child: Text("取消",
                  style: TextStyle(color: Colors.white,fontSize: 15.0)
                  ),
                  )
                ),
           )
         ],
       ),
        preferredSize: Size.fromHeight(76)
     ),
     body:  
     ScrollConfiguration(
      behavior: OverScrollBehavior(),
      child:ListView(
      children: <Widget>[
        Container(
             margin: EdgeInsets.only(
                 top: 10,
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
                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => SearchSongsPage(arguments:{
                                        'keywords':this._keyword
                        }
                  )));
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
                         child: Text("歌曲",
                         style: TextStyle(color: Colors.grey,fontSize: 17),
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
        Container(
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
                                            imageUrl: 'https://dss0.baidu.com/73x1bjeh1BF3odCf/it/u=3897881305,2890300930&fm=85&s=68A48D53A8E2C69460B4E8BA0300E060',
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
                                    child: Text("喜欢你",
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                                    ),
                                  ),
                                  Positioned(
                                    left: 75,
                                    bottom: 8,
                                    child: Text("G.E.M.邓紫棋",
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
                      ),
                      Container(
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
                                            imageUrl: 'https://dss0.bdstatic.com/6Ox1bjeh1BF3odCf/it/u=1564480147,311633522&fm=74&app=80&f=JPEG&size=f121,121?sec=1880279984&t=9162410f83ac15243e780a850cb276ad',
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
                                    child: Text("喜欢你",
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                                    ),
                                  ),
                                  Positioned(
                                    left: 75,
                                    bottom: 8,
                                    child: Text("秘密警察-BEYOND",
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
                      ),
                      Container(
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
                                            imageUrl: 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=985131631,2485574825&fm=26&gp=0.jpg',
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
                                    child: Text("喜欢你",
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                                    ),
                                  ),
                                  Positioned(
                                    left: 75,
                                    bottom: 8,
                                    child: Text("TFBOYS",
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
                      ),
        // ScrollConfiguration(
        //         behavior: OverScrollBehavior(),
        //           // child: 3>0
        //         child:ListView.builder(
        //           shrinkWrap: true,
        //           physics:NeverScrollableScrollPhysics(),//禁用滑动事件
        //           itemBuilder: (BuildContext context, int index) {
        //             // print("object");
        //             return Container(
        //                 margin: EdgeInsets.only(
        //                       //  top: 10,
        //                       left: 15,
        //                       right: 15,
        //                       bottom: 15,
        //                   ),
        //                   height: 60,
        //                   child: InkWell(
        //                     highlightColor: Colors.transparent,
        //                     radius: 0.0,
        //                     onTap: (){
        //                       print("点击了某首歌");
        //                     },
        //                     child: Stack(
        //                         children: <Widget>[
        //                           Positioned(
        //                             left: 0,
        //                             child: Container(
        //                                   width: 60.0,
        //                                   height: 60.0,
        //                                   decoration: BoxDecoration(
        //                                     shape: BoxShape.rectangle,
        //                                     borderRadius: BorderRadius.circular(8.0),
        //                                     image: DecorationImage(
        //                                                             // image: ,
        //                                                             // this.searchSuggest.result != null
        //                                                             //      ?new NetworkImage('${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',)
        //                                                                 image:new AssetImage('images/image_start.png',),
        //                                                             //      :new AssetImage('images/logo_moomusic.png',),

        //                                                             fit: BoxFit.cover,
        //                                     ),
        //                                 ),
        //                                 // child:CachedNetworkImage(
        //                                 //      width: 60.0,
        //                                 //      height: 60.0,
        //                                 //     fit: BoxFit.cover,
        //                                 //     imageUrl: '${searchSuggest.result.songs[index].artists[0].img1v1Url}',
        //                                 //     // imageUrl: '${searchSuggest.result.songs[index].artists[0].img1v1Url}',
        //                                 //     placeholder: (context, url) =>  Container(
        //                                 //                         width: 60.0,
        //                                 //                         height: 60.0,
        //                                 //                         decoration: BoxDecoration(
        //                                 //                           shape: BoxShape.rectangle,
        //                                 //                           borderRadius: BorderRadius.circular(8.0),
        //                                 //                           image: DecorationImage(
        //                                 //                             // image: ,
        //                                 //                             // this.searchSuggest.result != null
        //                                 //                             //      ?new NetworkImage('${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',)
        //                                 //                                 image:new AssetImage('images/image_start.png',),
        //                                 //                             //      :new AssetImage('images/logo_moomusic.png',),

        //                                 //                             fit: BoxFit.cover,
        //                                 //                           ),
        //                                 //                       ),),
        //                                 //     errorWidget: (context, url, error) => Icon(Icons.error),
        //                                 //   ),
        //                               )
        //                           ),
        //                           Positioned(
        //                             left: 75,
        //                             top: 8,
        //                             child: Text("喜欢你",
        //                             style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
        //                             ),
        //                           ),
        //                           Positioned(
        //                             left: 75,
        //                             bottom: 8,
        //                             child: Text("邓紫棋",
        //                             style: TextStyle(color: Colors.grey,fontSize: 15),
        //                             ),
        //                           ),
        //                           Positioned(
        //                             right: 0,
        //                             top: 20,
        //                             child: new ImageIcon(AssetImage('images/extra.png'), color: Colors.grey,size:20),
        //                           )
        //                         ],
        //                       ),
        //                   )
        //               );
        //           },
        //           itemCount: 3,
        //           // itemCount: this.searchSuggest.result.songs.length,
        //         )
        //         // :Container(width: 0,height: 0),
        //       ),
        
        Container(
             margin: EdgeInsets.only(
               top: 20,
                 left: 15,
                 right: 15,
              ),
             child: Column(children: <Widget>[
             InkWell(
               highlightColor: Colors.transparent,
               radius: 0.0,
               onTap: (){
                 print("MV");
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
                         child: Text("MV",
                         style: TextStyle(color: Colors.grey,fontSize: 17),
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
               Container(
           margin: EdgeInsets.only(
                //  top: 10,
                 left: 15,
                 right: 15,
                 bottom: 15,
            ),
            height: 65,
            child: InkWell(
              highlightColor: Colors.transparent,
              radius: 0.0,
              onTap: (){
                print("点击了某视频");
              },
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    top: 5,
                    child: Container(
                          width: 90.0,
                          height: 55.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                            
                        ),
                        child:CachedNetworkImage(
                            width: 90,
                            height: 55.0,
                            fit: BoxFit.cover,
                            // imageUrl: '${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',
                            // imageUrl: 'http://dmimg.5054399.com/allimg/pkm/pk/22.jpg',
                            imageUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599755341185&di=c3587ddf98351ef78dd7b499c845cd4d&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fpic%2F9%2F13%2F40ae3a9761.jpg%3Fdown',

                            placeholder: (context, url) =>  Container(
                                                width: 90.0,
                                                height: 55.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius: BorderRadius.circular(8.0),
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
                    left: 105,
                    top: 9,
                    child: Text("喜欢你（2016东方卫视春晚）",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                  ),
                  Positioned(
                    left: 105,
                    bottom: 9,
                    child: Text("G.E.M.邓紫棋",
                    style: TextStyle(color: Colors.grey,fontSize: 15),
                    ),
                  ),
                ],
              ),
            )
        ),
        Container(
           margin: EdgeInsets.only(
                //  top: 10,
                 left: 15,
                 right: 15,
                 bottom: 15,
            ),
            height: 65,
            child: InkWell(
              highlightColor: Colors.transparent,
              radius: 0.0,
              onTap: (){
                print("点击了某视频");
              },
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    top: 5,
                    child: Container(
                          width: 90.0,
                          height: 55.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                            
                        ),
                        child:CachedNetworkImage(
                            width: 90,
                            height: 55.0,
                            fit: BoxFit.cover,
                            // imageUrl: '${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',
                            // imageUrl: 'http://dmimg.5054399.com/allimg/pkm/pk/22.jpg',
                            imageUrl: 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1819845908,3991056876&fm=15&gp=0.jpg',

                            placeholder: (context, url) =>  Container(
                                                width: 90.0,
                                                height: 55.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius: BorderRadius.circular(8.0),
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
                    left: 105,
                    top: 9,
                    child: Text("喜欢你（2019喜气洋洋闹元宵）",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                  ),
                  Positioned(
                    left: 105,
                    bottom: 9,
                    child: Text("TEBOYS",
                    style: TextStyle(color: Colors.grey,fontSize: 15),
                    ),
                  ),
                ],
              ),
            )
        ),
        Container(
           margin: EdgeInsets.only(
                //  top: 10,
                 left: 15,
                 right: 15,
                 bottom: 15,
            ),
            height: 65,
            child: InkWell(
              highlightColor: Colors.transparent,
              radius: 0.0,
              onTap: (){
                print("点击了某视频");
              },
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    top: 5,
                    child: Container(
                          width: 90.0,
                          height: 55.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                           
                        ),
                        child:CachedNetworkImage(
                            width: 90,
                            height: 55.0,
                            fit: BoxFit.cover,
                            // imageUrl: '${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',
                            // imageUrl: 'http://dmimg.5054399.com/allimg/pkm/pk/22.jpg',
                            imageUrl: 'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=972578239,1566823102&fm=26&gp=0.jpg',

                            placeholder: (context, url) =>  Container(
                                                width: 90.0,
                                                height: 55.0,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  borderRadius: BorderRadius.circular(8.0),
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
                    left: 105,
                    top: 9,
                    child: Text("喜欢你（慈善演唱会）",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                  ),
                  Positioned(
                    left: 105,
                    bottom: 9,
                    child: Text("G.E.M邓紫棋",
                    style: TextStyle(color: Colors.grey,fontSize: 15),
                    ),
                  ),
                ],
              ),
            )
        ),
        // ScrollConfiguration(
        //         behavior: OverScrollBehavior(),
        //           // child: 3>0
        //         child:ListView.builder(
        //           shrinkWrap: true,
        //           physics:NeverScrollableScrollPhysics(),//禁用滑动事件
        //           itemBuilder: (BuildContext context, int index) {
        //             print("object");
        //             return Container(
        //    margin: EdgeInsets.only(
        //         //  top: 10,
        //          left: 15,
        //          right: 15,
        //          bottom: 15,
        //     ),
        //     height: 65,
        //     child: InkWell(
        //       highlightColor: Colors.transparent,
        //       radius: 0.0,
        //       onTap: (){
        //         print("点击了某视频");
        //       },
        //       child: Stack(
        //         children: <Widget>[
        //           Positioned(
        //             left: 0,
        //             top: 5,
        //             child: Container(
        //                   width: 90.0,
        //                   height: 55.0,
        //                   decoration: BoxDecoration(
        //                     shape: BoxShape.rectangle,
        //                     borderRadius: BorderRadius.circular(8.0),
        //                     image: DecorationImage(
        //                       image: new AssetImage('images/image_start.png'),
        //                       fit: BoxFit.cover,
        //                     ),
        //                 ),
        //                 // child:CachedNetworkImage(
        //                 //     width: 90,
        //                 //     height: 55.0,
        //                 //     fit: BoxFit.cover,
        //                 //     // imageUrl: '${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',
        //                 //     // imageUrl: 'http://dmimg.5054399.com/allimg/pkm/pk/22.jpg',
        //                 //     imageUrl: '${this.searchSuggest.result.mv[index].artists[0].img1v1Url}',

        //                 //     placeholder: (context, url) =>  Container(
        //                 //                         width: 90.0,
        //                 //                         height: 55.0,
        //                 //                         decoration: BoxDecoration(
        //                 //                           shape: BoxShape.rectangle,
        //                 //                           borderRadius: BorderRadius.circular(8.0),
        //                 //                           image: DecorationImage(
        //                 //                                image:new AssetImage('images/image_start.png',),
        //                 //                             fit: BoxFit.cover,
        //                 //                           ),
        //                 //                       ),),
        //                 //     errorWidget: (context, url, error) => Icon(Icons.error),
        //                 //   ),
        //               )
        //           ),
        //           Positioned(
        //             left: 105,
        //             top: 9,
        //             child: Text("日落大道",
        //             style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
        //             ),
        //           ),
        //           Positioned(
        //             left: 105,
        //             bottom: 9,
        //             child: Text("迷藏-梁博",
        //             style: TextStyle(color: Colors.grey,fontSize: 15),
        //             ),
        //           ),
        //         ],
        //       ),
        //     )
        // );
        //           },
        //           itemCount: 3,
        //           // itemCount: this.searchSuggest.result.mv.length,
        //         )
        //         // :Container(width: 0,height: 0),
        //         // :Text("")
        //       ),

        Container(
             margin: EdgeInsets.only(
               top: 20,
                 left: 15,
                 right: 15,
              ),
             child: Column(children: <Widget>[
             InkWell(
               highlightColor: Colors.transparent,
               radius: 0.0,
               onTap: (){
                 print("歌手");
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
                         child: Text("歌手",
                         style: TextStyle(color: Colors.grey,fontSize: 17),
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
              Container(
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
                print("点击了某歌手");
              },
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    child: Container(
                          width: 60.0,
                          height: 60.0,
                           decoration: BoxDecoration(
                              shape: BoxShape.circle,
                               
                          ),

                         child:CachedNetworkImage(
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                            // imageUrl: '${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',
                            imageUrl: 'https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2949975857,78728844&fm=26&gp=0.jpg',
                            placeholder: (context, url) =>  Container(
                                               width: 60.0,
                                                height: 60.0,
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
                    left: 75,
                    top: 8,
                    child: Text("TFBOYS",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                  ),
                  Positioned(
                    left: 75,
                    bottom: 8,
                    child: Text("单曲:111 专辑:40 视频:618",
                    style: TextStyle(color: Colors.grey,fontSize: 15),
                    ),
                  ),
                ],
              ),
            )
        ),
              Container(
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
                print("点击了某歌手");
              },
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    child: Container(
                          width: 60.0,
                          height: 60.0,
                           decoration: BoxDecoration(
                              shape: BoxShape.circle,
                          ),

                         child:CachedNetworkImage(
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                            // imageUrl: '${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',
                            imageUrl: 'https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1089756854,2389385839&fm=26&gp=0.jpg',
                            placeholder: (context, url) =>  Container(
                                               width: 60.0,
                                                height: 60.0,
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
                    left: 75,
                    top: 8,
                    child: Text("BEYOND",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                  ),
                  Positioned(
                    left: 75,
                    bottom: 8,
                    child: Text("单曲:1123 专辑:101 视频:618",
                    style: TextStyle(color: Colors.grey,fontSize: 15),
                    ),
                  ),
                ],
              ),
            )
        ),
              Container(
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
                print("点击了某歌手");
              },
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    child: Container(
                          width: 60.0,
                          height: 60.0,
                           decoration: BoxDecoration(
                              shape: BoxShape.circle,
                               
                          ),

                         child:CachedNetworkImage(
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                            // imageUrl: '${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',
                            imageUrl: 'https://dss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1230934419,365997585&fm=26&gp=0.jpg',
                            placeholder: (context, url) =>  Container(
                                               width: 60.0,
                                                height: 60.0,
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
                    left: 75,
                    top: 8,
                    child: Text("G.E.M.邓紫棋",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                  ),
                  Positioned(
                    left: 75,
                    bottom: 8,
                    child: Text("单曲:311 专辑:49 视频:618",
                    style: TextStyle(color: Colors.grey,fontSize: 15),
                    ),
                  ),
                ],
              ),
            )
        ),
                 
        // ScrollConfiguration(
        //         behavior: OverScrollBehavior(),
        //         // child: 3>0
        //         child:ListView.builder(
        //           shrinkWrap: true,
        //           physics:NeverScrollableScrollPhysics(),//禁用滑动事件
        //           itemBuilder: (BuildContext context, int index) {
        //             print("object");
        //             return  Container(
        //    margin: EdgeInsets.only(
        //         //  top: 10,
        //          left: 15,
        //          right: 15,
        //          bottom: 15,
        //     ),
        //     height: 60,
        //     child: InkWell(
        //       highlightColor: Colors.transparent,
        //       radius: 0.0,
        //       onTap: (){
        //         print("点击了某歌手");
        //       },
        //       child: Stack(
        //         children: <Widget>[
        //           Positioned(
        //             left: 0,
        //             child: Container(
        //                   width: 60.0,
        //                   height: 60.0,
        //                    decoration: BoxDecoration(
        //                       shape: BoxShape.circle,
        //                        image: DecorationImage(
        //                                           image:new AssetImage('images/image_start.png',),

        //                                             fit: BoxFit.cover,
        //                                           ),
        //                   ),

        //                 //  child:CachedNetworkImage(
        //                 //     width: 90,
        //                 //     height: 90,
        //                 //     fit: BoxFit.cover,
        //                 //     // imageUrl: '${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',
        //                 //     imageUrl: 'http://dmimg.5054399.com/allimg/pkm/pk/22.jpg',
        //                 //     placeholder: (context, url) =>  Container(
        //                 //                        width: 60.0,
        //                 //                         height: 60.0,
        //                 //                         decoration: BoxDecoration(
        //                 //                           shape: BoxShape.circle,
        //                 //                           image: DecorationImage(
        //                 //                           image:new AssetImage('images/image_start.png',),

        //                 //                             fit: BoxFit.cover,
        //                 //                           ),
        //                 //                       ),),
        //                 //     errorWidget: (context, url, error) => Icon(Icons.error),
        //                 //   ),
                            
        //                )
        //           ),
        //           Positioned(
        //             left: 75,
        //             top: 8,
        //             child: Text("梁博",
        //             style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
        //             ),
        //           ),
        //           Positioned(
        //             left: 75,
        //             bottom: 8,
        //             child: Text("单曲:99 专辑:10 视频:7",
        //             style: TextStyle(color: Colors.grey,fontSize: 15),
        //             ),
        //           ),
        //         ],
        //       ),
        //     )
        // );
        //           },
        //           itemCount: 3,
        //           // itemCount: this.searchSuggest.result.artists.length,
        //         )
        //         // :Container(width: 0,height: 0),
        //       ),
        
        Container(
             margin: EdgeInsets.only(
               top: 20,
                 left: 15,
                 right: 15,
              ),
             child: Column(children: <Widget>[
             InkWell(
               highlightColor: Colors.transparent,
               radius: 0.0,
               onTap: (){
                 print("专辑");
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
                         child: Text("专辑",
                         style: TextStyle(color: Colors.grey,fontSize: 17),
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
        Container(
           margin: EdgeInsets.only(
                //  top: 10,
                 left: 15,
                 right: 15,
                 bottom: 15,
            ),
            height: 90,
            child: InkWell(
              highlightColor: Colors.transparent,
              radius: 0.0,
              onTap: (){
                print("点击了某专辑");
                // print("点击了某专辑${this.searchSuggest.result.artists}");
              },
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 23,
                    top: 5,
                    child: Container(
                          width: 80.0,
                          height: 80.0,
                         child: CircleAvatar(
                              //头像半径
                              radius: 30,
                              backgroundColor: Colors.white,
                              //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                              backgroundImage: AssetImage(
                                'images/zhuanpan.png'
                              ),
                            ),
                       )
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                          width: 90.0,
                          height: 90.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                            
                        ),
                         child:CachedNetworkImage(
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                            // imageUrl: '${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',
                            imageUrl: 'https://dss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=4111703392,859635842&fm=179&app=42&f=JPEG?w=150&h=150',
                            placeholder: (context, url) =>  Container(
                                                width: 90.0,
                                                height: 90.0,
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
                    left: 118,
                    top: 22,
                    child: Text("喜欢你",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                  ),
                  Positioned(
                    left: 118,
                    bottom: 22,
                    // child: Text("${this.searchSuggest.result.albums[index].artist[0].name}",
                    child: Text("TFBOYS",
                    style: TextStyle(color: Colors.grey,fontSize: 15),
                    ),
                  ),
                ],
              ),
            )
        ),
        Container(
           margin: EdgeInsets.only(
                //  top: 10,
                 left: 15,
                 right: 15,
                 bottom: 15,
            ),
            height: 90,
            child: InkWell(
              highlightColor: Colors.transparent,
              radius: 0.0,
              onTap: (){
                print("点击了某专辑");
                // print("点击了某专辑${this.searchSuggest.result.artists}");
              },
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 23,
                    top: 5,
                    child: Container(
                          width: 80.0,
                          height: 80.0,
                         child: CircleAvatar(
                              //头像半径
                              radius: 30,
                              backgroundColor: Colors.white,
                              //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                              backgroundImage: AssetImage(
                                'images/zhuanpan.png'
                              ),
                            ),
                       )
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                          width: 90.0,
                          height: 90.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                             
                        ),
                         child:CachedNetworkImage(
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                            // imageUrl: '${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',
                            imageUrl: 'https://dss1.bdstatic.com/6OF1bjeh1BF3odCf/it/u=845734290,2154313104&fm=74&app=80&f=PNG&size=f121,121?sec=1880279984&t=1f216de07efe7743dd10a2811c0c848c',
                            placeholder: (context, url) =>  Container(
                                                width: 90.0,
                                                height: 90.0,
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
                    left: 118,
                    top: 22,
                    child: Text("喜欢你",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                  ),
                  Positioned(
                    left: 118,
                    bottom: 22,
                    // child: Text("${this.searchSuggest.result.albums[index].artist[0].name}",
                    child: Text("G.E.M.邓紫棋",
                    style: TextStyle(color: Colors.grey,fontSize: 15),
                    ),
                  ),
                ],
              ),
            )
        ),
        Container(
           margin: EdgeInsets.only(
                //  top: 10,
                 left: 15,
                 right: 15,
                 bottom: 15,
            ),
            height: 90,
            child: InkWell(
              highlightColor: Colors.transparent,
              radius: 0.0,
              onTap: (){
                print("点击了某专辑");
                // print("点击了某专辑${this.searchSuggest.result.artists}");
              },
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 23,
                    top: 5,
                    child: Container(
                          width: 80.0,
                          height: 80.0,
                         child: CircleAvatar(
                              //头像半径
                              radius: 30,
                              backgroundColor: Colors.white,
                              //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                              backgroundImage: AssetImage(
                                'images/zhuanpan.png'
                              ),
                            ),
                       )
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                          width: 90.0,
                          height: 90.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                        ),
                         child:CachedNetworkImage(
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                            // imageUrl: '${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',
                            imageUrl: 'https://bkimg.cdn.bcebos.com/pic/060828381f30e924329525c049086e061d95f70a?x-bce-process=image/resize,m_lfit,w_268,limit_1/format,f_jpg',
                            placeholder: (context, url) =>  Container(
                                                width: 90.0,
                                                height: 90.0,
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
                    left: 118,
                    top: 22,
                    child: Text("喜欢你（藏语版）",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                    ),
                  ),
                  Positioned(
                    left: 118,
                    bottom: 22,
                    // child: Text("${this.searchSuggest.result.albums[index].artist[0].name}",
                    child: Text("边巴德吉",
                    style: TextStyle(color: Colors.grey,fontSize: 15),
                    ),
                  ),
                ],
              ),
            )
        ),
        // ScrollConfiguration(
        //         behavior: OverScrollBehavior(),
        //           // child: 3>0
        //         child:ListView.builder(
        //           shrinkWrap: true,
        //           physics:NeverScrollableScrollPhysics(),//禁用滑动事件
        //           itemBuilder: (BuildContext context, int index) {
        //             print("object");
        //             return  Container(
        //    margin: EdgeInsets.only(
        //         //  top: 10,
        //          left: 15,
        //          right: 15,
        //          bottom: 15,
        //     ),
        //     height: 90,
        //     child: InkWell(
        //       highlightColor: Colors.transparent,
        //       radius: 0.0,
        //       onTap: (){
        //         print("点击了某专辑");
        //         // print("点击了某专辑${this.searchSuggest.result.artists}");
        //       },
        //       child: Stack(
        //         children: <Widget>[
        //           Positioned(
        //             left: 23,
        //             top: 5,
        //             child: Container(
        //                   width: 80.0,
        //                   height: 80.0,
        //                  child: CircleAvatar(
        //                       //头像半径
        //                       radius: 30,
        //                       backgroundColor: Colors.white,
        //                       //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
        //                       backgroundImage: AssetImage(
        //                         'images/zhuanpan.png'
        //                       ),
        //                     ),
        //                )
        //           ),
        //           Positioned(
        //             left: 0,
        //             child: Container(
        //                   width: 90.0,
        //                   height: 90.0,
        //                   decoration: BoxDecoration(
        //                     shape: BoxShape.rectangle,
        //                     borderRadius: BorderRadius.circular(8.0),
        //                      image: DecorationImage(
        //                                             // image: ,
        //                                             // this.searchSuggest.result != null
        //                                             //      ?new NetworkImage('${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',)
        //                                                 image:new AssetImage('images/image_start.png',),
        //                                             //      :new AssetImage('images/logo_moomusic.png',),

        //                                             fit: BoxFit.cover,
        //                                           ),
        //                 ),
        //                 //  child:CachedNetworkImage(
        //                 //     width: 90,
        //                 //     height: 90,
        //                 //     fit: BoxFit.cover,
        //                 //     // imageUrl: '${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',
        //                 //     imageUrl: 'http://dmimg.5054399.com/allimg/pkm/pk/22.jpg',
        //                 //     placeholder: (context, url) =>  Container(
        //                 //                         width: 90.0,
        //                 //                         height: 90.0,
        //                 //                         decoration: BoxDecoration(
        //                 //                           shape: BoxShape.rectangle,
        //                 //                           borderRadius: BorderRadius.circular(8.0),
        //                 //                           image: DecorationImage(
        //                 //                             // image: ,
        //                 //                             // this.searchSuggest.result != null
        //                 //                             //      ?new NetworkImage('${this.searchSuggest.result.albums[index].artists[0].img1v1Url}',)
        //                 //                                 image:new AssetImage('images/image_start.png',),
        //                 //                             //      :new AssetImage('images/logo_moomusic.png',),

        //                 //                             fit: BoxFit.cover,
        //                 //                           ),
        //                 //                       ),),
        //                 //     errorWidget: (context, url, error) => Icon(Icons.error),
        //                 //   ),
        //               )
        //           ),
        //           Positioned(
        //             left: 118,
        //             top: 22,
        //             child: Text("出现又离开",
        //             style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
        //             ),
        //           ),
        //           Positioned(
        //             left: 118,
        //             bottom: 22,
        //             // child: Text("${this.searchSuggest.result.albums[index].artist[0].name}",
        //             child: Text("梁博",
        //             style: TextStyle(color: Colors.grey,fontSize: 15),
        //             ),
        //           ),
        //         ],
        //       ),
        //     )
        // );
        //           },
        //           itemCount: 3,
        //           // itemCount: this.searchSuggest.result.albums.length,
        //         )
        //         // :Container(width: 0,height: 0),
        //       ),
    
    ],
    ),
    ));
    }
     return Scaffold(
        backgroundColor: const Color(0xFF1a1a1a),
        extendBody: true,
        appBar:  PreferredSize(
        child: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF1a1a1a),
          automaticallyImplyLeading:false,
          title: Container(
          // height: 160.0,
            margin: EdgeInsets.only(
              top: 20.0
              // left: 10,
              // right: 10,
            ),
      //  color:const Color(0xFF1a1a1a),
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
        ),
        color: Colors.black,
          child: Row(children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20
              ),
              height: 40,
              child: Center(
                child: new ImageIcon(AssetImage('images/search.png'), color: Colors.yellow,size:20),
              ),
            ),
            Container(
              child: Expanded(
                child: TextField(
                  autofocus: false,
                  onSubmitted: (value){
                    this._keyword = value;
                  },
                  onChanged: (value){
                    print("这个是 onChanged 时刻在监听，输出的信息是：${value}");
                    // this._keyword = value;
                    if(value !=null){
                       Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => SearchKeywordsPage(arguments:{
                                        'keywords':value
                                      }
                                          )));
                    }
                  },
                  controller: TextEditingController.fromValue(TextEditingValue(
                          text:  this._keyword == null ? "" : this._keyword,  //判断keyword是否为空
                          // 保持光标在最后

                          selection: TextSelection.fromPosition(TextPosition(
                              affinity: TextAffinity.downstream,
                              offset: '${this._keyword}'.length)))),
                  style: TextStyle(color: Colors.white,fontSize: 17),
                  cursorColor: Colors.yellow,
                  // textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                    hintText: "搜索",
                    hintStyle: TextStyle(fontSize: 17,color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              
            )
          ],)
        ),
      ),
         actions: <Widget>[
           InkWell(
             highlightColor: Colors.transparent,
             radius: 0.0,
              onTap: ()
                {
                  print("cancel");
                  Navigator.push(context, MaterialPageRoute(
                        builder: (context) => DiscoverPage()));
                },
                child:Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    right: 10,
                  ),
                  child: Center(
                    child: Text("取消",
                  style: TextStyle(color: Colors.white,fontSize: 15.0)
                  ),
                  )
                ),
           )
         ],
       ),
        preferredSize: Size.fromHeight(76)
     ),
     body:   Container(
                      // top: 100,
                      
                      width: ScreenAdapter.getScreenPxWidth(),
                      height: ScreenAdapter.getScreenHeight(),
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
                    ),
    );
  }
}
