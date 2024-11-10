import 'package:hive_flutter/hive_flutter.dart';
part 'model_task.g.dart';

@HiveType(typeId: 3)
class ModelTask {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String note;
  @HiveField(2)
  final String title;
   @HiveField(3)
  final String starttime;
   @HiveField(4)
  final String endtime;
   @HiveField(5)
  final String date;
   @HiveField(6)
  final int color;
   @HiveField(7)
  final bool iscompleted;
  ModelTask({
    required this.id,
    required this.note,
    required this.title,
    required this.starttime,
    required this.endtime,
    required this.date,
    required this.color,
    required this.iscompleted,
  });
}
