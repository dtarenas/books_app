import 'dart:convert';

ResponseApiDeleteBookAppMaster ResponseApiDeleteBookAppMasterFromJson(String str) => ResponseApiDeleteBookAppMaster.fromJson(json.decode(str));
String ResponseApiDeleteBookAppMasterToJson(ResponseApiDeleteBookAppMaster data) => json.encode(data.toJson());
class ResponseApiDeleteBookAppMaster {
  ResponseApiDeleteBookAppMaster({
    String? error,
    bool? success,}){
    _error = error;
    _success = success;
  }

  ResponseApiDeleteBookAppMaster.fromJson(dynamic json) {
    _error = json['_error'];
    _success = json['_success'];
  }
  String? _error;
  bool? _success;
  ResponseApiDeleteBookAppMaster copyWith({  String? error,
    bool? success,
  }) => ResponseApiDeleteBookAppMaster(  error: error ?? _error,
    success: success ?? _success,
  );
  String? get error => _error;
  bool? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_error'] = _error;
    map['_success'] = _success;
    return map;
  }

}