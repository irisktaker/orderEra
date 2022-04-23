import 'package:orderera_dio_http/bloc/utils/repo/http_request.dart';
import 'package:orderera_dio_http/bloc/models/address/get_client_address_model.dart';

class SetClientAddressService {
  Future<GetClientAddressModel> addNewClientAddress(
      {required Map<String, dynamic> body}) async {
    final response = await HttpRequest().callRequest(
      requestType: REQUEST_TYPE.post,
      methodName: "address",
      body: body,
    );
    print("Add New Client Address: $response");
    return GetClientAddressModel.fromJson(response);
  }
}
