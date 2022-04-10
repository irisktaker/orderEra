import 'package:orderera_dio_http/bloc/utils/repo/http_request.dart';
import 'package:orderera_dio_http/bloc/models/welcome/welcome_response_model.dart';

class WelcomeService {
  Future<WelcomeResponseModel> welcomeService() async {
    final response = await HttpRequest().callRequest(
      requestType: REQUEST_TYPE.get,
      methodName: "welcome?ignore_cache=1",
    );
    return WelcomeResponseModel.fromJson(response);
  }
}
