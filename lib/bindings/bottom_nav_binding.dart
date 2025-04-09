import 'package:learning_system/utils/imports.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<ClassController>(() => ClassController());
    Get.lazyPut<CourseController>(() => CourseController());
  }
}