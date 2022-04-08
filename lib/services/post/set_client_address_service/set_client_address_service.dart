import 'package:orderera_dio_http/bloc/utils/repo/http_request.dart';
import 'package:orderera_dio_http/bloc/models/set_client_address_model.dart';

class ClientAddressService {
  Future<SetClientAddressModel> setClientAddress() async {
    final response = await HttpRequest().callRequest(
      requestType: REQUEST_TYPE.post,
      methodName: "address",
      body: {},
    );

    return SetClientAddressModel.fromJson(response);
  }
}
