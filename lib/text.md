if (controller.titleController.) {
                      Get.snackbar(
                          'No Data', "There is no Text and task add failed");
                      return;
                    } else {
                      controller.addTodo(controller.titleController.text);
                      print(controller.titleController.text);
                      Get.back();
                      Get.snackbar("Added", "Task is added");
                    }