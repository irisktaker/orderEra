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

  String? city, region, type, pos, latitude, longitude;

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
                  _buildTextField(
                      controller: _bloc.cityController,
                      title: "City",
                      widget: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_drop_down))),
                  _buildTextField(
                    controller: _bloc.regionController,
                    title: "Region",
                  ),
                  _buildTextField(
                    controller: _bloc.typeController,
                    title: "Type",
                  ),
                  _buildTextField(
                    controller: _bloc.posController,
                    title: "Point of Sale Name",
                  ),
                  _buildTextField(
                    controller: _bloc.latitudeController,
                    title: "Latitudee",
                  ),
                  _buildTextField(
                    controller: _bloc.longitudeController,
                    title: "Longitude",
                  ),
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
                  _bloc
                      .createNewClientAddress(
                    // TODO:
                    latitude: _bloc.latitudeController.text,
                    longitude: _bloc.longitudeController.text,
                    posName: _bloc.posController.text,
                    cityID: int.parse(_bloc.cityController.text),
                    regionId: int.parse(_bloc.regionController.text),
                    type: int.parse(_bloc.typeController.text),
                  )
                      .then((value) {
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

  _buildTextField({
    required String title,
    required TextEditingController? controller,
    void Function(String)? onChanged,
    Widget? widget,
  }) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              readOnly: widget == null ? false : true,
              decoration: InputDecoration(
                labelText: title,
                labelStyle: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        widget == null ? Container() : Container(child: widget),
      ],
    );
  }
}
