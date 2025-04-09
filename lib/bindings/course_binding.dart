import 'package:learning_system/utils/imports.dart';

class CourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseController>(() => CourseController());
  }
}