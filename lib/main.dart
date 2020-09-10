import 'package:flutter/material.dart';
import 'dart:async';
import 'package:studio/pages/loginPage.dart';
import 'package:studio/services/screenAdpter.dart';
 
void main() => runApp(
  MaterialApp( 
    debugShowCheckedModeBanner :false,
    home:new MyApp()),
  );
 
class MyApps extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ScreenAdapter.init(context);
    return Scaffold(
      body:Container(
        // width: ScreenAdapter.getScreenWidth(),
        // height: ScreenAdapter.getScreenHeight(),
         decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/image_start.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(width: 0,height: 0,),
      ) 
      // new Image.asset('images/image_start.png')
      // child: Text("11111"),
    );
  }
  
}
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new Pages();

}
class Pages extends State<MyApp>{
  Timer _timer;
  int count = 1;

  startTime() async {
    //设置启动图生效时间
    var _duration = new Duration(seconds: 1);
    new Timer(_duration, () {
      // 空等1秒之后再计时
      _timer = new Timer.periodic(const Duration(milliseconds: 1000), (v) {
        count--;
        if (count == 0) {
          navigationPage();
        } else {
          setState(() {});
        }
      });
      return _timer;
    });
  }
  void initState() {
    super.initState();
    startTime();
  }

  void navigationPage() {
    _timer.cancel();
    Navigator.push(
    context,
    new MaterialPageRoute(builder: (context) => new LoginPage()),
  );
  
  }

  @override
  Widget build(BuildContext context) {
   return Container(
        // width: ScreenAdapter.getScreenWidth(),
        // height: ScreenAdapter.getScreenHeight(),
         decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/image_start.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(width: 0,height: 0,),
      ) ;
  }
  
}