// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_songs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewSongs _$NewSongsFromJson(Map<String, dynamic> json) {
  return NewSongs(
      json['code'] as int,
      json['playlist'] == null
          ? null
          : Playlist.fromJson(json['playlist'] as Map<String, dynamic>),
      (json['privileges'] as List)
          ?.map((e) =>
              e == null ? null : Privileges.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$NewSongsToJson(NewSongs instance) => <String, dynamic>{
      'code': instance.code,
      'playlist': instance.playlist,
      'privileges': instance.privileges
    };

Playlist _$PlaylistFromJson(Map<String, dynamic> json) {
  return Playlist(
      json['subscribers'] as List,
      json['subscribed'] as bool,
      json['creator'] == null
          ? null
          : Creator.fromJson(json['creator'] as Map<String, dynamic>),
      (json['tracks'] as List)
          ?.map((e) =>
              e == null ? null : Tracks.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['trackIds'] as List)
          ?.map((e) =>
              e == null ? null : TrackIds.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['backgroundCoverId'] as int,
      json['titleImage'] as int,
      json['opRecommend'] as bool,
      json['adType'] as int,
      json['trackNumberUpdateTime'] as int,
      json['subscribedCount'] as int,
      json['cloudTrackCount'] as int,
      json['userId'] as int,
      json['createTime'] as int,
      json['highQuality'] as bool,
      json['updateTime'] as int,
      json['coverImgId'] as int,
      json['newImported'] as bool,
      json['specialType'] as int,
      json['coverImgUrl'] as String,
      json['privacy'] as int,
      json['trackUpdateTime'] as int,
      json['trackCount'] as int,
      json['commentThreadId'] as String,
      json['playCount'] as int,
      json['ordered'] as bool,
      json['description'] as String,
      (json['tags'] as List)?.map((e) => e as String)?.toList(),
      json['status'] as int,
      json['name'] as String,
      json['id'] as int,
      json['shareCount'] as int,
      json['commentCount'] as int);
}

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'subscribers': instance.subscribers,
      'subscribed': instance.subscribed,
      'creator': instance.creator,
      'tracks': instance.tracks,
      'trackIds': instance.trackIds,
      'backgroundCoverId': instance.backgroundCoverId,
      'titleImage': instance.titleImage,
      'opRecommend': instance.opRecommend,
      'adType': instance.adType,
      'trackNumberUpdateTime': instance.trackNumberUpdateTime,
      'subscribedCount': instance.subscribedCount,
      'cloudTrackCount': instance.cloudTrackCount,
      'userId': instance.userId,
      'createTime': instance.createTime,
      'highQuality': instance.highQuality,
      'updateTime': instance.updateTime,
      'coverImgId': instance.coverImgId,
      'newImported': instance.newImported,
      'specialType': instance.specialType,
      'coverImgUrl': instance.coverImgUrl,
      'privacy': instance.privacy,
      'trackUpdateTime': instance.trackUpdateTime,
      'trackCount': instance.trackCount,
      'commentThreadId': instance.commentThreadId,
      'playCount': instance.playCount,
      'ordered': instance.ordered,
      'description': instance.description,
      'tags': instance.tags,
      'status': instance.status,
      'name': instance.name,
      'id': instance.id,
      'shareCount': instance.shareCount,
      'commentCount': instance.commentCount
    };

Creator _$CreatorFromJson(Map<String, dynamic> json) {
  return Creator(
      json['defaultAvatar'] as bool,
      json['province'] as int,
      json['authStatus'] as int,
      json['followed'] as bool,
      json['avatarUrl'] as String,
      json['accountStatus'] as int,
      json['gender'] as int,
      json['city'] as int,
      json['birthday'] as int,
      json['userId'] as int,
      json['userType'] as int,
      json['nickname'] as String,
      json['signature'] as String,
      json['description'] as String,
      json['detailDescription'] as String,
      json['avatarImgId'] as int,
      json['backgroundImgId'] as int,
      json['backgroundUrl'] as String,
      json['authority'] as int,
      json['mutual'] as bool,
      json['djStatus'] as int,
      json['vipType'] as int,
      json['avatarImgIdStr'] as String,
      json['backgroundImgIdStr'] as String);
}

Map<String, dynamic> _$CreatorToJson(Creator instance) => <String, dynamic>{
      'defaultAvatar': instance.defaultAvatar,
      'province': instance.province,
      'authStatus': instance.authStatus,
      'followed': instance.followed,
      'avatarUrl': instance.avatarUrl,
      'accountStatus': instance.accountStatus,
      'gender': instance.gender,
      'city': instance.city,
      'birthday': instance.birthday,
      'userId': instance.userId,
      'userType': instance.userType,
      'nickname': instance.nickname,
      'signature': instance.signature,
      'description': instance.description,
      'detailDescription': instance.detailDescription,
      'avatarImgId': instance.avatarImgId,
      'backgroundImgId': instance.backgroundImgId,
      'backgroundUrl': instance.backgroundUrl,
      'authority': instance.authority,
      'mutual': instance.mutual,
      'djStatus': instance.djStatus,
      'vipType': instance.vipType,
      'avatarImgIdStr': instance.avatarImgIdStr,
      'backgroundImgIdStr': instance.backgroundImgIdStr
    };

Tracks _$TracksFromJson(Map<String, dynamic> json) {
  return Tracks(
      json['name'] as String,
      json['id'] as int,
      json['pst'] as int,
      json['t'] as int,
      (json['ar'] as List)
          ?.map(
              (e) => e == null ? null : Ar.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['alia'] as List,
      (json['pop'] as num)?.toDouble(),
      json['st'] as int,
      json['rt'] as String,
      json['fee'] as int,
      json['v'] as int,
      json['cf'] as String,
      json['al'] == null
          ? null
          : Al.fromJson(json['al'] as Map<String, dynamic>),
      json['dt'] as int,
      json['h'] == null ? null : H.fromJson(json['h'] as Map<String, dynamic>),
      json['m'] == null ? null : M.fromJson(json['m'] as Map<String, dynamic>),
      json['l'] == null ? null : L.fromJson(json['l'] as Map<String, dynamic>),
      json['cd'] as String,
      json['no'] as int,
      json['ftype'] as int,
      json['rtUrls'] as List,
      json['djId'] as int,
      json['copyright'] as int,
      json['s_id'] as int,
      json['mark'] as int,
      json['originCoverType'] as int,
      json['rtype'] as int,
      json['mst'] as int,
      json['cp'] as int,
      json['mv'] as int,
      json['publishTime'] as int,
      (json['tns'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$TracksToJson(Tracks instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'pst': instance.pst,
      't': instance.t,
      'ar': instance.ar,
      'alia': instance.alia,
      'pop': instance.pop,
      'st': instance.st,
      'rt': instance.rt,
      'fee': instance.fee,
      'v': instance.v,
      'cf': instance.cf,
      'al': instance.al,
      'dt': instance.dt,
      'h': instance.h,
      'm': instance.m,
      'l': instance.l,
      'cd': instance.cd,
      'no': instance.no,
      'ftype': instance.ftype,
      'rtUrls': instance.rtUrls,
      'djId': instance.djId,
      'copyright': instance.copyright,
      's_id': instance.sId,
      'mark': instance.mark,
      'originCoverType': instance.originCoverType,
      'rtype': instance.rtype,
      'mst': instance.mst,
      'cp': instance.cp,
      'mv': instance.mv,
      'publishTime': instance.publishTime,
      'tns': instance.tns
    };

Ar _$ArFromJson(Map<String, dynamic> json) {
  return Ar(json['id'] as int, json['name'] as String, json['tns'] as List,
      json['alias'] as List);
}

Map<String, dynamic> _$ArToJson(Ar instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tns': instance.tns,
      'alias': instance.alias
    };

Al _$AlFromJson(Map<String, dynamic> json) {
  return Al(json['id'] as int, json['name'] as String, json['picUrl'] as String,
      json['tns'] as List, json['pic_str'] as String, json['pic'] as int);
}

Map<String, dynamic> _$AlToJson(Al instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'tns': instance.tns,
      'pic_str': instance.picStr,
      'pic': instance.pic
    };

H _$HFromJson(Map<String, dynamic> json) {
  return H(json['br'] as int, json['fid'] as int, json['size'] as int,
      (json['vd'] as num)?.toDouble());
}

Map<String, dynamic> _$HToJson(H instance) => <String, dynamic>{
      'br': instance.br,
      'fid': instance.fid,
      'size': instance.size,
      'vd': instance.vd
    };

M _$MFromJson(Map<String, dynamic> json) {
  return M(json['br'] as int, json['fid'] as int, json['size'] as int,
      (json['vd'] as num)?.toDouble());
}

Map<String, dynamic> _$MToJson(M instance) => <String, dynamic>{
      'br': instance.br,
      'fid': instance.fid,
      'size': instance.size,
      'vd': instance.vd
    };

L _$LFromJson(Map<String, dynamic> json) {
  return L(json['br'] as int, json['fid'] as int, json['size'] as int,
      (json['vd'] as num)?.toDouble());
}

Map<String, dynamic> _$LToJson(L instance) => <String, dynamic>{
      'br': instance.br,
      'fid': instance.fid,
      'size': instance.size,
      'vd': instance.vd
    };

TrackIds _$TrackIdsFromJson(Map<String, dynamic> json) {
  return TrackIds(json['id'] as int, json['v'] as int, json['at'] as int);
}

Map<String, dynamic> _$TrackIdsToJson(TrackIds instance) =>
    <String, dynamic>{'id': instance.id, 'v': instance.v, 'at': instance.at};

Privileges _$PrivilegesFromJson(Map<String, dynamic> json) {
  return Privileges(
      json['id'] as int,
      json['fee'] as int,
      json['payed'] as int,
      json['st'] as int,
      json['pl'] as int,
      json['dl'] as int,
      json['sp'] as int,
      json['cp'] as int,
      json['subp'] as int,
      json['cs'] as bool,
      json['maxbr'] as int,
      json['fl'] as int,
      json['toast'] as bool,
      json['flag'] as int,
      json['preSell'] as bool,
      json['playMaxbr'] as int,
      json['downloadMaxbr'] as int);
}

Map<String, dynamic> _$PrivilegesToJson(Privileges instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fee': instance.fee,
      'payed': instance.payed,
      'st': instance.st,
      'pl': instance.pl,
      'dl': instance.dl,
      'sp': instance.sp,
      'cp': instance.cp,
      'subp': instance.subp,
      'cs': instance.cs,
      'maxbr': instance.maxbr,
      'fl': instance.fl,
      'toast': instance.toast,
      'flag': instance.flag,
      'preSell': instance.preSell,
      'playMaxbr': instance.playMaxbr,
      'downloadMaxbr': instance.downloadMaxbr
    };
