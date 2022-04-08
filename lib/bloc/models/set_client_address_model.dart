class SetClientAddressModel {
  bool? status;
  List<Data>? data;
  String? message;
  String? requestId;

  SetClientAddressModel({this.status, this.data, this.message, this.requestId});

  SetClientAddressModel.fromJson(Map<String, dynamic> json) {
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
  int? addressId;
  String? posName;
  String? building;
  String? floor;
  int? type;
  String? latitude;
  String? longitude;
  int? isDefault;
  String? posImage;
  String? street;
  int? cityId;
  int? regionId;
  String? licenceImage;
  String? locationPhoneNumber;
  String? apartmentNumber;
  String? qrHash;

  Data(
      {this.addressId,
      this.posName,
      this.building,
      this.floor,
      this.type,
      this.latitude,
      this.longitude,
      this.isDefault,
      this.posImage,
      this.street,
      this.cityId,
      this.regionId,
      this.licenceImage,
      this.locationPhoneNumber,
      this.apartmentNumber,
      this.qrHash});

  Data.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    posName = json['pos_name'];
    building = json['building'];
    floor = json['floor'];
    type = json['type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isDefault = json['is_default'];
    posImage = json['pos_image'];
    street = json['street'];
    cityId = json['city_id'];
    regionId = json['region_id'];
    licenceImage = json['licence_image'];
    locationPhoneNumber = json['location_phone_number'];
    apartmentNumber = json['apartment_number'];
    qrHash = json['qr_hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressId;
    data['pos_name'] = posName;
    data['building'] = building;
    data['floor'] = floor;
    data['type'] = type;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['is_default'] = isDefault;
    data['pos_image'] = posImage;
    data['street'] = street;
    data['city_id'] = cityId;
    data['region_id'] = regionId;
    data['licence_image'] = licenceImage;
    data['location_phone_number'] = locationPhoneNumber;
    data['apartment_number'] = apartmentNumber;
    data['qr_hash'] = qrHash;
    return data;
  }
}
