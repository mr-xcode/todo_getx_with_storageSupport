import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx_withstorage/app/data/todo_model.dart';
import 'package:todo_getx_withstorage/app/modules/home/controllers/home_controller.dart';

class AddTodoController extends GetxController {
  final homeController = Get.put(HomeController());
  final TextEditingController titleController = TextEditingController();

  void addTodo(String title) {
    homeController.todoList.add(
      Todo(title: titleController.text.toString(), isDone: false),
    );
    update();
  }
}
