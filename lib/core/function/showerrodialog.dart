import 'package:flutter/material.dart';

void showErroDialog({required BuildContext context,required String massage}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(massage),
  ));
}
