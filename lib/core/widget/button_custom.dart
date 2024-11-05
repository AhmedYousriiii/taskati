import 'package:flutter/material.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';

class ButtonCustom extends StatefulWidget {
  const ButtonCustom({
    super.key,
    required this.text,
    this.onpress,
  });

  final String text;
  final Function()? onpress;

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 58,
        width: 350,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: GetColor.primarycolor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: widget.onpress,
          child: Text(
            widget.text,
            style: gettextbutton(),
          ),
        ));
  }
}
