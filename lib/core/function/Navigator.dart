import 'package:flutter/material.dart';

pushReplace(BuildContext context, Widget newScreen) {
  return Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => newScreen),
  );
}
pushto(BuildContext context, Widget newScreen) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => newScreen),
  );
}
