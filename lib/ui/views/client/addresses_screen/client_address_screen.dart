import 'package:flutter/material.dart';
import 'package:orderera_dio_http/bloc/models/address/get_client_address_model.dart';
import 'package:orderera_dio_http/ui/views/client/addresses_screen/client_address_bloc.dart';
import 'package:orderera_dio_http/ui/views/client/add_address_screen/add_client_address_screen.dart';
import 'package:orderera_dio_http/ui/widgets/show_alert_dialog.dart';

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
        child: StreamBuilder<List<Data>>(
          stream: _bloc.responseStream.stream,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 160,
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
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
                                    showAlertDialog(context,
                                        content: const Text(
                                            "Do you want to delete address?"),
                                        firstButton: () =>
                                            Navigator.pop(context),
                                        secondButton: () {
                                          _bloc.deleteRequest(
                                              snapshot.data![index].addressId!);
                                          _bloc.callRequest();
                                          Navigator.pop(context);
                                        });
                                  },
                                ),
                                title: Text(snapshot.data![index].posName!),
                                subtitle: Text(
                                    "${snapshot.data![index].addressId!}, "
                                    "${snapshot.data![index].cityId} | "
                                    "${snapshot.data![index].regionId}, "
                                    "${snapshot.data![index].locationPhoneNumber}"),
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
                                        const AddClientAddressScreen(),
                                  )).then((value) {
                                _bloc.callRequest();
                              });
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
