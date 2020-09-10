import 'package:json_annotation/json_annotation.dart'; 
  
part 'new_songs.g.dart';


@JsonSerializable()
  class NewSongs extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'playlist')
  Playlist playlist;

  @JsonKey(name: 'privileges')
  List<Privileges> privileges;

  NewSongs(this.code,this.playlist,this.privileges,);

  factory NewSongs.fromJson(Map<String, dynamic> srcJson) => _$NewSongsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewSongsToJson(this);

}

  
@JsonSerializable()
  class Playlist extends Object {

  @JsonKey(name: 'subscribers')
  List<dynamic> subscribers;

  @JsonKey(name: 'subscribed')
  bool subscribed;

  @JsonKey(name: 'creator')
  Creator creator;

  @JsonKey(name: 'tracks')
  List<Tracks> tracks;

  @JsonKey(name: 'trackIds')
  List<TrackIds> trackIds;

  @JsonKey(name: 'backgroundCoverId')
  int backgroundCoverId;

  @JsonKey(name: 'titleImage')
  int titleImage;

  @JsonKey(name: 'opRecommend')
  bool opRecommend;

  @JsonKey(name: 'adType')
  int adType;

  @JsonKey(name: 'trackNumberUpdateTime')
  int trackNumberUpdateTime;

  @JsonKey(name: 'subscribedCount')
  int subscribedCount;

  @JsonKey(name: 'cloudTrackCount')
  int cloudTrackCount;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'createTime')
  int createTime;

  @JsonKey(name: 'highQuality')
  bool highQuality;

  @JsonKey(name: 'updateTime')
  int updateTime;

  @JsonKey(name: 'coverImgId')
  int coverImgId;

  @JsonKey(name: 'newImported')
  bool newImported;

  @JsonKey(name: 'specialType')
  int specialType;

  @JsonKey(name: 'coverImgUrl')
  String coverImgUrl;

  @JsonKey(name: 'privacy')
  int privacy;

  @JsonKey(name: 'trackUpdateTime')
  int trackUpdateTime;

  @JsonKey(name: 'trackCount')
  int trackCount;

  @JsonKey(name: 'commentThreadId')
  String commentThreadId;

  @JsonKey(name: 'playCount')
  int playCount;

  @JsonKey(name: 'ordered')
  bool ordered;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'tags')
  List<String> tags;

  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'shareCount')
  int shareCount;

  @JsonKey(name: 'commentCount')
  int commentCount;

  Playlist(this.subscribers,this.subscribed,this.creator,this.tracks,this.trackIds,this.backgroundCoverId,this.titleImage,this.opRecommend,this.adType,this.trackNumberUpdateTime,this.subscribedCount,this.cloudTrackCount,this.userId,this.createTime,this.highQuality,this.updateTime,this.coverImgId,this.newImported,this.specialType,this.coverImgUrl,this.privacy,this.trackUpdateTime,this.trackCount,this.commentThreadId,this.playCount,this.ordered,this.description,this.tags,this.status,this.name,this.id,this.shareCount,this.commentCount,);

  factory Playlist.fromJson(Map<String, dynamic> srcJson) => _$PlaylistFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);

}

  
@JsonSerializable()
  class Creator extends Object {

  @JsonKey(name: 'defaultAvatar')
  bool defaultAvatar;

  @JsonKey(name: 'province')
  int province;

  @JsonKey(name: 'authStatus')
  int authStatus;

  @JsonKey(name: 'followed')
  bool followed;

  @JsonKey(name: 'avatarUrl')
  String avatarUrl;

  @JsonKey(name: 'accountStatus')
  int accountStatus;

  @JsonKey(name: 'gender')
  int gender;

  @JsonKey(name: 'city')
  int city;

  @JsonKey(name: 'birthday')
  int birthday;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'userType')
  int userType;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'signature')
  String signature;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'detailDescription')
  String detailDescription;

  @JsonKey(name: 'avatarImgId')
  int avatarImgId;

  @JsonKey(name: 'backgroundImgId')
  int backgroundImgId;

  @JsonKey(name: 'backgroundUrl')
  String backgroundUrl;

  @JsonKey(name: 'authority')
  int authority;

  @JsonKey(name: 'mutual')
  bool mutual;

  @JsonKey(name: 'djStatus')
  int djStatus;

  @JsonKey(name: 'vipType')
  int vipType;

  @JsonKey(name: 'avatarImgIdStr')
  String avatarImgIdStr;

  @JsonKey(name: 'backgroundImgIdStr')
  String backgroundImgIdStr;

  @JsonKey(name: 'avatarImgId_str')


  Creator(this.defaultAvatar,this.province,this.authStatus,this.followed,this.avatarUrl,this.accountStatus,this.gender,this.city,this.birthday,this.userId,this.userType,this.nickname,this.signature,this.description,this.detailDescription,this.avatarImgId,this.backgroundImgId,this.backgroundUrl,this.authority,this.mutual,this.djStatus,this.vipType,this.avatarImgIdStr,this.backgroundImgIdStr,);

  factory Creator.fromJson(Map<String, dynamic> srcJson) => _$CreatorFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CreatorToJson(this);

}

  
@JsonSerializable()
  class Tracks extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'pst')
  int pst;

  @JsonKey(name: 't')
  int t;

  @JsonKey(name: 'ar')
  List<Ar> ar;

  @JsonKey(name: 'alia')
  List<dynamic> alia;

  @JsonKey(name: 'pop')
  double pop;

  @JsonKey(name: 'st')
  int st;

  @JsonKey(name: 'rt')
  String rt;

  @JsonKey(name: 'fee')
  int fee;

  @JsonKey(name: 'v')
  int v;

  @JsonKey(name: 'cf')
  String cf;

  @JsonKey(name: 'al')
  Al al;

  @JsonKey(name: 'dt')
  int dt;

  @JsonKey(name: 'h')
  H h;

  @JsonKey(name: 'm')
  M m;

  @JsonKey(name: 'l')
  L l;

  @JsonKey(name: 'cd')
  String cd;

  @JsonKey(name: 'no')
  int no;

  @JsonKey(name: 'ftype')
  int ftype;

  @JsonKey(name: 'rtUrls')
  List<dynamic> rtUrls;

  @JsonKey(name: 'djId')
  int djId;

  @JsonKey(name: 'copyright')
  int copyright;

  @JsonKey(name: 's_id')
  int sId;

  @JsonKey(name: 'mark')
  int mark;

  @JsonKey(name: 'originCoverType')
  int originCoverType;

  @JsonKey(name: 'rtype')
  int rtype;

  @JsonKey(name: 'mst')
  int mst;

  @JsonKey(name: 'cp')
  int cp;

  @JsonKey(name: 'mv')
  int mv;

  @JsonKey(name: 'publishTime')
  int publishTime;

  @JsonKey(name: 'tns')
  List<String> tns;

  Tracks(this.name,this.id,this.pst,this.t,this.ar,this.alia,this.pop,this.st,this.rt,this.fee,this.v,this.cf,this.al,this.dt,this.h,this.m,this.l,this.cd,this.no,this.ftype,this.rtUrls,this.djId,this.copyright,this.sId,this.mark,this.originCoverType,this.rtype,this.mst,this.cp,this.mv,this.publishTime,this.tns,);

  factory Tracks.fromJson(Map<String, dynamic> srcJson) => _$TracksFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TracksToJson(this);

}

  
@JsonSerializable()
  class Ar extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'tns')
  List<dynamic> tns;

  @JsonKey(name: 'alias')
  List<dynamic> alias;

  Ar(this.id,this.name,this.tns,this.alias,);

  factory Ar.fromJson(Map<String, dynamic> srcJson) => _$ArFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArToJson(this);

}

  
@JsonSerializable()
  class Al extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'picUrl')
  String picUrl;

  @JsonKey(name: 'tns')
  List<dynamic> tns;

  @JsonKey(name: 'pic_str')
  String picStr;

  @JsonKey(name: 'pic')
  int pic;

  Al(this.id,this.name,this.picUrl,this.tns,this.picStr,this.pic,);

  factory Al.fromJson(Map<String, dynamic> srcJson) => _$AlFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AlToJson(this);

}

  
@JsonSerializable()
  class H extends Object {

  @JsonKey(name: 'br')
  int br;

  @JsonKey(name: 'fid')
  int fid;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'vd')
  double vd;

  H(this.br,this.fid,this.size,this.vd,);

  factory H.fromJson(Map<String, dynamic> srcJson) => _$HFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HToJson(this);

}

  
@JsonSerializable()
  class M extends Object {

  @JsonKey(name: 'br')
  int br;

  @JsonKey(name: 'fid')
  int fid;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'vd')
  double vd;

  M(this.br,this.fid,this.size,this.vd,);

  factory M.fromJson(Map<String, dynamic> srcJson) => _$MFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MToJson(this);

}

  
@JsonSerializable()
  class L extends Object {

  @JsonKey(name: 'br')
  int br;

  @JsonKey(name: 'fid')
  int fid;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'vd')
  double vd;

  L(this.br,this.fid,this.size,this.vd,);

  factory L.fromJson(Map<String, dynamic> srcJson) => _$LFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LToJson(this);

}

  
@JsonSerializable()
  class TrackIds extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'v')
  int v;

  @JsonKey(name: 'at')
  int at;

  TrackIds(this.id,this.v,this.at,);

  factory TrackIds.fromJson(Map<String, dynamic> srcJson) => _$TrackIdsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TrackIdsToJson(this);

}

  
@JsonSerializable()
  class Privileges extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'fee')
  int fee;

  @JsonKey(name: 'payed')
  int payed;

  @JsonKey(name: 'st')
  int st;

  @JsonKey(name: 'pl')
  int pl;

  @JsonKey(name: 'dl')
  int dl;

  @JsonKey(name: 'sp')
  int sp;

  @JsonKey(name: 'cp')
  int cp;

  @JsonKey(name: 'subp')
  int subp;

  @JsonKey(name: 'cs')
  bool cs;

  @JsonKey(name: 'maxbr')
  int maxbr;

  @JsonKey(name: 'fl')
  int fl;

  @JsonKey(name: 'toast')
  bool toast;

  @JsonKey(name: 'flag')
  int flag;

  @JsonKey(name: 'preSell')
  bool preSell;

  @JsonKey(name: 'playMaxbr')
  int playMaxbr;

  @JsonKey(name: 'downloadMaxbr')
  int downloadMaxbr;

  Privileges(this.id,this.fee,this.payed,this.st,this.pl,this.dl,this.sp,this.cp,this.subp,this.cs,this.maxbr,this.fl,this.toast,this.flag,this.preSell,this.playMaxbr,this.downloadMaxbr,);

  factory Privileges.fromJson(Map<String, dynamic> srcJson) => _$PrivilegesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PrivilegesToJson(this);

}

  
