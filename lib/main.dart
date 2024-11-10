import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/model/model_task.dart';

import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/color.dart';

import 'package:taskati/feature/auth/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("user");
  Hive.registerAdapter(ModelTaskAdapter());
  await Hive.openBox<ModelTask>("task");
  await AppLocalStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: GetColor.primarycolor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: GetColor.primarycolor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: GetColor.redcolor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: GetColor.redcolor,
          ),
        ),
      )),
      home: SplashScreen(),
    );
  }
}
