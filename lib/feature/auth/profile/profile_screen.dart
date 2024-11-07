import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/core/widget/button_custom.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? imagepath;
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GetColor.whitecolor,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: GetColor.primarycolor,
        ),
        actions: [
          Icon(
            Icons.light_mode,
            color: GetColor.primarycolor,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: GetColor.whitecolor, borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ButtonCustom(
                            text: "Upload from Camare",
                            onpress: () {
                              pickiamge(
                                iscamera: true,
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ButtonCustom(
                            text: "Upload from gen",
                            onpress: () {
                              pickiamge(
                                iscamera: false,
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: imagepath != null
                        ? FileImage(imagepath!)
                        : NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSeatcmYRYsMNho5mAp9qySUzghxQYU_TPGw&s",
                          ),
                  ),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(color: GetColor.whitecolor, shape: BoxShape.circle),
                        child: Icon(
                          Icons.camera_alt,
                          color: GetColor.primarycolor,
                        ),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Divider(
            color: GetColor.primarycolor,
            endIndent: 50,
            indent: 50,
            thickness: 1,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  name,
                  style: getprimaryTextStyle(),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.all(20),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: GetColor.whitecolor, borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.name,
                                onChanged: (value) {
                                  setState(() {
                                    name = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ButtonCustom(
                                text: "Upload Your Name",
                                onpress: () {
                                  AppLocalStorage.cacheData(AppLocalStorage.namekey, name);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.border_color,
                    color: GetColor.primarycolor,
                    size: 35,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> pickiamge({required bool iscamera}) async {
    await ImagePicker().pickImage(source: iscamera ? ImageSource.camera : ImageSource.gallery).then(
      (value) {
        if (value != null) {
          setState(() {
            imagepath = File(value.path);
            AppLocalStorage.cacheData(AppLocalStorage.imagekey, value.path);
          });
          Navigator.of(context).pop();
        }
      },
    );
  }
}
