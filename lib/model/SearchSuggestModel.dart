class SearchSuggest {
  SearchSuggestModel result;
  // SearchAlbumsListModel result;
  int code;

  SearchSuggest({this.result, this.code});

  SearchSuggest.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new SearchSuggestModel.fromJson(json['result']) : null;
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
class SearchSuggestModel {
  List<Songs> songs;
  List<Albums> albums;
  List<Mv> mv;
  List<Artists> artists;

  // SearchSuggestModel({this.songs,this.albums, this.mv,this.artists});
  SearchSuggestModel({this.songs});

  SearchSuggestModel.fromJson(Map<String, dynamic> json) {
      if (json['songs'] != null) {
        songs = new List<Songs>();
        json['songs'].forEach((v) {
          songs.add(new Songs.fromJson(v));
        });
      }
      if (json['albums'] != null) {
        albums = new List<Albums>();
        json['albums'].forEach((v) {
          albums.add(new Albums.fromJson(v));
        });
      }
      if (json['mv'] != null) {
        mv = new List<Mv>();
        json['mv'].forEach((v) {
          mv.add(new Mv.fromJson(v));
        });
      }
      if (json['artists'] != null) {
        artists = new List<Artists>();
        json['artists'].forEach((v) {
          artists.add(new Artists.fromJson(v));
        });
      }
   }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.songs != null) {
      data['songs'] = this.songs.map((v) => v.toJson()).toList();
    }
    if (this.albums != null) {
      data['albums'] = this.albums.map((v) => v.toJson()).toList();
    }
    if (this.mv != null) {
      data['mv'] = this.mv.map((v) => v.toJson()).toList();
    }
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Songs {
  List<Artists> artists;
  int id;
  String name;

  Songs({this.artists, this.id,this.name});

  Songs.fromJson(Map<String, dynamic> json) {
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    id = json['id'];
    name = json['name'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['name'] = this.name;

    return data;
  }
}

// class Artist {
//   String name;
//   String img1v1Url;

//   Artists(
//       {this.name, this.img1v1Url});

//   Artists.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     img1v1Url = json['img1v1Url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['img1v1Url'] = this.img1v1Url;
//     return data;
//   }
// }
class Albums {
  List<Artists> artist;
  int id;
  String name;
  Albums({this.artist, this.id,this.name});
  Albums.fromJson(Map<String, dynamic> json) {
    if (json['artist'] != null) {
      artist = new List<Artists>();
      json['artist'].forEach((v) {
        artist.add(new Artists.fromJson(v));
      });
    }
    id = json['id'];
    name = json['name'];

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.artist != null) {
      data['artist'] = this.artist.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
class Artists {
  int id;
  String name;
  String img1v1Url;
  int albumSize;
  int musicSize;
  int mvSize;
  int videoSize;
  Artists({this.id, this.name,this.img1v1Url,this.albumSize, this.musicSize,this.mvSize,this.videoSize});
  Artists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img1v1Url = json['img1v1Url'];
    albumSize = json['albumSize'];
     musicSize = json['musicSize'];
    mvSize = json['mvSize'];
    videoSize = json['videoSize'];

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img1v1Url'] = this.img1v1Url;
    data['albumSize'] = this.albumSize;
    data['musicSize'] = this.musicSize;
    data['mvSize'] = this.mvSize;
    data['videoSize'] = this.videoSize;
    return data;
  }
}
class Mv {
  List<Artists> artists;
  int id;
  String name;
  String cover;
  Mv({this.artists, this.id,this.name,this.cover});
  Mv.fromJson(Map<String, dynamic> json) {
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    id = json['id'];
    name = json['name'];
    cover = json['cover'];


  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['cover'] = this.cover;

    return data;
  }
}