import 'dart:convert';
RestaurantResponse restaurantResponseFromJson(String str) => RestaurantResponse.fromJson(json.decode(str));
String restaurantResponseToJson(RestaurantResponse data) => json.encode(data.toJson());
class RestaurantResponse {
  RestaurantResponse({
      bool? status, 
      List<RestaurantsData>? data,}){
    _status = status;
    _data = data;
}

  RestaurantResponse.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(RestaurantsData.fromJson(v));
      });
    }
  }
  bool? _status;
  List<RestaurantsData>? _data;
RestaurantResponse copyWith({  bool? status,
  List<RestaurantsData>? data,
}) => RestaurantResponse(  status: status ?? _status,
  data: data ?? _data,
);
  bool get status => _status ?? false;
  List<RestaurantsData> get data => _data ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

RestaurantsData dataFromJson(String str) => RestaurantsData.fromJson(json.decode(str));
String dataToJson(RestaurantsData data) => json.encode(data.toJson());
class RestaurantsData {
  RestaurantsData({
      num? id, 
      String? pic, 
      String? coverPhoto, 
      String? name, 
      String? deliveryTime, 
      String? tags1, 
      String? tags2, 
      String? verified, 
      String? lat, 
      String? long, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _pic = pic;
    _coverPhoto = coverPhoto;
    _name = name;
    _deliveryTime = deliveryTime;
    _tags1 = tags1;
    _tags2 = tags2;
    _verified = verified;
    _lat = lat;
    _long = long;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  RestaurantsData.fromJson(dynamic json) {
    _id = json['id'];
    _pic = json['pic'];
    _coverPhoto = json['cover_photo'];
    _name = json['name'];
    _deliveryTime = json['delivery_time'];
    _tags1 = json['tags1'];
    _tags2 = json['tags2'];
    _verified = json['verified'];
    _lat = json['lat'];
    _long = json['long'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _pic;
  String? _coverPhoto;
  String? _name;
  String? _deliveryTime;
  String? _tags1;
  String? _tags2;
  String? _verified;
  String? _lat;
  String? _long;
  String? _createdAt;
  String? _updatedAt;
RestaurantsData copyWith({  num? id,
  String? pic,
  String? coverPhoto,
  String? name,
  String? deliveryTime,
  String? tags1,
  String? tags2,
  String? verified,
  String? lat,
  String? long,
  String? createdAt,
  String? updatedAt,
}) => RestaurantsData(  id: id ?? _id,
  pic: pic ?? _pic,
  coverPhoto: coverPhoto ?? _coverPhoto,
  name: name ?? _name,
  deliveryTime: deliveryTime ?? _deliveryTime,
  tags1: tags1 ?? _tags1,
  tags2: tags2 ?? _tags2,
  verified: verified ?? _verified,
  lat: lat ?? _lat,
  long: long ?? _long,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num get id => _id ?? 0;
  String get pic => _pic ?? '';
  String get coverPhoto => _coverPhoto ?? '';
  String get name => _name ?? '';
  String get deliveryTime => _deliveryTime ?? '';
  String get tags1 => _tags1 ?? '';
  String get tags2 => _tags2 ?? '';
  String get verified => _verified ?? '';
  String get lat => _lat ?? '';
  String get long => _long ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['pic'] = _pic;
    map['cover_photo'] = _coverPhoto;
    map['name'] = _name;
    map['delivery_time'] = _deliveryTime;
    map['tags1'] = _tags1;
    map['tags2'] = _tags2;
    map['verified'] = _verified;
    map['lat'] = _lat;
    map['long'] = _long;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}