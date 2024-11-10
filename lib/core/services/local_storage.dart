import 'package:hive/hive.dart';
import 'package:taskati/core/model/model_task.dart';

class AppLocalStorage {
  static late Box userbox;
  static late Box<ModelTask> taskbox;
  static String namekey = "name";
  static String imagekey = "image";
  static String isuploadkey = "isuploaded";
  static init() async {
    userbox = Hive.box("user");
    taskbox = Hive.box<ModelTask>("task");
  }

  static cacheData(String key, dynamic value) {
    userbox.put(key, value);
  }

  static getcacheData(dynamic key) {
    return userbox.get(key);
  }

  static cachetaskdata(String key, ModelTask value) {
    taskbox.put(key, value);
  }

  static ModelTask? getcachetaskdata(String key) {
    return taskbox.get(key);
  }
}
