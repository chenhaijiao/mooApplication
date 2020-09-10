// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
class NowPlayList {
  int id;
  String url;
  int playListIndex;
  double nowTimer;

  NowPlayList(
      {
      this.id,
      this.url,
      this.playListIndex,
      this.nowTimer,
});

  NowPlayList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    playListIndex = json['playListIndex'];
    nowTimer = json['nowTimer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['playListIndex'] = this.playListIndex;
    data['nowTimer'] = this.nowTimer;
    return data;
  }
}