import 'package:flutter/material.dart';
import 'package:studio/pages/tabs/discoverPage.dart';
import 'package:studio/services/historyService.dart';
import 'package:dio/dio.dart';
import 'package:studio/config/config.dart';
import 'package:studio/services/screenAdpter.dart';
import 'package:studio/pages/tabs/searchResultPage.dart';
import 'package:studio/pages/tabs/searchKeywordsPage.dart';
import 'package:studio/pages/tabs/searchSongsPage.dart';

class SearchPage extends StatefulWidget{
  @override
  final Map arguments;
  const SearchPage({Key key, this.arguments}) : super(key: key);
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TheSearchPage(arguments:arguments);
  }
  
}
class TheSearchPage extends State<SearchPage> with TickerProviderStateMixin{
  Map arguments;
  TheSearchPage({this.arguments});
  var _keyword = "";
  var  _historySearchList = [];
  // List<String> _historySearchList = await future;
  // List<String> categoryNames = new ArrayList<>();
        var _isPlay = true;
  AnimationController controller;
  Animation animation;
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getHistorySearchList();
    setState(() {
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
  // Map arguments;
  // MyMoo({this.arguments});
  void pauseSong(){
    
    controller.dispose();
    // print("shifang");
    // super.dispose();
    setState(() {
      _isPlay = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  autofocus: true,
                  onSubmitted: (value){
                    if(value !=""){
                       print("onSubmitted 点击了键盘的确定按钮，输出的信息是：${value}");
                    this._keyword = value;
                    HistoryService.setHistoryData(value);
                    _getHistorySearchList();
                    print("     1111 ${this._historySearchList}");
                      Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => SearchResultPage(arguments:{
                                        'keywords':value
                                      }
                                          )));
                    }
                  },
                  // onEditingComplete: (){
                  //     print("onEditingComplete 点击了键盘的确定按钮");
                  //     // HistoryService.setHistoryData("${value}");
                  //     // this._keyword = value;
                  // },
                  onChanged: (value){
                    print("这个是 onChanged 时刻在监听，输出的信息是：${value}");
                    this._keyword = value;
                    if(value != null){
                      //跳转到搜索关键词页面
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
     body:  Wrap(
       children: <Widget>[
        
         Container(
           margin: EdgeInsets.only(
            //  right: (ScreenAdapter.getScreenWidth()/2),
             top: 20,
             bottom: 20,
             left: 20,
           ),
           child: Text("最近搜索",
             style: TextStyle(color: Colors.grey,fontSize: 17),
             textAlign: TextAlign.left,
           ),
         ), 
         //将ListView用ScrollConfiguration包裹
          ScrollConfiguration(
                    behavior: OverScrollBehavior(),
                    child: Container(
                // height: this._historySearchList.length > 10 ? 400: this._historySearchList.length*40.0,
                // margin: EdgeInsets.only(
                //   top: 60
                // ),
                child: this._historySearchList.length>0
                ?ListView.builder(
                  shrinkWrap: true,
                  physics:NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    print("object");
                    return Container(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 20,
                            width: ScreenAdapter.getScreenWidth()-60,
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              radius: 0.0,
                              onTap: (){
                                print("search");
                                 Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => SearchSongsPage(arguments:{
                                        'keywords':this._historySearchList[index]
                                      }
                                          )));
                              },
                              child: Text(this._historySearchList[index],
                                style: TextStyle(color: Colors.white,fontSize: 17),
                                textAlign: TextAlign.left,
                              ),
                            )
                          ),
                          Positioned(
                            right: 20,
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              radius: 0.0,
                              onTap: (){
                                this._historySearchList.removeAt(index);
                                HistoryService.removeHistoryDataByKeywords(this._historySearchList[index]);
                                setState(() {});
                              },
                              child: new ImageIcon(AssetImage('images/deleteItem.png'), color: Colors.grey,size:18),
                            ),
                          )
                        ],
                      ),
                      height: 40,
                      alignment: Alignment.center,
                    );
                  },
                  itemCount: this._historySearchList.length > 10 ? 10 : this._historySearchList.length,
                ):Text("")
              ),
            ),
               Container(
           margin: EdgeInsets.only(
             top: 20,
             bottom: 8,
           ),
           child:  InkWell(
             highlightColor: Colors.transparent,
             radius: 0.0,
             onTap: (){
               print("clear");
               HistoryService.clearHistoryList();
             },
             child: Row(
               children: <Widget>[
                 Container(
                   margin: EdgeInsets.only(
                     left: ScreenAdapter.getScreenWidth()/2-30,
                     right: 10,
                   ),
                   child:new ImageIcon(AssetImage('images/delete.png'), color: Colors.grey,size:20) ,
                 ),
                 
                 Text("清除历史",
                    style: TextStyle(color: Colors.grey,fontSize: 15),
                    textAlign: TextAlign.right,)
               ],
             ),
           )
         ),
        
       ],
     ),
    );
  }
  //获取搜索关键字
 _getKeyWords() async{

 }
   //获取搜索历史
  //iconType 0: 没有icon  1:Hot  2：New  5:上升icon
  _getHistorySearchList() async {
    // var api = "${Config.domain}search/hot/detail";
    // var result = await Dio().get(api);
    // var hotSearchDetailList =
    //     SearchHotDetailListModel.fromJson(result.data).data;
    List historySearchList = await HistoryService.getHistoryList();
    if(this._historySearchList.length >= 10){
      HistoryService.removeHistoryDataById(0);
      setState(() {
        this._historySearchList = historySearchList.sublist(1);
      });
    }else{
      setState(() {
        this._historySearchList = historySearchList;
      });
    }
    print(historySearchList);
    print("热搜榜详情列表：${this._historySearchList}");
  }

}
class OverScrollBehavior extends ScrollBehavior{
 
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return child;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return GlowingOverscrollIndicator(
          child: child,
          //不显示头部水波纹
          showLeading: false,
          //不显示尾部水波纹
          showTrailing: false,
          axisDirection: axisDirection,
          color: Theme.of(context).accentColor,
        );
    }
    return null;
  }
 
}
// Container(
            //   child: this._historySearchList.length > 0
            //         ? Wrap(
            //             children: this._historySearchList.map((value) {
            //               // print
            //               print(value);
            //                 return Container(
            //                   margin: EdgeInsets.only(
            //                     left: 20,
            //                     top: 8,
            //                     bottom: 8,
            //                   ),
            //                   child: Text(value,
            //                     style: TextStyle(color: Colors.white,fontSize: 17),
            //                   ),
            //                 );
            //               },
            // ).toList()
            // ):Text("1111111")),
            
            // ListView.builder(
            //   padding:EdgeInsets.only(
            //           left: 20,
            //           top: 8,
            //           bottom: 8,
            //   ),
            //   itemExtent:30,
            //   itemCount: this._historySearchList.length, //条目的个数
            //   itemBuilder: (BuildContext context, int index) {
            //     print("1111111");
            //     return Container(
            //         child: Text(this._historySearchList[index],
            //           style: TextStyle(color: Colors.white,fontSize: 17),
            //         ),
            //       );
            //   }),