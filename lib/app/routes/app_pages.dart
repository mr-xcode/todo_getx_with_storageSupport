import 'package:get/get.dart';

import '../modules/add_todo/bindings/add_todo_binding.dart';
import '../modules/add_todo/views/add_todo_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TODO,
      page: () => AddTodoView(),
      binding: AddTodoBinding(),
    ),
  ];
}
