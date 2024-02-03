import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/screens/home/model/todo_model.dart';
import 'package:todo_app/utils/helpers/db_helper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime? date;
  TimeOfDay? time;
  String? task;
  TextEditingController taskCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: addTodo,
        label: const Text('Add TO-DO'),
        icon: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("To-Do App"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DBHelper.dbHelper.fetchTask(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<TODO>? TodoData = snapshot.data;
            return ListView.builder(
                itemCount: TodoData?.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        "${TodoData?[i].task}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          "Date: ${TodoData?[i].date}\nTime: ${TodoData?[i].time}"),
                      leading: Text("${TodoData?[i].id}"),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            DBHelper.dbHelper
                                .deleteTask(d_id: TodoData![i].id!);
                          });
                        },
                        icon: const Icon(Icons.delete_forever_outlined),
                      ),
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  addTodo() {
    Get.defaultDialog(
      title: 'To-do App',
      content: Row(
        children: [
          Expanded(
            child: IconButton(
              onPressed: getDate,
              icon: const Icon(Icons.calendar_month),
            ),
          ),
          Expanded(
            flex: 4,
            child: TextFormField(
              controller: taskCon,
              onChanged: getTask,
              decoration: InputDecoration(
                hintText: 'add task here',
                border: myBorder(),
                enabled: true,
                focusedBorder: myBorder(),
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: getTime,
              icon: const Icon(Icons.watch),
            ),
          ),
        ],
      ),
      confirm: OutlinedButton(onPressed: addTask, child: const Text('add')),
    );
  }

  OutlineInputBorder myBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.black),
      );

  getTask(val) {
    task = val;
  }

  getDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );
    setState(() {
      date = pickedDate;
    });
  }

  getTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      time = pickedTime;
    });
  }

  addTask() async {
    log("$task");
    log("$date");
    log("$time");
    TODO todo = TODO(
      date: '${date?.day}/${date?.month}/${date?.year}',
      task: task!,
      time: '${time?.hour}:${time?.minute}',
    );
    int? res = await DBHelper.dbHelper.insertTodo(todo: todo);

    taskCon.clear();
    Get.snackbar('To-Do App', 'Task added at $res');
  }
}
