// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_songs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSongs _$SearchSongsFromJson(Map<String, dynamic> json) {
  return SearchSongs(
      json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      json['code'] as int);
}

Map<String, dynamic> _$SearchSongsToJson(SearchSongs instance) =>
    <String, dynamic>{'result': instance.result, 'code': instance.code};

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
      (json['songs'] as List)
          ?.map((e) =>
              e == null ? null : Songs.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['hasMore'] as bool,
      json['songCount'] as int);
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'songs': instance.songs,
      'hasMore': instance.hasMore,
      'songCount': instance.songCount
    };

Songs _$SongsFromJson(Map<String, dynamic> json) {
  return Songs(
      json['id'] as int,
      json['name'] as String,
      (json['artists'] as List)
          ?.map((e) =>
              e == null ? null : Artists.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['album'] == null
          ? null
          : Album.fromJson(json['album'] as Map<String, dynamic>),
      json['duration'] as int,
      json['copyrightId'] as int,
      json['status'] as int,
      (json['alias'] as List)?.map((e) => e as String)?.toList(),
      json['rtype'] as int,
      json['ftype'] as int,
      json['mvid'] as int,
      json['fee'] as int,
      json['mark'] as int);
}

Map<String, dynamic> _$SongsToJson(Songs instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artists': instance.artists,
      'album': instance.album,
      'duration': instance.duration,
      'copyrightId': instance.copyrightId,
      'status': instance.status,
      'alias': instance.alias,
      'rtype': instance.rtype,
      'ftype': instance.ftype,
      'mvid': instance.mvid,
      'fee': instance.fee,
      'mark': instance.mark
    };

Artists _$ArtistsFromJson(Map<String, dynamic> json) {
  return Artists(
      json['id'] as int,
      json['name'] as String,
      json['alias'] as List,
      json['albumSize'] as int,
      json['picId'] as int,
      json['img1v1Url'] as String,
      json['img1v1'] as int);
}

Map<String, dynamic> _$ArtistsToJson(Artists instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alias': instance.alias,
      'albumSize': instance.albumSize,
      'picId': instance.picId,
      'img1v1Url': instance.img1v1Url,
      'img1v1': instance.img1v1
    };

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return Album(
      json['id'] as int,
      json['name'] as String,
      json['artist'] == null
          ? null
          : Artist.fromJson(json['artist'] as Map<String, dynamic>),
      json['publishTime'] as int,
      json['size'] as int,
      json['copyrightId'] as int,
      json['status'] as int,
      json['picId'] as int,
      json['mark'] as int);
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'artist': instance.artist,
      'publishTime': instance.publishTime,
      'size': instance.size,
      'copyrightId': instance.copyrightId,
      'status': instance.status,
      'picId': instance.picId,
      'mark': instance.mark
    };

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return Artist(
      json['id'] as int,
      json['name'] as String,
      json['alias'] as List,
      json['albumSize'] as int,
      json['picId'] as int,
      json['img1v1Url'] as String,
      json['img1v1'] as int);
}

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alias': instance.alias,
      'albumSize': instance.albumSize,
      'picId': instance.picId,
      'img1v1Url': instance.img1v1Url,
      'img1v1': instance.img1v1
    };
