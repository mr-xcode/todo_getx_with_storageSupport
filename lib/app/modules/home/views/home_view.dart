import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_getx_withstorage/app/data/todo_model.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController teditController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TODO',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('add-todo', arguments: '999');
        },
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        return Container(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: controller.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onLongPress: () {
                    Todo temp = controller.todoList[index];
                    controller.todoList.removeAt(index);
                    Get.snackbar(
                      "Todo Deleted",
                      "Todo Deleted",
                      mainButton: TextButton(
                        onPressed: () {
                          controller.todoList.insert(index, temp);
                        },
                        child: const Icon(Icons.restore),
                      ),
                    );
                  },
                  onTap: () {
                    Get.dialog(
                      AlertDialog(
                        title: const Text('Edit:'),
                        content: TextField(
                          controller: teditController,
                          decoration: InputDecoration(
                            label: Text(
                                controller.todoList[index].title.toString()),
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              var changed = controller.todoList[index];
                              changed.title = teditController.text;
                              controller.updEdtList();
                              teditController.clear();
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    );
                    //Get.toNamed('edit-todo', arguments: index);
                    //Get.to(AddTodoView());
                  },
                  leading: Checkbox(
                      value: controller.todoList[index].isDone,
                      onChanged: (v) {
                        var changed = controller.todoList[index];
                        changed.isDone = v!;
                        controller.todoList[index] = changed;
                      }),
                  title: Text(
                    controller.todoList[index].title.toString(),
                    style: (controller.todoList[index].isDone)
                        ? const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.red,
                          )
                        : const TextStyle(color: Colors.green),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                );
              }),
        );
      }),
    );
  }
}
