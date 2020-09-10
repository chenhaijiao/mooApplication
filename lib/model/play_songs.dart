import 'package:json_annotation/json_annotation.dart'; 
  
part 'play_songs.g.dart';


@JsonSerializable()
  class PlaySongs extends Object {

  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'code')
  int code;

  PlaySongs(this.data,this.code,);

  factory PlaySongs.fromJson(Map<String, dynamic> srcJson) => _$PlaySongsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PlaySongsToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'br')
  int br;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'md5')
  String md5;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'expi')
  int expi;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'gain')
  int gain;

  @JsonKey(name: 'fee')
  int fee;

  @JsonKey(name: 'payed')
  int payed;

  @JsonKey(name: 'flag')
  int flag;

  @JsonKey(name: 'canExtend')
  bool canExtend;

  @JsonKey(name: 'level')
  String level;

  @JsonKey(name: 'encodeType')
  String encodeType;

  Data(this.id,this.url,this.br,this.size,this.md5,this.code,this.expi,this.type,this.gain,this.fee,this.payed,this.flag,this.canExtend,this.level,this.encodeType,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
