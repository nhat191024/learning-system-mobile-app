import 'package:learning_system/utils/imports.dart';

class DoAssignmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoAssignmentController>(
      () => DoAssignmentController(),
    );
  }
}