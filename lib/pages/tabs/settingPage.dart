import 'package:flutter/material.dart';
import 'package:studio/services/screenAdpter.dart';
// import 'package:studio/pages/tabs/myMooPage.dart';
class SettingPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new Setting();
  
}
class Setting extends State<SettingPage>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFF1a1a1a),
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1a1a1a),
        centerTitle: true,
        title: Text("设置"),
        ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 20
            ),
            child: PersonMsg(),
          ),
          Style(),
          PlayPage(),
          Information(),
          Stuio(),
          TrafficReminder(),
          Alert(),
          Cache(),
          FeedBack(),
          About(),
        ],
      ),
    );
  }
  
}
class PersonMsg extends StatelessWidget{
  @override
  onclickChangePersonMsg(){
    print("onclickChangePersonMsg");
  }
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      width: ScreenAdapter.getScreenWidth()-20,
      height: ScreenAdapter.getScreenWidth()/7,
      margin: EdgeInsets.only(
        left: 10,
      ),
      child: Material(
        color: const Color(0xFF1a1a1a),
        child: InkWell(
          onTap: (){
            onclickChangePersonMsg();
          },
          child:Center(child: Stack(
            
            children: <Widget>[
              Positioned(
                left: 10,
                child: Container(
                   height: ScreenAdapter.getScreenWidth()/7,        
                  child: Center(
                    child: Text("个人资料",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),),
                  )
                )
              ),
              Positioned(
                right: 10,
                child: Container(
                  height: ScreenAdapter.getScreenWidth()/7,
                  child: Center(
                    child: new Image(
                        image: new AssetImage('images/in.png'),
                        width:20,
                        height: 20,
                        fit: BoxFit.fill,
                      ),
                  ) 
                )
              ),
            ],
          ),),
        ),
      ),
    );
  }  
}
class Alert extends StatelessWidget{
  @override
  onclickAlert(){
    print("onclickAlert");
  }
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      width: ScreenAdapter.getScreenWidth()-20,
      height: ScreenAdapter.getScreenWidth()/7,
      margin: EdgeInsets.only(
        left: 10,
      ),
      child: Material(
        color:const Color(0xFF1a1a1a),
        child: InkWell(
          onTap: (){
            onclickAlert();
          },
          child:Center(child: Stack(
            
            children: <Widget>[
              Positioned(
                left: 10,
                child: Container(
                   height: ScreenAdapter.getScreenWidth()/7,        
                  child: Center(
                    child: Text("定时关闭",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),),
                  )
                )
              ),
              Positioned(
                right: 10,
                child: Container(
                  height: ScreenAdapter.getScreenWidth()/7,
                  child: Center(
                    child: new Image(
                        image: new AssetImage('images/in.png'),
                        width:20,
                        height: 20,
                        fit: BoxFit.fill,
                      ),
                  ) 
                )
              ),
            ],
          ),),
        ),
      ),
    );
  }  
}
class FeedBack extends StatelessWidget{
  @override
  onclickFeedBack(){
    print("onclickFeedBack");
  }
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      width: ScreenAdapter.getScreenWidth()-20,
      height: ScreenAdapter.getScreenWidth()/7,
      margin: EdgeInsets.only(
        left: 10,
      ),
      child: Material(
        color:const Color(0xFF1a1a1a),
        child: InkWell(
          onTap: (){
            onclickFeedBack();
          },
          child:Center(child: Stack(
            
            children: <Widget>[
              Positioned(
                left: 10,
                child: Container(
                   height: ScreenAdapter.getScreenWidth()/7,        
                  child: Center(
                    child: Text("反馈",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),),
                  )
                )
              ),
              Positioned(
                right: 10,
                child: Container(
                  height: ScreenAdapter.getScreenWidth()/7,
                  child: Center(
                    child: new Image(
                        image: new AssetImage('images/in.png'),
                        width:20,
                        height: 20,
                        fit: BoxFit.fill,
                      ),
                  ) 
                )
              ),
            ],
          ),),
        ),
      ),
    );
  }  
}
class About extends StatelessWidget{
  @override
  onclickAbout(){
    print("onclickAbout");
  }
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      width: ScreenAdapter.getScreenWidth()-20,
      height: ScreenAdapter.getScreenWidth()/7,
      margin: EdgeInsets.only(
        left: 10,
      ),
      child: Material(
        color: const Color(0xFF1a1a1a),
        child: InkWell(
          onTap: (){
            onclickAbout();
          },
          child:Center(child: Stack(
            
            children: <Widget>[
              Positioned(
                left: 10,
                child: Container(
                   height: ScreenAdapter.getScreenWidth()/7,        
                  child: Center(
                    child: Text("关于",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),),
                  )
                )
              ),
              Positioned(
                right: 10,
                child: Container(
                  height: ScreenAdapter.getScreenWidth()/7,
                  child: Center(
                    child: new Image(
                        image: new AssetImage('images/in.png'),
                        width:20,
                        height: 20,
                        fit: BoxFit.fill,
                      ),
                  ) 
                )
              ),
            ],
          ),),
        ),
      ),
    );
  }  
}
class Style extends StatelessWidget{
  @override
  onclickChangeStyle(){
    print("onclickChangeStyle");
  }
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      width: ScreenAdapter.getScreenWidth()-20,
      height: ScreenAdapter.getScreenWidth()/7,
      margin: EdgeInsets.only(
        left: 10,
      ),
      child: Material(
        color:const Color(0xFF1a1a1a),
        child: InkWell(
          onTap: (){
            onclickChangeStyle();
          },
          child:Center(child: Stack(
            
            children: <Widget>[
              Positioned(
                left: 10,
                child: Container(
                   height: ScreenAdapter.getScreenWidth()/7,        
                  child: Center(
                    child: Text("风格",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),),
                  )
                )
              ),
               Positioned(
                right: 10,
                child: Container(
                   height: ScreenAdapter.getScreenWidth()/7,        
                  child: Center(
                    child: Text("BLACK",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                ),),
                  )
                )
              ),
            ],
          ),),
        ),
      ),
    );
  }  
}
class PlayPage extends StatelessWidget{
  @override
  onclickChangePlayPageStyle(){
    print("onclickChangePlayPageStyle");
  }
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      width: ScreenAdapter.getScreenWidth()-20,
      height: ScreenAdapter.getScreenWidth()/7,
      margin: EdgeInsets.only(
        left: 10,
      ),
      child: Material(
        color: const Color(0xFF1a1a1a),
        child: InkWell(
          onTap: (){
            onclickChangePlayPageStyle();
          },
          child:Center(child: Stack(
            
            children: <Widget>[
              Positioned(
                left: 10,
                child: Container(
                   height: ScreenAdapter.getScreenWidth()/7,        
                  child: Center(
                    child: Text("PLAY页",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),),
                  )
                )
              ),
               Positioned(
                right: 10,
                child: Container(
                   height: ScreenAdapter.getScreenWidth()/7,        
                  child: Center(
                    child: Text("默认",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                ),),
                  )
                )
              ),
            ],
          ),),
        ),
      ),
    );
  }  
}
class Information extends StatelessWidget{
  @override
  onclickInformation(){
    print("onclickInformation");
  }
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      width: ScreenAdapter.getScreenWidth()-20,
      height: ScreenAdapter.getScreenWidth()/7,
      margin: EdgeInsets.only(
        left: 10,
      ),
      child: Material(
        color:const Color(0xFF1a1a1a),
        child: InkWell(
          onTap: (){
            onclickInformation();
          },
          child:Center(child: Stack(
            
            children: <Widget>[
              Positioned(
                left: 10,
                child: Container(
                   height: ScreenAdapter.getScreenWidth()/7,        
                  child: Center(
                    child: Text("通知栏样式",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),),
                  )
                )
              ),
               Positioned(
                right: 10,
                child: Container(
                   height: ScreenAdapter.getScreenWidth()/7,        
                  child: Center(
                    child: Text("MOO音乐通知栏",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                ),),
                  )
                )
              ),
            ],
          ),),
        ),
      ),
    );
  }  
}
class Stuio extends StatelessWidget{
  @override
  onclickStuio(){
    print("onclickStuio");
  }
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      width: ScreenAdapter.getScreenWidth()-20,
      height: ScreenAdapter.getScreenWidth()/7,
      margin: EdgeInsets.only(
        left: 10,
      ),
      child: Material(
        color: const Color(0xFF1a1a1a),
        child: InkWell(
          onTap: (){
            onclickStuio();
          },
          child:Center(child: Stack(
            
            children: <Widget>[
              Positioned(
                left: 10,
                child: Container(
                   height: ScreenAdapter.getScreenWidth()/7,        
                  child: Center(
                    child: Text("试听和下载音质",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),),
                  )
                )
              ),
               Positioned(
                right: 10,
                child: Center(
                  child: Container(
                    height: ScreenAdapter.getScreenWidth()/7,
                    width: 34,
                    child: Center(
                      child: Container(
                        height:  ScreenAdapter.getScreenWidth()/18,
                        child: Material(
                        // color: Color.fromRGBO(254, 226, 1, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        color: Colors.yellow,
                        child: InkWell(
                          onTap: (){
                            onclickStuio();
                          },
                          child: Center(child:Text("HQ",
                        style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),
                      )),
                        ),
                      ),
                      ),
                    )
              ),
                  ),
                )
            ],
          ),),
        ),
      ),
    );
  }  
}
class TrafficReminder extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TrafficReminderWidget();
  }
  
}
class TrafficReminderWidget extends State<TrafficReminder>{
  bool flag = false;
  @override
  onclickTrafficReminder(){
    print("onclickTrafficReminder");
    if(flag){
        setState(() {
        this.flag = false;
    });
    }else{
       setState(() {
        this.flag = true;
    });
    }
    
  }
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      width: ScreenAdapter.getScreenWidth()-20,
      height: ScreenAdapter.getScreenWidth()/7,
      margin: EdgeInsets.only(
        left: 10,
      ),
      child: Material(
        color: const Color(0xFF1a1a1a),
        child: InkWell(
          onTap: (){
            onclickTrafficReminder();
          },
          child:Center(child: Stack(
            
            children: <Widget>[
              Positioned(
                left: 10,
                child: Container(
                   height: ScreenAdapter.getScreenWidth()/7,        
                  child: Center(
                    child: Text("流量提醒",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),),
                  )
                )
              ),
               Positioned(
                right: 10,
                child: Container(
                   height: ScreenAdapter.getScreenWidth()/7,        
                  child: Center(
                    child:  Switch(
                      value: this.flag,
                      activeColor: Colors.yellow,
                      onChanged: (value) {
                        setState(() {
                          this.flag = value;
                        });
                      },
                    ),
                  )
                )
              ),
            ],
          ),),
        ),
      ),
    );
  }  
}
class Cache extends StatelessWidget{
  @override
  onclickCache(){
    print("onclickCache");
  }
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Container(
      width: ScreenAdapter.getScreenWidth()-20,
      height: ScreenAdapter.getScreenWidth()/7,
      margin: EdgeInsets.only(
        left: 10,
      ),
      child: Material(
        color: const Color(0xFF1a1a1a),
        child: InkWell(
          onTap: (){
            onclickCache();
          },
          child:Center(child: Stack(
            
            children: <Widget>[
              Positioned(
                left: 10,
                child: Container(
                   height: ScreenAdapter.getScreenWidth()/7,        
                  child: Center(
                    child: Text("缓存",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),),
                  )
                )
              ),
               Positioned(
                right: 10,
                child: Container(
                   height: ScreenAdapter.getScreenWidth()/7,        
                  child: Center(
                    child: Text("450.7M",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),),
                  )
                )
              ),
            ],
          ),),
        ),
      ),
    );
  }  
}