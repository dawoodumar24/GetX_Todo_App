import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/Model/todo_model.dart';

class TodoController extends GetxController {
 RxList<TodoModel> todos = <TodoModel>[].obs;

 TextEditingController task = TextEditingController();

 void addTodo() {
   var title = task.text.trim();

   if(title.isEmpty) {
    Get.snackbar('Empty', 'Please enter a task');
    return;
   }

   var newTodo = TodoModel(title: title);
   todos.add(newTodo);

   task.clear();
 }

 void removeTodo(int index) {
   todos.removeAt(index);
 }

}