import 'package:flutter/material.dart';
import 'package:orderera_dio_http/services/post/set_client_address_service.dart';
import 'package:orderera_dio_http/bloc/models/address/get_client_address_model.dart';

class AddClientAddressBloc {
  final cityController = TextEditingController();
  final regionController = TextEditingController();
  final typeController = TextEditingController();
  final posController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();

  Future<GetClientAddressModel> createNewClientAddress({
    String? latitude,
    String? longitude,
    int? cityID,
    int? regionId,
    int? type,
    String? posName,
  }) async {
    return await SetClientAddressService().addNewClientAddress(
      body: {
        "latitude": "35.$latitude",
        "longitude": "32.$longitude",
        "city_id": "$cityID",
        "region_id": "$regionId",
        "type": "$type",
        "pos_name": posName,
      },
    );
  }
}
