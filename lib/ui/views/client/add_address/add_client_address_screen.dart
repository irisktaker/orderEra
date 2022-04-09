import 'package:flutter/material.dart';
import 'package:orderera_dio_http/ui/views/client/add_address/add_client_address_bloc.dart';

class AddClientAddressScreen extends StatefulWidget {
  const AddClientAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddClientAddressScreen> createState() => _AddClientAddressScreenState();
}

class _AddClientAddressScreenState extends State<AddClientAddressScreen> {
  final AddClientAddressBloc _bloc = AddClientAddressBloc();

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
            child: ListView(
              children: [
                buildTextField(
                  controller: _bloc.locationFieldTypeController,
                  title: "Location Type",
                ),
                buildTextField(
                  controller: _bloc.cityFieldController,
                  title: "City",
                ),
                buildTextField(
                  controller: _bloc.regionFieldController,
                  title: "Region",
                ),
                buildTextField(
                  controller: _bloc.streetFieldController,
                  title: "Street",
                ),
                buildTextField(
                  controller: _bloc.nPOSFieldController,
                  title: "Point of Sale Name",
                ),
                buildTextField(
                  controller: _bloc.buildingFieldController,
                  title: "#Building",
                ),
                buildTextField(
                  controller: _bloc.floorFieldController,
                  title: "#Floor",
                ),
                buildTextField(
                  controller: _bloc.identityFieldController,
                  title: "Identity",
                ),
                buildTextField(
                  controller: _bloc.selectOnMapFieldController,
                  title: "Select on Map",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                onPressed: () {},
                child: Text("add".toUpperCase())),
          ),
        ],
      ),
    );
  }

  Padding buildTextField({
    required String title,
    required TextEditingController? controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: TextField(
        
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
