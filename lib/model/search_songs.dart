import 'package:json_annotation/json_annotation.dart'; 
  
part 'search_songs.g.dart';


@JsonSerializable()
  class SearchSongs extends Object {

  @JsonKey(name: 'result')
  Result result;

  @JsonKey(name: 'code')
  int code;

  SearchSongs(this.result,this.code,);

  factory SearchSongs.fromJson(Map<String, dynamic> srcJson) => _$SearchSongsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchSongsToJson(this);

}

  
@JsonSerializable()
  class Result extends Object {

  @JsonKey(name: 'songs')
  List<Songs> songs;

  @JsonKey(name: 'hasMore')
  bool hasMore;

  @JsonKey(name: 'songCount')
  int songCount;

  Result(this.songs,this.hasMore,this.songCount,);

  factory Result.fromJson(Map<String, dynamic> srcJson) => _$ResultFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

}

  
@JsonSerializable()
  class Songs extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'artists')
  List<Artists> artists;

  @JsonKey(name: 'album')
  Album album;

  @JsonKey(name: 'duration')
  int duration;

  @JsonKey(name: 'copyrightId')
  int copyrightId;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'alias')
  List<String> alias;

  @JsonKey(name: 'rtype')
  int rtype;

  @JsonKey(name: 'ftype')
  int ftype;

  @JsonKey(name: 'mvid')
  int mvid;

  @JsonKey(name: 'fee')
  int fee;

  @JsonKey(name: 'mark')
  int mark;

  Songs(this.id,this.name,this.artists,this.album,this.duration,this.copyrightId,this.status,this.alias,this.rtype,this.ftype,this.mvid,this.fee,this.mark,);

  factory Songs.fromJson(Map<String, dynamic> srcJson) => _$SongsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SongsToJson(this);

}

  
@JsonSerializable()
  class Artists extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'alias')
  List<dynamic> alias;

  @JsonKey(name: 'albumSize')
  int albumSize;

  @JsonKey(name: 'picId')
  int picId;

  @JsonKey(name: 'img1v1Url')
  String img1v1Url;

  @JsonKey(name: 'img1v1')
  int img1v1;

  Artists(this.id,this.name,this.alias,this.albumSize,this.picId,this.img1v1Url,this.img1v1,);

  factory Artists.fromJson(Map<String, dynamic> srcJson) => _$ArtistsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArtistsToJson(this);

}

  
@JsonSerializable()
  class Album extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'artist')
  Artist artist;

  @JsonKey(name: 'publishTime')
  int publishTime;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'copyrightId')
  int copyrightId;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'picId')
  int picId;

  @JsonKey(name: 'mark')
  int mark;

  Album(this.id,this.name,this.artist,this.publishTime,this.size,this.copyrightId,this.status,this.picId,this.mark,);

  factory Album.fromJson(Map<String, dynamic> srcJson) => _$AlbumFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);

}

  
@JsonSerializable()
  class Artist extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'alias')
  List<dynamic> alias;

  @JsonKey(name: 'albumSize')
  int albumSize;

  @JsonKey(name: 'picId')
  int picId;

  @JsonKey(name: 'img1v1Url')
  String img1v1Url;

  @JsonKey(name: 'img1v1')
  int img1v1;

  Artist(this.id,this.name,this.alias,this.albumSize,this.picId,this.img1v1Url,this.img1v1,);

  factory Artist.fromJson(Map<String, dynamic> srcJson) => _$ArtistFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArtistToJson(this);

}

  
