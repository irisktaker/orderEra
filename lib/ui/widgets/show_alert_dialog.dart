import 'package:flutter/material.dart';

showAlertDialog(
  BuildContext context, {
  required Widget content,
  required VoidCallback firstButton,
  required VoidCallback secondButton,
}) {
  Widget cancelButton = TextButton(
    child: const Text("cancel"),
    onPressed: firstButton,
  );
  Widget continueButton = TextButton(
    onPressed: secondButton,
    child: const Text(
      "Delete",
      style: TextStyle(
        color: Colors.red,
      ),
    ),
  );
  AlertDialog alert = AlertDialog(
    title: const Text("Alert Dialog"),
    content: content,
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
