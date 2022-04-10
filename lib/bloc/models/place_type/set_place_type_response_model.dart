class SetPlaceTypeResponseModel {
  bool? status;
  String? message;
  String? responseId;

  SetPlaceTypeResponseModel({this.status, this.message, this.responseId});
  SetPlaceTypeResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    responseId = json['responseId'];
  }
}
