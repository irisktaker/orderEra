import 'package:orderera_dio_http/bloc/utils/repo/http_request.dart';
import 'package:orderera_dio_http/bloc/models/place_type/get_place_type_response_model.dart';

class PlaceTypeService {
  Future<GetPlaceTypeResponseModel> placeTypeService() async {
    final response = await HttpRequest().callRequest(
      requestType: REQUEST_TYPE.get,
      methodName: "user/place-type",
    );
    print("Place Type Service: $response");
    return GetPlaceTypeResponseModel.fromJson(response);
  }
}
