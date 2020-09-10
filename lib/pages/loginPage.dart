
import 'package:studio/config/config.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:studio/model/LoginUserModel.dart';
import 'package:studio/pages/tabs/discoverPage.dart';
// import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page(),
      debugShowCheckedModeBanner :false,
      );
  }
  
}
class Page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>Login();
}

class Login extends State<Page>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/image_start.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: FocusTestRoute(),
      ),
      );
  }
}
class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  
  login() async {
    print("11111");
    // var api = "${Config.domain}login/cellphone?phone=18374490596&password=chenhaijiao0704";
    // // var api = "${Config.domain}playlist/hot";

    // var result = await Dio().get(api);
    // var user =User.fromJson(result.data); 
    // if(user.code==200){
    //     Navigator.push(context, MaterialPageRoute(
    //     builder: (context) => DiscoverPage(arguments:{
    //       'id':user.code
    //     }
    //         )));
    //         Fluttertoast.showToast(
    //           msg: "登录成功",
    //           toastLength: Toast.LENGTH_SHORT,
    //           gravity: ToastGravity.CENTER,
    //           timeInSecForIos: 2,
    //           backgroundColor: Color(0xe74c3c),
    //           textColor: Color(0xffffff));
    // } else{
    //    Fluttertoast.showToast(
    //           msg: "登录失败",
    //           toastLength: Toast.LENGTH_SHORT,
    //           gravity: ToastGravity.CENTER,
    //           timeInSecForIos: 2,
    //           backgroundColor: Color(0xe74c3c),
    //           textColor: Color(0xffffff));
    // }
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => DiscoverPage(arguments:{
          'id':"200"
        }
            )));
    // print("热搜榜详情列表：" "${user}");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Builder(builder: (ctx) {
            return Column(
              children: <Widget>[
                Container(
                  alignment: Alignment(0, 0),
                  margin: EdgeInsets.only(
                      top: 500.0,
                    ),
                      child:Container(
                      width: 240.0,
                      height: 50.0,
                        child: RaisedButton.icon(
                        color: Color.fromRGBO(254, 226, 1, 1),
                        textColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                        icon: Icon(Icons.phone_android),
                        label: Text('本机号码一键登录'),
                        onPressed: () {
                          login();
                        },
                      ),
                    ),
                ),
               Container(
                 margin: EdgeInsets.only(
                      top: 30.0,
                    ),
                 child: RichText(
                   text:TextSpan(
                     text: "继续使用代表同意",
                     style: TextStyle(color: Colors.grey),
                     children: [
                       TextSpan(
                         text: "《许可协议》《隐私保护指南》",
                         style: TextStyle(color: Colors.white)
                       )
                     ]
                   ),
                  
               ),
               ), 
              ],
            );
          },
          ),
        ],
      ),
    );
  }

}