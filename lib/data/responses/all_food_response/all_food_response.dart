import 'dart:convert';
AllFoodResponse allFoodResponseFromJson(String str) => AllFoodResponse.fromJson(json.decode(str));
String allFoodResponseToJson(AllFoodResponse data) => json.encode(data.toJson());
class AllFoodResponse {
  AllFoodResponse({
      bool? status, 
      List<AllFoodData>? data,}){
    _status = status;
    _data = data;
}

  AllFoodResponse.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AllFoodData.fromJson(v));
      });
    }
  }
  bool? _status;
  List<AllFoodData>? _data;
AllFoodResponse copyWith({  bool? status,
  List<AllFoodData>? data,
}) => AllFoodResponse(  status: status ?? _status,
  data: data ?? _data,
);
  bool get status => _status ?? false;
  List<AllFoodData> get data => _data ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

AllFoodData dataFromJson(String str) => AllFoodData.fromJson(json.decode(str));
String dataToJson(AllFoodData data) => json.encode(data.toJson());
class AllFoodData {
  AllFoodData({
      num? id, 
      String? name, 
      String? description, 
      String? price, 
      String? restaurentId, 
      String? catId, 
      dynamic pic, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _description = description;
    _price = price;
    _restaurentId = restaurentId;
    _catId = catId;
    _pic = pic;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  AllFoodData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _restaurentId = json['restaurent_id'];
    _catId = json['cat_id'];
    _pic = json['pic'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  String? _description;
  String? _price;
  String? _restaurentId;
  String? _catId;
  dynamic _pic;
  String? _createdAt;
  String? _updatedAt;
AllFoodData copyWith({  num? id,
  String? name,
  String? description,
  String? price,
  String? restaurentId,
  String? catId,
  dynamic pic,
  String? createdAt,
  String? updatedAt,
}) => AllFoodData(  id: id ?? _id,
  name: name ?? _name,
  description: description ?? _description,
  price: price ?? _price,
  restaurentId: restaurentId ?? _restaurentId,
  catId: catId ?? _catId,
  pic: pic ?? _pic,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num get id => _id ?? 0;
  String get name => _name ?? '';
  String get description => _description ?? '';
  String get price => _price ?? '';
  String get restaurentId => _restaurentId ?? '';
  String get catId => _catId ?? '';
  dynamic get pic => _pic;
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    map['restaurent_id'] = _restaurentId;
    map['cat_id'] = _catId;
    map['pic'] = _pic;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}