import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/function/Navigator.dart';
import 'package:taskati/core/function/showerrodialog.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widget/button_custom.dart';
import 'package:taskati/feature/home/home.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? path;
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
                if (path == null && name.isEmpty) {
                  showErroDialog(context: context, massage: "upload your image and name");
                } else if (path == null && name.isNotEmpty) {
                  showErroDialog(context: context, massage: "upload your image");
                } else if (path != null && name.isEmpty) {
                  showErroDialog(context: context, massage: "chick your name");
                } else {
                  var box = Hive.box("uesr");
                  await box.put("name", name);
                  print(box.put("name", name));
                  pushReplace(context, HomeScreen());
                }
              },
              child: Text(
                "Done",
                style: getTitleTextStyle(color: GetColor.primarycolor),
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
                foregroundImage: path != null
                    ? AssetImage(path!)
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
                  await pickimage(iscamare: true);
                },
              ),
              SizedBox(
                height: 15,
              ),
              ButtonCustom(
                text: "Upload from Gallery",
                onpress: () async {
                  await pickimage(iscamare: false);
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
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: GetColor.primarycolor),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                      10,
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  pickimage({required bool iscamare}) async {
    await ImagePicker()
        .pickImage(
      source: iscamare ? ImageSource.camera : ImageSource.gallery,
    )
        .then((value) {
      if (value != null) {
        setState(() {
          path = value.path;
        });
      }
    });
  }
}
