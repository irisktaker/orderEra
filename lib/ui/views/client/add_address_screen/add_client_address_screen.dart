import 'package:flutter/material.dart';
import 'package:orderera_dio_http/ui/views/client/add_address_screen/add_client_address_bloc.dart';
import 'package:orderera_dio_http/ui/widgets/show_alert_dialog.dart';

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
            child: Form(
              child: ListView(
                children: [
                  buildTextField(title: "Location Type"),
                  buildTextField(title: "City"),
                  buildTextField(title: "Region"),
                  buildTextField(title: "Street"),
                  buildTextField(title: "Point of Sale Name"),
                  buildTextField(title: "#Building"),
                  buildTextField(title: "#Floor"),
                  buildTextField(title: "Identity"),
                  buildTextField(title: "Select on Map"),
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
                  _bloc.createNewClientAddress().then((value) {
                    if (value.status!) {
                      Navigator.pop(context);
                    } else {
                      showAlertDialog(
                        context,
                        content: Text(value.message!),
                        firstButton: () => Navigator.pop(context),
                        secondButton: () {},
                      );
                    }
                  });
                },
                child: Text("add".toUpperCase())),
          ),
        ],
      ),
    );
  }

  Padding buildTextField({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: TextField(
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
