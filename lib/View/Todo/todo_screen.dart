import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/ViewModel/TodoController/todo_controller.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final taskController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Welcome to To-do App",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Text(
              "Enter Your Daily Tasks Here:",
              style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 17),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: taskController.task,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 17),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {
                    taskController.addTodo();
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 48),
            Text(
              "Your Tasks:",
              style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
            ),
            SizedBox(height: 8),
            Obx(
              () { 
                if(taskController.todos.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("No tasks to show. Add a task now.", style: TextStyle(fontSize: 16, fontFamily: 'Poppins', color: Colors.grey)),
                );
              }
                else{ return Expanded(
                  child: ListView.builder(
                    itemCount: taskController.todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("${index + 1}. ${taskController.todos[index].title}"),
                        leading: IconButton(
                          onPressed: () {
                            taskController.todos[index].isDone =
                            !taskController.todos[index].isDone;
                            taskController.todos.refresh();
                          },
                          icon: Icon(
                            taskController.todos[index].isDone
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                          ),
                        ),
                        trailing: IconButton(onPressed: () {
                          taskController.removeTodo(index);
                        }, icon: Icon(Icons.delete)),
                      );
                    },
                  ),
                );}
              }),
          ],
        ),
      ),
    );
  }
}
