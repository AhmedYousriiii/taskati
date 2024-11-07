import 'package:flutter/material.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';

class taskitem extends StatelessWidget {
  const taskitem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            color: GetColor.primarycolor),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Flutter Task-1",
                    style: gettextbutton(fontsize: 22),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: GetColor.whitecolor,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "2:55AM - 2:40AM",
                        style: gettextbutton(fontsize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "I will do This Task",
                    style: gettextbutton(),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 70,
              width: 1,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
