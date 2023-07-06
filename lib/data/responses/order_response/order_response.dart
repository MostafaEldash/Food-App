import 'dart:convert';
OrderResponse orderResponseFromJson(String str) => OrderResponse.fromJson(json.decode(str));
String orderResponseToJson(OrderResponse data) => json.encode(data.toJson());
class OrderResponse {
  OrderResponse({
      bool? status,}){
    _status = status;
}

  OrderResponse.fromJson(dynamic json) {
    _status = json['status'];
  }
  bool? _status;
OrderResponse copyWith({  bool? status,
}) => OrderResponse(  status: status ?? _status,
);
  bool get status => _status ?? false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    return map;
  }

}