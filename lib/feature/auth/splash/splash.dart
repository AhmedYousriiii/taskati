import 'package:flutter/material.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/feature/home/page/home.dart';

import 'package:taskati/feature/upload/upload_image.dart';
import 'package:taskati/core/function/Navigator.dart';

import 'package:taskati/core/utils/text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bool isUpload = AppLocalStorage.getcacheData(AppLocalStorage.isuploadkey) ?? false;
    Future.delayed(Duration(seconds: 3), () {
      if (isUpload) {
        pushReplace(context, HomeScreen());
      } else {
        pushReplace(context, UploadScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShBQHh8gMrQLuCYDl2UCToaXDbdxcT-Gp0KQ&s"),
            Text(
              "Taskati",
              style: getTitleTextStyle(),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "its Time to Get Organized",
              style: getsubTitleTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
