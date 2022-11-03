class UserInfo {
  String id = "";
  String nickName = "";
  String picture = "";
  List<AppUserBadgeList>? appUserBadgeList;
  String mobile = "";
  String? brief;
  String token = "";
  String? birthDate;
  String? country;
  String? province;
  String? city;
  int? auth;
  String? company;
  String? email;
  String? position;
  int? fansNum;
  int? followNum;
  bool reInterestTag = false;

  UserInfo(
      {required this.id,
      required this.nickName,
      required this.picture,
      this.appUserBadgeList,
      required this.mobile,
      this.brief,
      required this.token,
      this.birthDate,
      this.country,
      this.province,
      this.city,
      this.auth,
      this.company,
      this.email,
      this.position,
      this.fansNum,
      this.followNum,
      required this.reInterestTag});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickName = json['nickName'];
    picture = json['picture'];
    if (json['appUserBadgeList'] != null) {
      appUserBadgeList = <AppUserBadgeList>[];
      json['appUserBadgeList'].forEach((v) {
        appUserBadgeList!.add(new AppUserBadgeList.fromJson(v));
      });
    }
    mobile = json['mobile'];
    brief = json['brief'];
    token = json['token'];
    birthDate = json['birthDate'];
    country = json['country'];
    province = json['province'];
    city = json['city'];
    auth = json['auth'];
    company = json['company'];
    email = json['email'];
    position = json['position'];
    fansNum = json['fansNum'];
    followNum = json['followNum'];
    reInterestTag = json['reInterestTag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nickName'] = this.nickName;
    data['picture'] = this.picture;
    if (this.appUserBadgeList != null) {
      data['appUserBadgeList'] =
          this.appUserBadgeList!.map((v) => v.toJson()).toList();
    }
    data['mobile'] = this.mobile;
    data['brief'] = this.brief;
    data['token'] = this.token;
    data['birthDate'] = this.birthDate;
    data['country'] = this.country;
    data['province'] = this.province;
    data['city'] = this.city;
    data['auth'] = this.auth;
    data['company'] = this.company;
    data['email'] = this.email;
    data['position'] = this.position;
    data['fansNum'] = this.fansNum;
    data['followNum'] = this.followNum;
    data['reInterestTag'] = this.reInterestTag;
    return data;
  }
}

class AppUserBadgeList {
  String? aa;
  String? bb;

  AppUserBadgeList({this.aa, this.bb});

  AppUserBadgeList.fromJson(Map<String, dynamic> json) {
    aa = json['aa'];
    bb = json['bb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aa'] = this.aa;
    data['bb'] = this.bb;
    return data;
  }
}
