import 'package:assignment3_trial/database_helper.dart';
import 'package:assignment3_trial/task_model.dart';
import 'package:flutter/material.dart';

class Forms extends StatelessWidget {
  final Task? task;
  const Forms({Key? key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final detailsController = TextEditingController();

    if(task != null){
      titleController.text = task!.title;
      detailsController.text = task!.details;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(task == null ? 'Add Task' : 'Update Task',
          style: const TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  labelText: 'Title',
                  labelStyle: TextStyle(fontSize: 22, color: Colors.white)
                ),
              ),
              TextFormField(
                controller: detailsController,
                decoration: const InputDecoration(
                  hintText: 'Details',
                  labelText: 'Details',
                  labelStyle: TextStyle(fontSize: 22, color: Colors.white)
                ),
                keyboardType: TextInputType.multiline,
                onChanged: (str){},
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () async {
                    final title = titleController.value.text;
                    final details = detailsController.value.text;

                    if (title.isEmpty || details.isEmpty){
                      return;
                    }

                    final Task youi = Task(title: title, details: details, id: task?.id);
                    if(task == null){
                      await DatabaseHelper.addTask(youi);
                    } else {
                      await DatabaseHelper.updateTask(youi);
                    }

                    Navigator.pop(context);
                  },
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          side: BorderSide( color: Colors.teal, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    ),

                  ),
                  child: Text(task == null ? 'Save Task': 'Edit Task',
                    style: const TextStyle(color: Colors.black)),
                ),
              )
            ],
          ),
        ),
      backgroundColor: Colors.grey,
      );
  }
}
