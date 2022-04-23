import 'package:dio/dio.dart';
import 'package:orderera_dio_http/bloc/utils/singleton/singleton.dart';

enum REQUEST_TYPE { get, post, delete }

// class Model {
//   Map<String, dynamic> toJson = {};
//   Model();
// }

class HttpRequest {
  ///.. Create a method to handle all request types
  ///.. In our app get, post, delete
  Future<dynamic> callRequest({
    required REQUEST_TYPE requestType,
    required String methodName,
    Map<String, dynamic> queryParam = const {},
    Map<String, dynamic>? body,
    String contentType = Headers.jsonContentType,
  }) async {
    Response? response;
    const String baseURL = "http://api.stag.orderera.com/pos/api/v6/";

    final Dio dioClient = Dio()
      ..options = BaseOptions(
          baseUrl: baseURL,
          headers: {
            // how we decided which we need from the header and how we get the api key?
            "apiKey":
                "4dd28d4d22fbebd8082324a0bd1148475f02c8ffb894e002a979c8c7",
            "device-id": 791994,
            "device-type": "ios",
            "Accept-Language": Singleton.instance.selectedLanguage,
          },
          followRedirects: false,
          validateStatus: (int? status) {
            return true;
          });

    switch (requestType) {
      case REQUEST_TYPE.get:
        response = await dioClient.get(
          methodName,
          queryParameters: queryParam,
          options: Options(
            contentType: contentType,
          ),
        );
        break;
      case REQUEST_TYPE.post:
        response = await dioClient.post(
          methodName,
          data: body,
          queryParameters: queryParam,
          options: Options(
            contentType: contentType,
          ),
        );
        break;
      case REQUEST_TYPE.delete:
        response = await dioClient.delete(
          methodName,
          data: body,
          queryParameters: queryParam,
          options: Options(
            contentType: contentType,
          ),
        );
        break;
    }

    return response.data;
  }
}
