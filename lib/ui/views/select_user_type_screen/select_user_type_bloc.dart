import 'dart:async';

import 'package:orderera_dio_http/bloc/models/get_place_type_response_model.dart';
import 'package:orderera_dio_http/bloc/models/set_place_type_response_model.dart';
import 'package:orderera_dio_http/services/get/place_type_service/place_type_service.dart';
import 'package:orderera_dio_http/services/set_place_type_service/set_place_type_service.dart';

class SelectUserTypeBloc {
  StreamController<GetPlaceTypeResponseModel> responseStream =
      StreamController<GetPlaceTypeResponseModel>();
  // StreamController<bool> navigatorScreenStream = StreamController<bool>();

  void callRequest() {
    PlaceTypeService().placeTypeService().then((value) {
      responseStream.sink.add(value);
    });
  }

  Future<SetPlaceTypeResponseModel> setPlaceTypeServiceIdRequest(
      int placeTypeID) async {
    return await SetPlaceTypeService().setPlaceTypeService(placeTypeID);
  }
}
