import 'dart:async';

import 'package:orderera_dio_http/services/get/get_client_address_service.dart';
import 'package:orderera_dio_http/bloc/models/address/get_client_address_model.dart';
import 'package:orderera_dio_http/services/delete/delete_client_address_service.dart';

class ClientAddressBloc {
  StreamController<List<Data>> responseStream = StreamController<List<Data>>();

  List<Data>? listOfAddress;

  void callRequest() {
    GetClientAddressService().placeTypeService().then((value) {
      responseStream.sink.add(value.data!);
      listOfAddress = value.data!;
    });
  }

  void deleteRequest(int id) {
    DeleteClientAddressService().deleteClientAddress(id).then((value) {
      print(value.message);

      if (value.status!) {
        for (int i = 0; i < listOfAddress!.length; i++) {
          if (listOfAddress![i].addressId == id) {
            print("ra7aat => " + listOfAddress![i].posName!);
            listOfAddress!.removeAt(i);
          }
        }
        responseStream.sink.add(listOfAddress!);
      }
    });
  }
}
