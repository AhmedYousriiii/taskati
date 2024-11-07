
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/function/Navigator.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/auth/profile/profile_screen.dart';

class customHeader extends StatelessWidget {
  const customHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final imagePath = AppLocalStorage.getcacheData(AppLocalStorage.imagekey);
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello , ${AppLocalStorage.getcacheData(AppLocalStorage.namekey)}",
              style: getprimaryTextStyle(),
            ),
            Text(
              "Have A Nice Day.",
              style: getsubTitleTextStyle(fontsize: 18),
            ),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            pushto(context, ProfileScreen());
          },
          child: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.red,
            backgroundImage: imagePath != null ? FileImage(File(imagePath)) : null,
          ),
        ),
      ],
    );
  }
}
