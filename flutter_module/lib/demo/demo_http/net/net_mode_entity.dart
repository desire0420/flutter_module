class NetModeEntity {
  List<NetModeResult> result;
  int code;

  String message;

  NetModeEntity({this.result, this.code, this.message});

  NetModeEntity.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<NetModeResult>();
      (json['result'] as List).forEach((v) {
        result.add(new NetModeResult.fromJson(v));
      });
    }
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class NetModeResult {
  String country;
  String piaoId;
  String resEncryptionFlag;
  String mvProvider;
  String biaoshi;
  String artistName;
  int isFirstPublish;
  String language;
  String album10001000;
  String koreanBbSong;
  String picHuge;
  String allRate;
  String songSource;
  String songId;
  String album500500;
  String rank;
  String picPremium;
  String album800800;
  String info;
  String area;
  String siProxycompany;
  int hasMvMobile;
  String isNew;
  String author;
  String resourceType;
  String hasFilmtv;
  String allArtistTingUid;
  String artistId;
  String versions;
  String publishtime;
  String style;
  String albumId;
  String albumNo;
  String resourceTypeExt;
  String delStatus;
  String hot;
  String toneid;
  String title;
  String picBig;
  String relateStatus;
  String rankChange;
  String lrclink;
  int fileDuration;
  int havehigh;
  int charge;
  String picRadio;
  int learn;
  String picS500;
  String allArtistId;
  String picSmall;
  String bitrateFee;
  int hasMv;
  String copyType;
  String tingUid;
  String albumTitle;

  NetModeResult(
      {this.country,
      this.piaoId,
      this.resEncryptionFlag,
      this.mvProvider,
      this.biaoshi,
      this.artistName,
      this.isFirstPublish,
      this.language,
      this.album10001000,
      this.koreanBbSong,
      this.picHuge,
      this.allRate,
      this.songSource,
      this.songId,
      this.album500500,
      this.rank,
      this.picPremium,
      this.album800800,
      this.info,
      this.area,
      this.siProxycompany,
      this.hasMvMobile,
      this.isNew,
      this.author,
      this.resourceType,
      this.hasFilmtv,
      this.allArtistTingUid,
      this.artistId,
      this.versions,
      this.publishtime,
      this.style,
      this.albumId,
      this.albumNo,
      this.resourceTypeExt,
      this.delStatus,
      this.hot,
      this.toneid,
      this.title,
      this.picBig,
      this.relateStatus,
      this.rankChange,
      this.lrclink,
      this.fileDuration,
      this.havehigh,
      this.charge,
      this.picRadio,
      this.learn,
      this.picS500,
      this.allArtistId,
      this.picSmall,
      this.bitrateFee,
      this.hasMv,
      this.copyType,
      this.tingUid,
      this.albumTitle});

  NetModeResult.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    piaoId = json['piao_id'];
    resEncryptionFlag = json['res_encryption_flag'];
    mvProvider = json['mv_provider'];
    biaoshi = json['biaoshi'];
    artistName = json['artist_name'];
    isFirstPublish = json['is_first_publish'];
    language = json['language'];
    album10001000 = json['album_1000_1000'];
    koreanBbSong = json['korean_bb_song'];
    picHuge = json['pic_huge'];
    allRate = json['all_rate'];
    songSource = json['song_source'];
    songId = json['song_id'];
    album500500 = json['album_500_500'];
    rank = json['rank'];
    picPremium = json['pic_premium'];
    album800800 = json['album_800_800'];
    info = json['info'];
    area = json['area'];
    siProxycompany = json['si_proxycompany'];
    hasMvMobile = json['has_mv_mobile'];
    isNew = json['is_new'];
    author = json['author'];
    resourceType = json['resource_type'];
    hasFilmtv = json['has_filmtv'];
    allArtistTingUid = json['all_artist_ting_uid'];
    artistId = json['artist_id'];
    versions = json['versions'];
    publishtime = json['publishtime'];
    style = json['style'];
    albumId = json['album_id'];
    albumNo = json['album_no'];
    resourceTypeExt = json['resource_type_ext'];
    delStatus = json['del_status'];
    hot = json['hot'];
    toneid = json['toneid'];
    title = json['title'];
    picBig = json['pic_big'];
    relateStatus = json['relate_status'];
    rankChange = json['rank_change'];
    lrclink = json['lrclink'];
    fileDuration = json['file_duration'];
    havehigh = json['havehigh'];
    charge = json['charge'];
    picRadio = json['pic_radio'];
    learn = json['learn'];
    picS500 = json['pic_s500'];
    allArtistId = json['all_artist_id'];
    picSmall = json['pic_small'];
    bitrateFee = json['bitrate_fee'];
    hasMv = json['has_mv'];
    copyType = json['copy_type'];
    tingUid = json['ting_uid'];
    albumTitle = json['album_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['piao_id'] = this.piaoId;
    data['res_encryption_flag'] = this.resEncryptionFlag;
    data['mv_provider'] = this.mvProvider;
    data['biaoshi'] = this.biaoshi;
    data['artist_name'] = this.artistName;
    data['is_first_publish'] = this.isFirstPublish;
    data['language'] = this.language;
    data['album_1000_1000'] = this.album10001000;
    data['korean_bb_song'] = this.koreanBbSong;
    data['pic_huge'] = this.picHuge;
    data['all_rate'] = this.allRate;
    data['song_source'] = this.songSource;
    data['song_id'] = this.songId;
    data['album_500_500'] = this.album500500;
    data['rank'] = this.rank;
    data['pic_premium'] = this.picPremium;
    data['album_800_800'] = this.album800800;
    data['info'] = this.info;
    data['area'] = this.area;
    data['si_proxycompany'] = this.siProxycompany;
    data['has_mv_mobile'] = this.hasMvMobile;
    data['is_new'] = this.isNew;
    data['author'] = this.author;
    data['resource_type'] = this.resourceType;
    data['has_filmtv'] = this.hasFilmtv;
    data['all_artist_ting_uid'] = this.allArtistTingUid;
    data['artist_id'] = this.artistId;
    data['versions'] = this.versions;
    data['publishtime'] = this.publishtime;
    data['style'] = this.style;
    data['album_id'] = this.albumId;
    data['album_no'] = this.albumNo;
    data['resource_type_ext'] = this.resourceTypeExt;
    data['del_status'] = this.delStatus;
    data['hot'] = this.hot;
    data['toneid'] = this.toneid;
    data['title'] = this.title;
    data['pic_big'] = this.picBig;
    data['relate_status'] = this.relateStatus;
    data['rank_change'] = this.rankChange;
    data['lrclink'] = this.lrclink;
    data['file_duration'] = this.fileDuration;
    data['havehigh'] = this.havehigh;
    data['charge'] = this.charge;
    data['pic_radio'] = this.picRadio;
    data['learn'] = this.learn;
    data['pic_s500'] = this.picS500;
    data['all_artist_id'] = this.allArtistId;
    data['pic_small'] = this.picSmall;
    data['bitrate_fee'] = this.bitrateFee;
    data['has_mv'] = this.hasMv;
    data['copy_type'] = this.copyType;
    data['ting_uid'] = this.tingUid;
    data['album_title'] = this.albumTitle;
    return data;
  }
}
