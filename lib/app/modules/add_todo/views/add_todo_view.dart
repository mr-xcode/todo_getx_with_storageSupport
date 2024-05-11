import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:todo_getx_withstorage/app/modules/home/controllers/home_controller.dart';

import '../controllers/add_todo_controller.dart';

class AddTodoView extends GetView<AddTodoController> {
  const AddTodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'AddTodoView',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                autofocus: true,
                controller: controller.titleController,
                decoration: InputDecoration(
                  label: Text('Task:'),
                  border: InputBorder.none,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GFButton(
                  onPressed: () {
                    return Get.back();
                  },
                  child: Text("Cancel"),
                  color: GFColors.WARNING,
                ),
                GFButton(
                  onPressed: () {
                    if (controller.titleController.text.isEmpty) {
                      Get.snackbar(
                          'No Data', "There is no Text and task add failed");
                      return;
                    } else {
                      controller.addTodo(controller.titleController.text);
                      Get.back();
                      //Get.snackbar("Added", "Task is added");
                    }
                  },
                  color: GFColors.SUCCESS,
                  child: Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
