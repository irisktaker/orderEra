import 'package:orderera_dio_http/bloc/utils/repo/http_request.dart';
import 'package:orderera_dio_http/bloc/models/address/get_client_address_model.dart';
import 'package:orderera_dio_http/bloc/models/address/set_client_address_model.dart';

class SetClientAddressService {
  // SetClientAddressModel
  //
  Future<GetClientAddressModel> setClientAddress({
    required GetClientAddressModel clientAddress,
  }) async {
    GetClientAddressModel? clientAddress;
    final response = await HttpRequest().callRequest(
      requestType: REQUEST_TYPE.post,
      methodName: "address",
      body: clientAddress!.toJson(),
    );

    return GetClientAddressModel.fromJson(response);
  }
}
