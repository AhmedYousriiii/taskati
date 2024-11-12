import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/function/Navigator.dart';
import 'package:taskati/core/function/showerrodialog.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widget/button_custom.dart';
import 'package:taskati/feature/home/page/home.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? imageFile;
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: () async {
                if (imageFile == null && name.isEmpty) {
                  showErroDialog(context: context, massage: "please upload your image and name");
                } else if (imageFile == null && name.isNotEmpty) {
                  showErroDialog(context: context, massage: "please upload your image");
                } else if (imageFile != null && name.isEmpty) {
                  showErroDialog(context: context, massage: "please chick your name");
                } else {
                  AppLocalStorage.cacheData(AppLocalStorage.namekey, name);
                  AppLocalStorage.cacheData(AppLocalStorage.imagekey, imageFile!.path);
                  AppLocalStorage.cacheData(AppLocalStorage.isuploadkey, true);
                  pushReplace(context, HomeScreen());
                }
              },
              child: Text(
                "Done",
                style: getTitleTextStyle(
                  color: GetColor.primarycolor,
                ),
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                foregroundImage: imageFile != null
                    ? FileImage(imageFile!)
                    : NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSeatcmYRYsMNho5mAp9qySUzghxQYU_TPGw&s",
                      ),
              ),
              SizedBox(
                height: 15,
              ),
              ButtonCustom(
                text: "Upload from Camare",
                onpress: () async {
                  await pickImage(iscamera: true);
                },
              ),
              SizedBox(
                height: 15,
              ),
              ButtonCustom(
                text: "Upload from Gallery",
                onpress: () async {
                  await pickImage(iscamera: false);
                },
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.black,
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                onChanged: (value) {
                  name = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage({required bool iscamera}) async {
    final pickedFile = await ImagePicker().pickImage(
      source: iscamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
