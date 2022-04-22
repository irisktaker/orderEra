import 'package:flutter/material.dart';
import 'package:orderera_dio_http/services/post/set_client_address_service.dart';
import 'package:orderera_dio_http/bloc/models/address/get_client_address_model.dart';

class AddClientAddressBloc {
  TextEditingController locationFieldTypeController = TextEditingController();
  TextEditingController cityFieldController = TextEditingController();
  TextEditingController regionFieldController = TextEditingController();
  TextEditingController streetFieldController = TextEditingController();
  TextEditingController nPOSFieldController = TextEditingController();
  TextEditingController buildingFieldController = TextEditingController();
  TextEditingController floorFieldController = TextEditingController();
  TextEditingController identityFieldController = TextEditingController();
  TextEditingController selectOnMapFieldController = TextEditingController();

  Future<GetClientAddressModel> createNewClientAddress({
    String? locationPhone,
    String? latitude,
    String? longitude,
    int? cityID,
    int? regionId,
    int? type,
    String? street,
    String? posName,
    int? building,
    int? floor,
    int? apartment,
}) async {
    return await SetClientAddressService().addNewClientAddress(
      body: {
        "location_phone_number": locationPhone,
        "latitude": "35.9876676534",
        "longitude": "32.0985887653",
        "city_id": cityID,
        "region_id": regionId,
        "type": type,
        "street": street,
        // "licence_image" : ,
        // "pos_image" : ,
        "pos_name": posName,
        "building": building,
        "floor": floor,
        "apartment_number": apartment,
        // "qr_hash": null,
      },
    );
  }
}
