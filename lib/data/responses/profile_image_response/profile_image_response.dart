import 'dart:convert';
ProfileImageResponse profileImageResponseFromJson(String str) => ProfileImageResponse.fromJson(json.decode(str));
String profileImageResponseToJson(ProfileImageResponse data) => json.encode(data.toJson());
class ProfileImageResponse {
  ProfileImageResponse({
      bool? status, 
      ProfileImageData? data,}){
    _status = status;
    _data = data;
}

  ProfileImageResponse.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? ProfileImageData.fromJson(json['data']) : null;
  }
  bool? _status;
  ProfileImageData? _data;
ProfileImageResponse copyWith({  bool? status,
  ProfileImageData? data,
}) => ProfileImageResponse(  status: status ?? _status,
  data: data ?? _data,
);
  bool get status => _status ?? false;
  ProfileImageData get data => _data?? ProfileImageData();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

ProfileImageData dataFromJson(String str) => ProfileImageData.fromJson(json.decode(str));
String dataToJson(ProfileImageData data) => json.encode(data.toJson());
class ProfileImageData {
  ProfileImageData({
      num? id, 
      String? name, 
      String? mobile, 
      String? email, 
      dynamic emailVerifiedAt, 
      String? otp, 
      dynamic avatar, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _mobile = mobile;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _otp = otp;
    _avatar = avatar;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ProfileImageData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _mobile = json['mobile'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _otp = json['otp'];
    _avatar = json['avatar'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _mobile;
  String? _email;
  dynamic _emailVerifiedAt;
  String? _otp;
  dynamic _avatar;
  String? _createdAt;
  String? _updatedAt;
ProfileImageData copyWith({  num? id,
  String? name,
  String? mobile,
  String? email,
  dynamic emailVerifiedAt,
  String? otp,
  dynamic avatar,
  String? createdAt,
  String? updatedAt,
}) => ProfileImageData(  id: id ?? _id,
  name: name ?? _name,
  mobile: mobile ?? _mobile,
  email: email ?? _email,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  otp: otp ?? _otp,
  avatar: avatar ?? _avatar,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num get id => _id ?? 0;
  String get name => _name ??'';
  String get mobile => _mobile ??'';
  String get email => _email ??'';
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String get otp => _otp ??'';
  dynamic get avatar => _avatar;
  String get createdAt => _createdAt ??'';
  String get updatedAt => _updatedAt ??'';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['otp'] = _otp;
    map['avatar'] = _avatar;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}