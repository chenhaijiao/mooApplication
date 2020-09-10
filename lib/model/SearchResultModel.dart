class SearchSongModel {
  SearchSongListModel result;
  int code;

  SearchSongModel({this.result, this.code});

  SearchSongModel.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new SearchSongListModel.fromJson(json['result']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    data['code'] = this.code;
    return data;
  }
}

class SearchSongListModel {
  List<Songs> songs;
  int songCount;

  SearchSongListModel({this.songs, this.songCount});

  SearchSongListModel.fromJson(Map<String, dynamic> json) {
    if (json['songs'] != null) {
      songs = new List<Songs>();
      json['songs'].forEach((v) {
        songs.add(new Songs.fromJson(v));
      });
    }
    songCount = json['songCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.songs != null) {
      data['songs'] = this.songs.map((v) => v.toJson()).toList();
    }
    data['songCount'] = this.songCount;
    return data;
  }
}

class Songs {
  int id;
  String name;
  List<Artists> artists;
  Album album;
  int duration;
  int mvid;

  Songs(
      {this.id, this.name, this.artists, this.album, this.duration, this.mvid});

  Songs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
    duration = json['duration'];
    mvid = json['mvid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    if (this.album != null) {
      data['album'] = this.album.toJson();
    }
    data['duration'] = this.duration;
    data['mvid'] = this.mvid;
    return data;
  }
}

class Artists {
  int id;
  String name;
  String img1v1Url;

  Artists({this.id, this.name, this.img1v1Url});

  Artists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img1v1Url = json['img1v1Url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img1v1Url'] = this.img1v1Url;
    return data;
  }
}

class Album {
  int id;
  String name;
  int publishTime;

  Album({this.id, this.name, this.publishTime});

  Album.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    publishTime = json['publishTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['publishTime'] = this.publishTime;
    return data;
  }
}