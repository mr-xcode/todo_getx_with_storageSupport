import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_getx_withstorage/app/data/todo_model.dart';

class HomeController extends GetxController {
  var todoList = <Todo>[].obs;
  @override
  void onInit() {
    List? storedTodos = GetStorage().read<List>('todos');

    if (storedTodos != null) {
      todoList = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }
    ever(todoList, (_) {
      GetStorage().write('todos', todoList.toList());
    });
    super.onInit();
  }

  void updEdtList() {
    GetStorage().write('todos', todoList.toList());
    todoList.refresh();
  }
}
