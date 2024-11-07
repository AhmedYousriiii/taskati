import 'package:hive/hive.dart';

class AppLocalStorage {
  static late Box userbox;
  static String namekey = "name";
  static String imagekey = "image";
  static String isuploadkey = "isuploaded";
  static init() {
    userbox = Hive.box("user");
  }

  static cacheData(String key, dynamic value) {
    userbox.put(key, value);
  }

  static getcacheData(dynamic key) {
    return userbox.get(key);
  }
}
