import 'package:flutter/material.dart';
import 'package:orderera_dio_http/bloc/models/get_client_address_model.dart';
import 'package:orderera_dio_http/ui/views/client/address/client_address_bloc.dart';

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
      body: SafeArea(
        child: StreamBuilder<GetClientAddressModel>(
          stream: _bloc.responseStream.stream,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 80,
                        child: ListView.builder(
                          // physics: const NeverScrollableScrollPhysics(),
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
                                  onPressed: () {},
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
                            onPressed: () {},
                            child: Text("add location".toUpperCase())),
                      )
                    ],
                  )
                : Container();
          },
        ),
      ),
    );
  }
}
