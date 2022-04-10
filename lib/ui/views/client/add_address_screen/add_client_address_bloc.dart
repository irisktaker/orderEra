import 'package:orderera_dio_http/services/post/set_client_address_service.dart';
import 'package:orderera_dio_http/bloc/models/address/get_client_address_model.dart';

class AddClientAddressBloc {
  Future<GetClientAddressModel> createNewClientAddress() async {
    return await SetClientAddressService().addNewClientAddress(
      body: {
        "location_phone_number": "0780987654",
        "latitude": "35.9876676534",
        "longitude": "32.0985887653",
        "city_id": 1,
        "region_id": 17,
        "type": 28,
        "street": "heba",
        // "licence_image" : ,
        // "pos_image" : ,
        "pos_name": "Naser",
        "building": 2,
        "floor": 4,
        "apartment_number": 13,
        // "qr_hash": null,
      },
    );
  }
}
