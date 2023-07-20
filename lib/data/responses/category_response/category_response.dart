import 'dart:convert';
CategoryResponse categoryResponseFromJson(String str) => CategoryResponse.fromJson(json.decode(str));
String categoryResponseToJson(CategoryResponse data) => json.encode(data.toJson());
class CategoryResponse {
  CategoryResponse({
      bool? status, 
      List<CategoryData>? data,}){
    _status = status;
    _data = data;
}

  CategoryResponse.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CategoryData.fromJson(v));
      });
    }
  }
  bool? _status;
  List<CategoryData>? _data;
CategoryResponse copyWith({  bool? status,
  List<CategoryData>? data,
}) => CategoryResponse(  status: status ?? _status,
  data: data ?? _data,
);
  bool get status => _status ?? false;
  List<CategoryData> get data => _data ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

CategoryData dataFromJson(String str) => CategoryData.fromJson(json.decode(str));
String dataToJson(CategoryData data) => json.encode(data.toJson());
class CategoryData {
  CategoryData({
      num? id, 
      String? name, 
      dynamic pic, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _pic = pic;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  CategoryData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _pic = json['pic'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  dynamic _pic;
  String? _createdAt;
  String? _updatedAt;
CategoryData copyWith({  num? id,
  String? name,
  dynamic pic,
  String? createdAt,
  String? updatedAt,
}) => CategoryData(  id: id ?? _id,
  name: name ?? _name,
  pic: pic ?? _pic,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num get id => _id ?? 0;
  String get name => _name ?? '';
  dynamic get pic => _pic;
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['pic'] = _pic;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}