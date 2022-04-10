import 'package:flutter/material.dart';
import 'package:orderera_dio_http/bloc/models/address/get_client_address_model.dart';
import 'package:orderera_dio_http/ui/views/client/addresses_screen/client_address_bloc.dart';
import 'package:orderera_dio_http/ui/views/client/add_address_screen/add_client_address_screen.dart';

class ClientAddressScreen extends StatefulWidget {
  const ClientAddressScreen({Key? key}) : super(key: key);

  @override
  State<ClientAddressScreen> createState() => _ClientAddressScreenState();
}

class _ClientAddressScreenState extends State<ClientAddressScreen> {
  final ClientAddressBloc _bloc = ClientAddressBloc();

  @override
  void initState() {
    super.initState();
    _bloc.callRequest();
  }

  showAlertDialog(BuildContext context, int id) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        _bloc.deleteRequest(id);
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Delete"),
      actions: [
        okButton,
      ],
    );
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(
          "OrderEra",
          style: TextStyle(
            fontSize: 32,
            color: Colors.blue[900],
          ),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<GetClientAddressModel>(
          stream: _bloc.responseStream.stream,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 160,
                        child: ListView.builder(
                          itemCount: snapshot.data!.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 80,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[100]!),
                              ),
                              child: ListTile(
                                leading: const Icon(
                                  Icons.location_on_outlined,
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.more_horiz),
                                  onPressed: () {
                                    // setState(() {});
                                    showAlertDialog(context,
                                        snapshot.data!.data![index].addressId!);
                                  },
                                ),
                                title:
                                    Text(snapshot.data!.data![index].posName!),
                                subtitle: Text(
                                    "${snapshot.data!.data![index].addressId!}, "
                                    "${snapshot.data!.data![index].cityId} | "
                                    "${snapshot.data!.data![index].regionId}, "
                                    "${snapshot.data!.data![index].locationPhoneNumber}"),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AddClientAddressScreen(
                                            // index: index,
                                            ),
                                  ));
                            },
                            child: Text("add location".toUpperCase())),
                      ),
                    ],
                  )
                : Container();
          },
        ),
      ),
    );
  }
}
