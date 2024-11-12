import 'package:flutter/material.dart';
import 'package:taskati/core/model/model_task.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/core/utils/text_style.dart';

class taskitem extends StatelessWidget {
  const taskitem({
    super.key,
    required this.modelTask,
  });
  final ModelTask modelTask;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            color: modelTask.color == 3
                ? Colors.green
                : modelTask.color == 0
                    ? GetColor.benkcolor
                    : modelTask.color == 1
                        ? GetColor.orangecolor
                        : GetColor.primarycolor),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    modelTask.title,
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
                      Expanded(
                        child: Text(
                          "${modelTask.starttime} - ${modelTask.endtime}",
                          style: gettextbutton(fontsize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    modelTask.note,
                    style: gettextbutton(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
