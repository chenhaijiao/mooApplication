
class NowPlaySong {
  int id;
  String url;
  int playListIndex;
  double nowTimer;
  bool pause;

  NowPlaySong(
      
      this.id,
      this.url,
      this.playListIndex,
      this.nowTimer,
      this.pause,
);

  NowPlaySong.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    playListIndex = json['playListIndex'];
    nowTimer = json['nowTimer'];
    pause = json['pause'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['playListIndex'] = this.playListIndex;
    data['nowTimer'] = this.nowTimer;
    data['pause'] = this.pause;
    return data;
  }
}