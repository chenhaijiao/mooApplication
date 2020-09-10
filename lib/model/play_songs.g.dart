// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_songs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaySongs _$PlaySongsFromJson(Map<String, dynamic> json) {
  return PlaySongs(
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['code'] as int);
}

Map<String, dynamic> _$PlaySongsToJson(PlaySongs instance) =>
    <String, dynamic>{'data': instance.data, 'code': instance.code};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['id'] as int,
      json['url'] as String,
      json['br'] as int,
      json['size'] as int,
      json['md5'] as String,
      json['code'] as int,
      json['expi'] as int,
      json['type'] as String,
      json['gain'] as int,
      json['fee'] as int,
      json['payed'] as int,
      json['flag'] as int,
      json['canExtend'] as bool,
      json['level'] as String,
      json['encodeType'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'br': instance.br,
      'size': instance.size,
      'md5': instance.md5,
      'code': instance.code,
      'expi': instance.expi,
      'type': instance.type,
      'gain': instance.gain,
      'fee': instance.fee,
      'payed': instance.payed,
      'flag': instance.flag,
      'canExtend': instance.canExtend,
      'level': instance.level,
      'encodeType': instance.encodeType
    };
