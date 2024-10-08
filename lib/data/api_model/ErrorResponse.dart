/// success : false
/// status_code : 34
/// status_message : "The resource you requested could not be found."

class ErrorResponse {
  ErrorResponse({
      this.success, 
      this.statusCode, 
      this.statusMessage,});

  ErrorResponse.fromJson(dynamic json) {
    success = json['success'];
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }
  bool? success;
  num? statusCode;
  String? statusMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['status_code'] = statusCode;
    map['status_message'] = statusMessage;
    return map;
  }

}