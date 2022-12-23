import 'package:assignment3_trial/database_helper.dart';
import 'package:assignment3_trial/edit_widget.dart';
import 'package:assignment3_trial/forms.dart';
import 'package:assignment3_trial/task_model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Task List', style: TextStyle(color: Colors.white),),
        leading: const Icon(Icons.task_rounded, size: 40, color: Colors.white)
      ),

      body: FutureBuilder<List<Task>?>(
            future: DatabaseHelper.getAllTask(),
            builder: (context, AsyncSnapshot<List<Task>?> snapshot){
              if (snapshot.connectionState == ConnectionState.waiting){
                return const CircularProgressIndicator();
              } else if (snapshot.hasError){
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData){
                if (snapshot.data != null) {
                  return ListView.builder(
                      itemBuilder: (context, index) => EditWidget(
                      task: snapshot.data![index],
                      onTap: () async {
                        await Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Forms()));
                        setState(() {});
                      },
                      onLongPress: () async {
                        showDialog(context: context,
                            builder: (context) {
                          return AlertDialog(
                              title: const Text('Do you want to Delete this task?'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () async {
                                  await DatabaseHelper.deleteTask(snapshot.data![index]);
                                  Navigator.pop(context);
                                  setState(() {});
                                  },
                                    child: const Text('Yes'),
                                ),
                                ElevatedButton(onPressed: () => Navigator.pop(context),
                                    child: const Text('No'),
                                )
                              ],
                            );
                            });
                        },
                      ),
                      itemCount: snapshot.data!.length,
                  );
                }
                return const Center(
                  child: Text('No Tasks Available'),
                );
              }
              return const SizedBox.shrink();
            },
          ),
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Forms()));
          setState(() {});
        },
        child: const Icon(Icons.add_task_sharp),
      ),
    );
  }
}
