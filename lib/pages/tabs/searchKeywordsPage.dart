import 'package:flutter/material.dart';
import 'package:studio/pages/tabs/discoverPage.dart';
import 'package:dio/dio.dart';
import 'package:studio/config/config.dart';
import 'package:studio/services/screenAdpter.dart';
import 'package:studio/pages/tabs/searchPage.dart';
import 'package:studio/services/historyService.dart';
import 'package:studio/pages/tabs/searchResultPage.dart';

class SearchKeywordsPage extends StatefulWidget{
  final Map arguments;
  const SearchKeywordsPage({Key key, this.arguments}) : super(key: key);
  @override
  State<StatefulWidget> createState() =>SearchKeyword(arguments:arguments);
  
}
class SearchKeyword extends State<SearchKeywordsPage>{
  @override
  Map arguments;
  var _keyword = "";
  var  _historySearchList = [];
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getHistorySearchList();
    setState(() {
      this._keyword = arguments['keywords'];
    });
  }
  SearchKeyword({this.arguments});
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
                    // print("onSubmitted 点击了键盘的确定按钮，输出的信息是：${value}");
                    this._keyword = value;
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
                    // this._keyword = value;
                    if(value ==null || value == ""){
                       Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => SearchPage(arguments:{
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
     body:  Column(
       children: <Widget>[
         Container(
           margin: EdgeInsets.all(6),
         ),
         ScrollConfiguration(
                    behavior: OverScrollBehavior(),
                    child: Container(
                height: this._historySearchList.length > 10 ? 400: (this._historySearchList.length)*40.0,
                child: this._historySearchList.length>0
                ?ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    print("object");
                    return Container(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 30,
                            width: ScreenAdapter.getScreenWidth()-60,
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              radius: 0.0,
                              onTap: (){
                                print("search");
                                 Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => SearchResultPage(arguments:{
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
       ],
     ),
    );
  }
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
