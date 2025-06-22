import 'package:learning_system/utils/imports.dart';

class ClassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClassController>(() => ClassController());
  }
}
