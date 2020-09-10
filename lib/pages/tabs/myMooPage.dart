import 'package:flutter/material.dart';
import 'package:studio/services/screenAdpter.dart';
import 'package:studio/pages/tabs/settingPage.dart';
import 'package:studio/pages/tabs/discoverPage.dart';
import 'package:studio/services/StringService.dart';
import 'package:studio/pages/tabs/recentPlayListPage.dart';
class MyMooPage extends StatefulWidget{
  // final Map arguments;
  // const MyMooPage({Key key, this.arguments}) : super(key: key);
  // @override
  // State<StatefulWidget> createState() =>MyMoo(arguments:arguments);
  @override
  State<StatefulWidget> createState() =>MyMoo();
}
class MyMoo extends State<MyMooPage> with TickerProviderStateMixin{
  var recentPlaySongsCount = 0;
  List recentPlaySongsId = [];
  List recentPlaySongsImgUrl = [];
  List recentPlaySongsSname = [];
  List recentPlaySongsAname = [];
// recentPlaySongsId
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecentPlaySongsCount();
  }
  onclickRecentPlay(){
    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => RecentPlayListPage(
                         arguments:{    'recentPlaySongsCount':recentPlaySongsCount,
                                        'recentPlaySongsId':recentPlaySongsId,
                                        'recentPlaySongsImgUrl':recentPlaySongsImgUrl,
                                        'recentPlaySongsSname':recentPlaySongsSname,
                                        'recentPlaySongsAname':recentPlaySongsAname,

                                  }
    )));
  }
  onclickCollect(){
    print("collect");
  }
  // StringService.setTagyData("loveSongsId", this.arguments['id']);
  // StringService.setTagyData("loveSongsImgUrl", this.searchSongs.result.songs[arguments['index']].artists[0].img1v1Url);
  // StringService.setTagyData("loveSongsSname", this.searchSongs.result.songs[arguments['index']].name);
  // StringService.setTagyData("loveSongsAname", this.searchSongs.result.songs[arguments['index']].artists[0].name);
  // StringService.setTagyData("recentPlaySongsId", this.arguments['id']);
  // StringService.setTagyData("recentPlaySongsImgUrl", this.searchSongs.result.songs[arguments['index']].artists[0].img1v1Url);
  // StringService.setTagyData("recentPlaySongsSname", this.searchSongs.result.songs[arguments['index']].name);
  // StringService.setTagyData("recentPlaySongsAname", this.searchSongs.result.songs[arguments['index']].artists[0].name);
  getRecentPlaySongsCount() async {
    List _recentPlaySongsId = await StringService.getTagList("recentPlaySongsId");
    // List _recentPlaySongsImgUrl = await StringService.getTagList("recentPlaySongsImgUrl");
    List _recentPlaySongsSname = await StringService.getTagList("recentPlaySongsSname");
    List _recentPlaySongsAname = await StringService.getTagList("recentPlaySongsAname");

    setState(() {
      this.recentPlaySongsId = _recentPlaySongsId;
      // this.recentPlaySongsImgUrl = _recentPlaySongsImgUrl;
      this.recentPlaySongsSname = _recentPlaySongsSname;
      this.recentPlaySongsAname = _recentPlaySongsAname;
      this.recentPlaySongsCount = 1000;
        this.recentPlaySongsCount = this.recentPlaySongsCount < recentPlaySongsId.length? this.recentPlaySongsCount :recentPlaySongsId.length;
        // this.recentPlaySongsCount = this.recentPlaySongsCount < recentPlaySongsImgUrl.length ? recentPlaySongsCount :recentPlaySongsImgUrl.length;
        this.recentPlaySongsCount = this.recentPlaySongsCount < recentPlaySongsSname.length ? recentPlaySongsCount :recentPlaySongsSname.length;
        this.recentPlaySongsCount = this.recentPlaySongsCount < recentPlaySongsAname.length ? recentPlaySongsCount :recentPlaySongsAname.length;
    });
    print("最近听过歌曲的数量${this.recentPlaySongsCount}");
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1a1a),
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1a1a1a),
        centerTitle: true,
        title: Text("我的音乐"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(
              right: 20,
            ),
            color:  const Color(0xFF1a1a1a),
            child: InkWell(
              highlightColor: Colors.transparent,
              radius: 0.0,
              onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SettingPage()));
              },
              child:   new ImageIcon(AssetImage('images/setting.png'), color: Colors.white,size:26),
            ),
          )
         
          
        ],
        ),
        body:new Center(
          child: new Container(
             padding: EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                Container(
                    child: Person(), 
                ),
                Container(
                  child: Wrap(
                    children: <Widget>[
                      Container(
      height: ScreenAdapter.getScreenWidth()/7*2,
      width: ScreenAdapter.getScreenWidth()/2-30,
      margin: EdgeInsets.all(10.0),
      color:const Color(0xFF1a1a1a),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
             child:Container(

                child: Material(
                  color:  const Color(0xFF1a1a1a),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    radius: 0.0,
                    onTap: (){
                      onclickCollect();
                    },
                    child: new Image(
                      image: new AssetImage('images/collect.png'),
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
          ),),
          Container(
                  width: ScreenAdapter.getScreenWidth()/2-30,
                      child: Material(
                        // color: Color.fromRGBO(254, 226, 1, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        color: Colors.black,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          radius: 0.0,
                          onTap: (){
                           onclickCollect();
                          },
                          child:Row(
                            children: <Widget>[
                               Container(
                                 width: (ScreenAdapter.getScreenWidth()/2-40)/2,
                                 margin: EdgeInsets.only(left: 10.0),
                                 child: Text("收藏",
                                    style: TextStyle(fontSize: 16.0,color: Colors.white),
                                  ),
                               ),
                                Container(
                                 width: (ScreenAdapter.getScreenWidth()/2-40)/2-10,
                                 child: Text("${this.recentPlaySongsCount}",
                                    style: TextStyle(fontSize: 17.0,color: Colors.grey),
                                    // textDirection: TextDirection.ltr, 
                                    textAlign: TextAlign.right,
                                  ),
                               )
                            ],
                          ),
                        ),
                      )
          )
        ],
      ),
    ),
                      Container(
      height: ScreenAdapter.getScreenWidth()/7*2,
      width: ScreenAdapter.getScreenWidth()/2-30,
      margin: EdgeInsets.all(10.0),
      color:const Color(0xFF1a1a1a),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
             child:Container(

                child: Material(
                  color:  const Color(0xFF1a1a1a),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    radius: 0.0,
                    onTap: (){
                      onclickRecentPlay();
                    },
                    child: new Image(
                      image: new AssetImage('images/recent_play.png'),
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
          ),),
          Container(
                  width: ScreenAdapter.getScreenWidth()/2-30,
                      child: Material(
                        // color: Color.fromRGBO(254, 226, 1, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        color: Colors.black,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          radius: 0.0,
                          onTap: (){
                           onclickRecentPlay();
                          },
                          child:Row(
                            children: <Widget>[
                               Container(
                                 width: (ScreenAdapter.getScreenWidth()/2-40)/2,
                                 margin: EdgeInsets.only(left: 10.0),
                                 child: Text("最近播放",
                                    style: TextStyle(fontSize: 16.0,color: Colors.white),
                                  ),
                               ),
                                Container(
                                 width: (ScreenAdapter.getScreenWidth()/2-40)/2-10,
                                 child: Text("${this.recentPlaySongsCount}",
                                    style: TextStyle(fontSize: 17.0,color: Colors.grey),
                                    // textDirection: TextDirection.ltr, 
                                    textAlign: TextAlign.right,
                                  ),
                               )
                            ],
                          ),
                        ),
                      )
          )
        ],
      ),
    ),
                      LocalSong(),
                      PlayList()
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Msg(),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Img(),
                )
              ],
            ),
          ),
        ),
      );
  }
}
// class Collect extends StatelessWidget{
//   onclickCollect(){
//     print("collect");
//   }
//   @override
//   Widget build(BuildContext context) {
//     ScreenAdapter.init(context);
//     return ;
//   }
// }
class PlayList extends StatelessWidget{
  onclickPlayList(){
    print("PlayList");
  }
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      height: ScreenAdapter.getScreenWidth()/7*2,
      width: ScreenAdapter.getScreenWidth()/2-30,
      margin: EdgeInsets.all(10.0),
      color:const Color(0xFF1a1a1a),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
             child:Container(

                child: Material(
                  color:  const Color(0xFF1a1a1a),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    radius: 0.0,
                    onTap: (){
                      onclickPlayList();
                    },
                    child: new Image(
                      image: new AssetImage('images/playList.png'),
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
          ),),
          Container(
                  width: ScreenAdapter.getScreenWidth()/2-30,
                      child: Material(

                        // color: Color.fromRGBO(254, 226, 1, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        color: Colors.black,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                         radius: 0.0,
                          onTap: (){
                           onclickPlayList();
                          },
                          child:Row(
                            children: <Widget>[
                               Container(
                                 width: (ScreenAdapter.getScreenWidth()/2-40)/2,
                                 margin: EdgeInsets.only(left: 10.0),
                                 child: Text("歌单",
                                    style: TextStyle(fontSize: 16.0,color: Colors.white),
                                  ),
                               ),
                                Container(
                                 width: (ScreenAdapter.getScreenWidth()/2-40)/2-10,
                                 child: Text("1",
                                    style: TextStyle(fontSize: 16.0,color: Colors.grey),
                                    // textDirection: TextDirection.ltr, 
                                    textAlign: TextAlign.right,
                                  ),
                               )
                            ],
                          ),
                        ),
                      )
          )
        ],
      ),
    );
  }
}
class LocalSong extends StatelessWidget{
  onclickLocalSong(){
    print("LocalSong");
  }
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      height: ScreenAdapter.getScreenWidth()/7*2,
      width: ScreenAdapter.getScreenWidth()/2-30,
      margin: EdgeInsets.all(10.0),
      color:const Color(0xFF1a1a1a),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
             child:Container(

                child: Material(
                  color:  const Color(0xFF1a1a1a),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    radius: 0.0,
                    onTap: (){
                      onclickLocalSong();
                    },
                    child: new Image(
                      image: new AssetImage('images/localSong.png'),
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
          ),),
          Container(
                  width: ScreenAdapter.getScreenWidth()/2-30,
                      child: Material(
                        // color: Color.fromRGBO(254, 226, 1, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        color: Colors.black,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          radius: 0.0,
                          onTap: (){
                           onclickLocalSong();
                          },
                          child:Row(
                            children: <Widget>[
                               Container(
                                 width: (ScreenAdapter.getScreenWidth()/2-40)/2,
                                 margin: EdgeInsets.only(left: 10.0),
                                 child: Text("本地歌曲",
                                    style: TextStyle(fontSize: 16.0,color: Colors.white),
                                  ),
                               ),
                                Container(
                                 width: (ScreenAdapter.getScreenWidth()/2-40)/2-10,
                                 child: Text("20",
                                    style: TextStyle(fontSize: 17.0,color: Colors.grey),
                                    // textDirection: TextDirection.ltr, 
                                    textAlign: TextAlign.right,
                                  ),
                               )
                            ],
                          ),
                        ),
                      )
          )
        ],
      ),
    );
  }
}
class RecentPlay extends StatelessWidget{
  onclickRecentPlay(){
    print("RecentPlay");
  }
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      height: ScreenAdapter.getScreenWidth()/7*2,
      width: ScreenAdapter.getScreenWidth()/2-30,
      margin: EdgeInsets.all(10.0),
      color:const Color(0xFF1a1a1a),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
             child:Container(

                child: Material(
                  color:  const Color(0xFF1a1a1a),
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    radius: 0.0,
                    onTap: (){
                      onclickRecentPlay();
                    },
                    child: new Image(
                      image: new AssetImage('images/recent_play.png'),
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
          ),),
          Container(
                  width: ScreenAdapter.getScreenWidth()/2-30,
                      child: Material(
                        // color: Color.fromRGBO(254, 226, 1, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        color: Colors.black,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          radius: 0.0,
                          onTap: (){
                           onclickRecentPlay();
                          },
                          child:Row(
                            children: <Widget>[
                               Container(
                                 width: (ScreenAdapter.getScreenWidth()/2-40)/2,
                                 margin: EdgeInsets.only(left: 10.0),
                                 child: Text("最近播放",
                                    style: TextStyle(fontSize: 16.0,color: Colors.white),
                                  ),
                               ),
                                Container(
                                 width: (ScreenAdapter.getScreenWidth()/2-40)/2-10,
                                 child: Text("20",
                                    style: TextStyle(fontSize: 17.0,color: Colors.grey),
                                    // textDirection: TextDirection.ltr, 
                                    textAlign: TextAlign.right,
                                  ),
                               )
                            ],
                          ),
                        ),
                      )
          )
        ],
      ),
    );
  }
}

class Msg extends StatelessWidget{
  @override
  onclickMessage(){
    print("New Message");
  }
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      child: Material(
        color: const Color(0xFF1a1a1a),
        child: InkWell(
          onTap: (){
            onclickMessage();
          },
          child:Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20.0),
                child: new Image(
                  image: new AssetImage('images/msg.png'),
                  width: 20.0,
                  height: 20.0,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10.0,
                ),
                width: 100.0,
                child: Text("消息",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),),
              ),
               Container(
                margin: EdgeInsets.only(
                  left: 120.0
                ),
                child: new Image(
                  image: new AssetImage('images/in.png'),
                  width: 20.0,
                  height: 20.0,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
class Img extends StatelessWidget{
  @override
  onclickImg(){
    print("pintu");
  }
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      child: Material(
        color: const Color(0xFF1a1a1a),
        child: InkWell(
          onTap: (){
            onclickImg();
          },
          child:Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20.0),
                child: new Image(
                  image: new AssetImage('images/pintu.png'),
                  width: 20.0,
                  height: 20.0,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10.0,
                ),
                width: 100.0,
                child: Text("MOO COVER",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),),
              ),
               Container(
                margin: EdgeInsets.only(
                  left: 120.0
                ),
                child: new Image(
                  image: new AssetImage('images/in.png'),
                  width: 20.0,
                  height: 20.0,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
class Person extends StatelessWidget{
  onclickUserMsg(){
    print("usermsg");
  }
  onclickObserve(){
    print("guanzhurenshu");
  }
  OnclickVIPMsg(){
    print("VIPMsg");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
       decoration: new BoxDecoration(
          color: Colors.black,
          //设置四周圆角 角度
          borderRadius: BorderRadius.all(Radius.circular(9.0)),
           //设置四周边框
          border: new Border.all(width: 0,color: const Color(0xFF1a1a1a),),
      ),
      margin: EdgeInsets.all(10.0),
      alignment: Alignment(0, 0),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 20,
              bottom: 30,
            ),

            child: Row(
              children: <Widget>[
                  Container(
                      width: 54.0,
                      height: 54.0,
                       decoration: new BoxDecoration(
                          //背景
                          color: Colors.white,
                          //设置四周圆角 角度
                          borderRadius: BorderRadius.all(Radius.circular(27.0)),
                          //设置四周边框
                          border: new Border.all(width: 2,color: Colors.white),
                        ),
                      // color: Colors.red,
                      child: Material(
                         shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          radius: 0.0,
                          onTap: () {
                            onclickUserMsg();
                          },
                          child: CircleAvatar(
                              //头像半径
                              radius: 25,
                              backgroundColor: Colors.white,
                              //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                              backgroundImage: AssetImage(
                                'images/image_start.png'
                              ),
                            ),
                        ),
                    ),),
                    Container(
                      margin: EdgeInsets.only(
                        left: 10.0,
                      ),
                      child:Material(
                        color: Colors.black,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                    radius: 0.0,
                          onTap: (){
                            onclickUserMsg();
                          },
                          child:  Text("嶙峋柘远",
                            style: TextStyle(
                              color:Colors.white,
                              fontSize: 17.0 
                              ),
                          ),
                        ),
                      ),
                    )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              bottom: 10.0,
            ),
            child: Row(
              children: <Widget>[
                 Material(
                   color: Colors.black,
                   child: InkWell(
                     highlightColor: Colors.transparent,
                    radius: 0.0,
                   onTap: (){
                      onclickObserve();
                   },
                   child: RichText(
                                text:TextSpan(
                                  text: "关注",
                                  style: TextStyle(color: Colors.grey),
                                  children: [
                                    TextSpan(
                                      text: "  0",
                                      style: TextStyle(color: Colors.grey,fontSize: 16.0,fontWeight: FontWeight.bold)
                                    )
                                  ]
                                ),
                                
                            ),
                 ),),
                Container(
                  margin: EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Material(
                   color: Colors.black,
                   child: InkWell(
                    highlightColor: Colors.transparent,
                    radius: 0.0,
                   onTap: (){
                      onclickObserve();
                   },
                   child: RichText(
                                text:TextSpan(
                                  text: "粉丝",
                                  style: TextStyle(color: Colors.grey),
                                  children: [
                                    TextSpan(
                                      text: "  0",
                                      style: TextStyle(color: Colors.grey,fontSize: 16.0,fontWeight: FontWeight.bold)
                                    )
                                  ]
                                ),
                                
                            ),
                 ),),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 120.0,
                  ),
                  width: 45.0,
                      child: Material(
                        // color: Color.fromRGBO(254, 226, 1, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        color: Colors.yellow,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          radius: 0.0,
                          onTap: (){
                            OnclickVIPMsg();
                          },
                          child: Center(child:Text("VIP",
                        style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                      )),
                        ),
                      )
                    ),
              ],
            ),
          )
        ],
      )
    );
  }
}

