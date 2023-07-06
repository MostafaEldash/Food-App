import 'dart:convert';
RegistrationResponse registrationResponseFromJson(String str) => RegistrationResponse.fromJson(json.decode(str));
String registrationResponseToJson(RegistrationResponse data) => json.encode(data.toJson());
class RegistrationResponse {
  RegistrationResponse({
      bool? status, 
      Data? data, 
      String? token, 
      Massege? massege,}){
    _status = status;
    _data = data;
    _token = token;
    _massege = massege;
}

  RegistrationResponse.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _token = json['token'];
    _massege = json['massege'] != null ? Massege.fromJson(json['massege']) : null;
  }
  bool? _status;
  Data? _data;
  String? _token;
  Massege? _massege;
RegistrationResponse copyWith({  bool? status,
  Data? data,
  String? token,
  Massege? massege,
}) => RegistrationResponse(  status: status ?? _status,
  data: data ?? _data,
  token: token ?? _token,
  massege: massege ?? _massege,
);
  bool get status => _status ?? false;
  Data get data => _data ?? Data();
  String get token => _token ?? '';
  Massege get massege => _massege ?? Massege();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['token'] = _token;
    if (_massege != null) {
      map['massege'] = _massege?.toJson();
    }
    return map;
  }

}

Massege massegeFromJson(String str) => Massege.fromJson(json.decode(str));
String massegeToJson(Massege data) => json.encode(data.toJson());
class Massege {
  Massege({
      List<String>? email,}){
    _email = email;
}

  Massege.fromJson(dynamic json) {
    _email = json['email'] != null ? json['email'].cast<String>() : [];
  }
  List<String>? _email;
Massege copyWith({  List<String>? email,
}) => Massege(  email: email ?? _email,
);
  List<String>? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? name, 
      String? email, 
      String? mobile, 
      num? otp, 
      String? updatedAt, 
      String? createdAt, 
      num? id,}){
    _name = name;
    _email = email;
    _mobile = mobile;
    _otp = otp;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
}

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _otp = json['otp'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }
  String? _name;
  String? _email;
  String? _mobile;
  num? _otp;
  String? _updatedAt;
  String? _createdAt;
  num? _id;
Data copyWith({  String? name,
  String? email,
  String? mobile,
  num? otp,
  String? updatedAt,
  String? createdAt,
  num? id,
}) => Data(  name: name ?? _name,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  otp: otp ?? _otp,
  updatedAt: updatedAt ?? _updatedAt,
  createdAt: createdAt ?? _createdAt,
  id: id ?? _id,
);
  String get name => _name ?? '';
  String get email => _email ?? '';
  String get mobile => _mobile ?? '';
  num get otp => _otp ?? 0;
  String get updatedAt => _updatedAt ?? '';
  String get createdAt => _createdAt ?? '';
  num get id => _id ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['otp'] = _otp;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }

}