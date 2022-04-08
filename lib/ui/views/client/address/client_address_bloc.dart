
import 'dart:async';

import 'package:orderera_dio_http/bloc/models/get_client_address_model.dart';
import 'package:orderera_dio_http/bloc/models/set_client_address_model.dart';
import 'package:orderera_dio_http/services/get/get_client_address_service/get_client_address_service.dart';
import 'package:orderera_dio_http/services/post/set_client_address_service/set_client_address_service.dart';

class ClientAddressBloc {
  StreamController<GetClientAddressModel> responseStream =
      StreamController<GetClientAddressModel>();

  void callRequest(){
    GetClientAddressService().placeTypeService().then((value) {
      responseStream.sink.add(value);
    });
  }

  Future<SetClientAddressModel> setClientAddressModel() async {
    return await SetClientAddressService().setClientAddress();
  }
}