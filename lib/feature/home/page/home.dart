import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
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
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
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
                              if(direction == DismissDirection.startToEnd){

                              }else{
                                
                              }
                            },
                            child: taskitem());
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: 10,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
