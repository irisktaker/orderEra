import 'package:orderera_dio_http/bloc/utils/repo/http_request.dart';
import 'package:orderera_dio_http/bloc/models/place_type/set_place_type_response_model.dart';

class SetPlaceTypeService {
  Future<SetPlaceTypeResponseModel> setPlaceTypeService(int placeTypeID) async {
    final response = await HttpRequest().callRequest(
      requestType: REQUEST_TYPE.post,
      methodName: "user/set-place-type",
      body: {
        "place_type": placeTypeID,
      },
    );
    print("Set Place Type Service: $response");
    return SetPlaceTypeResponseModel.fromJson(response);
  }
}
