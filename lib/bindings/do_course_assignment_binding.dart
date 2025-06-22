import 'package:learning_system/utils/imports.dart';

class DoCourseAssignmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoCourseAssignmentController>(
      () => DoCourseAssignmentController(),
    );
  }
}