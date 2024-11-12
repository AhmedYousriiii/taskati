import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/function/Navigator.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';
import 'package:taskati/feature/add_task/add_task.dart';

class todayyHeader extends StatelessWidget {
  const todayyHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMd().format(DateTime.now()),
              style: getsubTitleTextStyle(fontsize: 18),
            ),
            Text(
              "Today",
              style: getsubTitleTextStyle(fontsize: 18),
            ),
          ],
        ),
        Spacer(),
        SizedBox(
          height: 60,
          width: 140,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: GetColor.primarycolor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              pushto(context, AddTask());
            },
            child: Text(
              "+ Add Task",
              style: gettextbutton(),
            ),
          ),
        ),
      ],
    );
  }
}
