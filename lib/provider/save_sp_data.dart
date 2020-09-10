import 'dart:convert';
import 'package:studio/model/NowPlayListModel.dart';
import 'package:studio/model/NowPlaySongModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '';
class Application{

  static Future<void> setString(key,value) async{
       SharedPreferences sp=await SharedPreferences.getInstance();
       sp.setString(key, value);
  }
  static Future<String> getString(key) async{
       SharedPreferences sp=await SharedPreferences.getInstance();
       return sp.getString(key);
  }
  static Future<void> remove(key) async{
       SharedPreferences sp=await SharedPreferences.getInstance();
       sp.remove(key);
  }
  static Future<void> clear() async{
       SharedPreferences sp=await SharedPreferences.getInstance();
       sp.clear();
  }
}
class SP{
  // NowPlayList nowPlayList
  static saveNowPlayListInfo(NowPlayList nowPlayList) async{
    // _user = nowPlayList;
    
    Application.setString('nowPlayList', json.encode(nowPlayList.toJson()));
  }
  static saveNowPlaySongInfo(int id,String url,int playListIndex,double nowTimer,bool pause) async{
    NowPlaySong nowPlaySong = NowPlaySong(id,url,playListIndex,nowTimer,pause);
    Application.setString('nowPlaySong', json.encode(nowPlaySong.toJson()));
  }
  static getNowPlaySongInfo() async{
     try {
      NowPlaySong searchListData = json.decode(await Application.getString('nowPlaySong'));
      return searchListData;
    } catch (e) {
      return [];
    }
  }
}