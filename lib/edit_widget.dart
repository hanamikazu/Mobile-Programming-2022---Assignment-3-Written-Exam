import 'package:assignment3_trial/task_model.dart';
import 'package:flutter/material.dart';

class EditWidget extends StatelessWidget {
  final Task task;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const EditWidget({Key? key, required this.task, required this.onTap, required this.onLongPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6),
        child: Card(
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.teal),
            borderRadius: BorderRadius.all(Radius.circular(20))),
          color: Colors.teal,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(task.title, style: const TextStyle(fontSize: 22, color: Colors.white),),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12)
                ),
                Text(task.details, style: const TextStyle(fontSize: 18, color: Colors.white),),
              ],
            ),
          ),
        ),
      )
    );
  }
}
