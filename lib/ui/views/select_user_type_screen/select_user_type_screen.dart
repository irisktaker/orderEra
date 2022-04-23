import 'package:flutter/material.dart';
import 'package:orderera_dio_http/bloc/models/place_type/get_place_type_response_model.dart';
import 'package:orderera_dio_http/ui/views/client/addresses_screen/client_address_screen.dart';
import 'package:orderera_dio_http/ui/views/select_user_type_screen/select_user_type_bloc.dart';

class SelectUserTypeScreen extends StatefulWidget {
  const SelectUserTypeScreen({Key? key}) : super(key: key);

  @override
  State<SelectUserTypeScreen> createState() => _SelectUserTypeScreenState();
}

class _SelectUserTypeScreenState extends State<SelectUserTypeScreen> {
  final SelectUserTypeBloc _bloc = SelectUserTypeBloc();

  @override
  void initState() {
    super.initState();
    _bloc.callRequest();
  }

  showAlertDialog(BuildContext context) {
    Widget okDialog = TextButton(onPressed: () {}, child: const Text("Ok"));
    // set up the alert dialog
    AlertDialog alert = AlertDialog(
      title: const Text("Error"),
      content: const Text("You missed the address ID"),
      actions: [
        okDialog,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<GetPlaceTypeResponseModel>(
        stream: _bloc.responseStream.stream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    return MaterialButton(
                      onPressed: () async {
                        _bloc
                            .setPlaceTypeServiceIdRequest(
                                snapshot.data!.data![index].id!)
                            .then((value) {
                          if (value.status!) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    // builder: (context) => const HomeScreen()));
                                    builder: (context) =>
                                        const ClientAddressScreen()));
                          } else {
                            // show err dialog
                            showAlertDialog(context);
                          }
                        });
                      },
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.network(
                            snapshot.data!.data![index].icon!,
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(width: 16),
                          Text(snapshot.data!.data![index].name!),
                        ],
                      ),
                    );
                  })
              : Container();
        },
      ),
    );
  }
}
