import 'package:flutter/material.dart';
import 'package:orderera_dio_http/ui/views/client/add_address_screen/add_client_address_bloc.dart';

class AddClientAddressScreen extends StatefulWidget {
  AddClientAddressScreen({Key? key}) : super(key: key);

  // int index;

  @override
  State<AddClientAddressScreen> createState() => _AddClientAddressScreenState();
}

class _AddClientAddressScreenState extends State<AddClientAddressScreen> {
  final AddClientAddressBloc _bloc = AddClientAddressBloc();

  String? location, city, region, street, pos, building, floor, identity, map;

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
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Cancel",
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 160,
            child: Form(
              child: ListView(
                children: [
                  buildTextField(
                      controller: _bloc.locationFieldTypeController,
                      title: "Location Type",
                      onChanged: (value) {
                        location = value;
                      }),
                  buildTextField(
                      controller: _bloc.cityFieldController,
                      title: "City",
                      onChanged: (value) {
                        city = value;
                      }),
                  buildTextField(
                      controller: _bloc.regionFieldController,
                      title: "Region",
                      onChanged: (value) {
                        region = value;
                      }),
                  buildTextField(
                      controller: _bloc.streetFieldController,
                      title: "Street",
                      onChanged: (value) {
                        street = value;
                      }),
                  buildTextField(
                      controller: _bloc.nPOSFieldController,
                      title: "Point of Sale Name",
                      onChanged: (value) {
                        pos = value;
                      }),
                  buildTextField(
                      controller: _bloc.buildingFieldController,
                      title: "#Building",
                      onChanged: (value) {
                        building = value;
                      }),
                  buildTextField(
                      controller: _bloc.floorFieldController,
                      title: "#Floor",
                      onChanged: (value) {
                        floor = value;
                      }),
                  buildTextField(
                      controller: _bloc.identityFieldController,
                      title: "Identity",
                      onChanged: (value) {
                        identity = value;
                      }),
                  buildTextField(
                      controller: _bloc.selectOnMapFieldController,
                      title: "Select on Map",
                      onChanged: (value) {
                        map = value;
                      }),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                onPressed: () {
                  // Stream.value(_bloc.addAddressRequest());
                  _bloc.addAddressRequest();
                  Navigator.pop(context);
                },
                child: Text("add".toUpperCase())),
          ),
        ],
      ),
    );
  }

  Padding buildTextField({
    required String title,
    required TextEditingController? controller,
    required void Function(String)? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
