import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/function/Navigator.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/home/page/home.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  int selectindex = 0;
  var titlecontroll = TextEditingController();
  var notecontroll = TextEditingController();
  var datecontroll = TextEditingController(text: DateFormat("dd/mm/yyyy").format(DateTime.now()));
  var starttimecontroll = TextEditingController(text: DateFormat("hh: m a").format(DateTime.now()));
  var endtimecontroll = TextEditingController(text: DateFormat("hh:m a").format(DateTime.now()));
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Add Task",
          style: getprimaryTextStyle(fontsize: 22),
        ),
        leading: IconButton(
          onPressed: () {
            pushto(context, HomeScreen());
          },
          icon: Icon(Icons.arrow_back),
          color: GetColor.primarycolor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: getTitleTextStyle(fontsize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "plase enter some Title";
                    }
                  },
                  controller: titlecontroll,
                  onTap: () {},
                  decoration: InputDecoration(
                    hintText: "Enter title here",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Note",
                  style: getTitleTextStyle(fontsize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "plase enter some note";
                    }
                  },
                  controller: notecontroll,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Enter note here",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Date",
                  style: getTitleTextStyle(fontsize: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "plase enter  date";
                    }
                  },
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime(2001),
                      lastDate: DateTime(2050),
                    ).then(
                      (value) {
                        if (value != null) {
                          datecontroll.text = DateFormat("dd/MM/yyyy").format(value);
                        }
                      },
                    );
                  },
                  controller: datecontroll,
                  readOnly: true,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.date_range),
                    hintText: "10/20/2023",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Start Time",
                            style: getTitleTextStyle(fontsize: 18),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "plase enter start time";
                              }
                            },
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay(hour: 10, minute: 10),
                              ).then(
                                (value) {
                                  starttimecontroll.text = value?.format(context) ?? "";
                                },
                              );
                            },
                            controller: starttimecontroll,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.schedule),
                              hintText: "10/20/2023",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "End Time",
                            style: getTitleTextStyle(fontsize: 18),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: endtimecontroll,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "plase enter start time";
                              }
                            },
                            onTap: () {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay(hour: 10, minute: 10),
                              ).then(
                                (value) {
                                  if (value != null) {
                                    endtimecontroll.text = value.format(context);
                                  }
                                },
                              );
                            },
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.schedule),
                              hintText: "10:10",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "color",
                  style: getTitleTextStyle(fontsize: 18),
                ),
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List<Widget>.generate(
                        3,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectindex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: index == 0
                                    ? GetColor.benkcolor
                                    : index == 1
                                        ? GetColor.orangecolor
                                        : GetColor.primarycolor,
                                child: selectindex == index
                                    ? Icon(
                                        Icons.check,
                                        color: GetColor.whitecolor,
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 60,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: GetColor.primarycolor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            pushReplace(context, HomeScreen());
                          }
                        },
                        child: Text(
                          " Create Task",
                          style: gettextbutton(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
