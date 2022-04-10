// import 'package:orderera_dio_http/bloc/models/address/get_client_address_model.dart';

// class SetClientAddressModel {
//   bool? status;
//   List<Data>? data;
//   String? message;
//   String? requestId;

//   SetClientAddressModel({this.status, this.data, this.message, this.requestId});

//   SetClientAddressModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(Data.fromJson(v));
//       });
//     }
//     message = json['message'];
//     requestId = json['request_id'];
//   }
  
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['message'] = message;
//     data['request_id'] = requestId;
//     return data;
//   }

// }
