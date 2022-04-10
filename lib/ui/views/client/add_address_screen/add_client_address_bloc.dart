import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:orderera_dio_http/bloc/models/address/get_client_address_model.dart';
import 'package:orderera_dio_http/bloc/models/address/set_client_address_model.dart';
// import 'package:orderera_dio_http/bloc/models/place_type/get_place_type_response_model.dart';
import 'package:orderera_dio_http/bloc/utils/repo/http_request.dart';
import 'package:orderera_dio_http/services/post/set_client_address_service.dart';

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

  List<Data>? listOfAddresses;
  //SetClientAddressModel
   GetClientAddressModel? addAddress;

  Future< GetClientAddressModel> createNewClientAddress(
      {required  GetClientAddressModel addClientAddress}) async {
     GetClientAddressModel? retrievedClientAddress;
    try {
      Response response = await HttpRequest().callRequest(
        requestType: REQUEST_TYPE.post,
        methodName: "address",
      );
      print('User created: ${response.data}');
      retrievedClientAddress =  GetClientAddressModel.fromJson(response.data);
    } catch (e) {
      print('Error creating address: $e');
    }

    return retrievedClientAddress!;
  }

  void addAddressRequest() {
    SetClientAddressService()
        .setClientAddress(clientAddress: addAddress!)
        .then((value) {
      print("message" + value.message!);
      print("data" + value.requestId!);

      for (var address in listOfAddresses!) {
        // if (address.id == id) {
        listOfAddresses!.add(address);
        // }
      }
    });
  }
}
