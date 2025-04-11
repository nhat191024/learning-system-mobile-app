import 'package:learning_system/utils/imports.dart';

class ClassDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClassDetailController>(() => ClassDetailController());
  }
}