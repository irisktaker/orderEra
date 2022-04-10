import 'package:orderera_dio_http/bloc/utils/repo/http_request.dart';
import 'package:orderera_dio_http/bloc/models/address/get_client_address_model.dart';

class GetClientAddressService {
  Future<GetClientAddressModel> placeTypeService() async {
    final response = await HttpRequest().callRequest(
      requestType: REQUEST_TYPE.get,
      methodName: "address?ignore_cache=1",
    );
    return GetClientAddressModel.fromJson(response);
  }
}
