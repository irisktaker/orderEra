import 'dart:async';

import 'package:orderera_dio_http/bloc/models/address/get_client_address_model.dart';
import 'package:orderera_dio_http/bloc/models/address/set_client_address_model.dart';
import 'package:orderera_dio_http/services/delete/delete_client_address_service.dart';
import 'package:orderera_dio_http/services/get/get_client_address_service.dart';
import 'package:orderera_dio_http/services/post/set_client_address_service.dart';

class ClientAddressBloc {
  StreamController<GetClientAddressModel> responseStream =
      StreamController<GetClientAddressModel>();

  // StreamController<List<Data>> deleteResponseStream =
  //     StreamController<List<Data>>();

  List<Data>? listOfAddresses;

  void callRequest() {
    GetClientAddressService().placeTypeService().then((value) {
      responseStream.sink.add(value);
    });
  }

  void deleteRequest(int id) {
    DeleteClientAddressService().deleteClientAddress(id).then((value) {
      print("message" + value.message!);
      print("data" + value.requestId!);

      for (var address in listOfAddresses!) {
        if (address.addressId == id) {
          listOfAddresses!.removeAt(listOfAddresses![id].addressId!);
        }
      }
    });
  }

  // Future<SetClientAddressModel> setClientAddressModel() async {
  //   return await SetClientAddressService().setClientAddress(clientAddress: );
  // }
}
