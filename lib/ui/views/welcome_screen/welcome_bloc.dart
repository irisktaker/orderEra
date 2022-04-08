import 'dart:async';

import 'package:orderera_dio_http/bloc/models/welcome_response_model.dart';
import 'package:orderera_dio_http/services/get/welcome_service/welcome_service.dart';

class WelcomeBloc {
  WelcomeResponseModel? responseOfWelcomeRequest;
  StreamController<bool> isLoadingStream = StreamController<bool>();

  void callRequest() async {
    isLoadingStream.sink.add(true);
    await WelcomeService().welcomeService().then((value) {
      responseOfWelcomeRequest = value;
      isLoadingStream.sink.add(false);
    });

    print(responseOfWelcomeRequest!.message);
  }
}
