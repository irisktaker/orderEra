class GetPlaceTypeResponseModel {
  bool? status;
  List<Data>? data;
  String? message;
  String? requestId;

  GetPlaceTypeResponseModel({this.status, this.data, this.message, this.requestId});

  GetPlaceTypeResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['request_id'] = requestId;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? icon;

  Data({this.id, this.name, this.icon});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    return data;
  }
}
