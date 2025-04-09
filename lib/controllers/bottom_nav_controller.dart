import 'package:learning_system/utils/imports.dart';

class BottomNavController extends GetxController {
  final ClassController classController = Get.put(ClassController());

  var selectedIndex = 0.obs;
  final List<Widget> screens = [ClassListScreen()];

  Widget get currentScreen => screens[selectedIndex.value];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
