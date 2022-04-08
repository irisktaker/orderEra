import 'package:orderera_dio_http/bloc/utils/repo/http_request.dart';
import 'package:orderera_dio_http/bloc/models/place_type_response_model.dart';

class PlaceTypeService {
  Future<PlaceTypeResponseModel> placeTypeService() async {
    final response = await HttpRequest().callRequest(
      requestType: REQUEST_TYPE.get,
      methodName: "user/place-type",
    );
    return PlaceTypeResponseModel.fromJson(response);
  }
}
