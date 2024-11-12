import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/model/model_task.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';

import 'package:taskati/feature/home/widget/taskitem.dart';

import 'package:taskati/feature/home/widget/todayy_header.dart';

import 'package:taskati/feature/home/widget/custom_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectdate = DateFormat("dd/MM/yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              customHeader(),
              SizedBox(
                height: 30,
              ),
              todayyHeader(),
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DatePicker(
                    height: 100,
                    width: 100,
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: GetColor.primarycolor,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      setState(() {
                        selectdate = DateFormat("dd/MM/yyyy").format(date);
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ValueListenableBuilder(
                    valueListenable: AppLocalStorage.taskbox.listenable(),
                    builder: (context, box, child) {
                      List<ModelTask> tasks = [];
                      box.values.forEach(
                        (element) {
                          if (element.date == selectdate) {
                            tasks.add(element);
                          }
                        },
                      );
                      if (tasks.isEmpty) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              "https://th.bing.com/th/id/R.277a2c1aae995a6401073e4188fb2b1a?rik=owpSjcxgzOdE9A&pid=ImgRaw&r=0",
                              height: 200,
                              width: 200,
                            ),
                            Text(
                              "No tasks ${selectdate}",
                              style: getprimaryTextStyle(fontsize: 15),
                            ),
                          ],
                        );
                      }
                      return SizedBox(
                        height: 370,
                        width: double.infinity,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Dismissible(
                                key: UniqueKey(),
                                secondaryBackground: Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: GetColor.benkcolor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "delete",
                                        style: gettextbutton(),
                                      ),
                                      Icon(
                                        Icons.delete,
                                        color: GetColor.whitecolor,
                                      )
                                    ],
                                  ),
                                ),
                                background: Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.check,
                                        color: GetColor.whitecolor,
                                      ),
                                      Text(
                                        "comlpete",
                                        style: gettextbutton(),
                                      ),
                                    ],
                                  ),
                                ),
                                onDismissed: (direction) {
                                  if (direction == DismissDirection.startToEnd) {
                                    box.put(
                                        tasks[index].id,
                                        ModelTask(
                                            id: tasks[index].id,
                                            note: tasks[index].note,
                                            title: tasks[index].title,
                                            starttime: tasks[index].starttime,
                                            endtime: tasks[index].endtime,
                                            date: tasks[index].date,
                                            color: 3,
                                            iscompleted: true));
                                  } else {
                                    box.delete(tasks[index].id);
                                  }
                                },
                                child: taskitem(
                                  modelTask: tasks[index],
                                ));
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: tasks.length,
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
