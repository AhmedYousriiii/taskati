import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskati/core/utils/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box("uesr");

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              box.get("name") ?? "",
              style: getTitleTextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
