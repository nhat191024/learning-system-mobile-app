import 'package:learning_system/utils/imports.dart';

class CourseDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseDetailController>(() => CourseDetailController());
  }
}
