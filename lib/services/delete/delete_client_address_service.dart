import 'package:orderera_dio_http/bloc/models/address/get_client_address_model.dart';
import 'package:orderera_dio_http/bloc/utils/repo/http_request.dart';

class DeleteClientAddressService {
  Future<GetClientAddressModel> deleteClientAddress(int id) async {
    final response = await HttpRequest().callRequest(
      requestType: REQUEST_TYPE.delete,
      methodName: "address/delete?address_id=$id",
      // queryParam: 
    );
    return GetClientAddressModel.fromJson(response);
  }
}
