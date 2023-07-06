import 'dart:convert';
LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));
String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
class LoginResponse {
  LoginResponse({
      User? user, 
      String? token, 
      bool? status, 
      String? message,}){
    _user = user;
    _token = token;
    _status = status;
    _message = message;
}

  LoginResponse.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
    _status = json['status'];
    _message = json['message'];
  }
  User? _user;
  String? _token;
  bool? _status;
  String? _message;
LoginResponse copyWith({  User? user,
  String? token,
  bool? status,
  String? message,
}) => LoginResponse(  user: user ?? _user,
  token: token ?? _token,
  status: status ?? _status,
  message: message ?? _message,
);
  User get user => _user ?? User();
  String get token => _token ?? '';
  bool get status => _status ?? false;
  String get message => _message ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['token'] = _token;
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
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

  User.fromJson(dynamic json) {
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
User copyWith({  num? id,
  String? name,
  String? mobile,
  String? email,
  dynamic emailVerifiedAt,
  String? otp,
  dynamic avatar,
  String? createdAt,
  String? updatedAt,
}) => User(  id: id ?? _id,
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
  String get name => _name ?? '';
  String get mobile => _mobile ?? '';
  String get email => _email ?? '';
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String get otp => _otp ?? '';
  dynamic get avatar => _avatar;
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

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