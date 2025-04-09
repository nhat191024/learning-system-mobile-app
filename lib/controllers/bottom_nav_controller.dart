import 'package:learning_system/utils/imports.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;
  final List<Widget> screens = [
    ClassListScreen(),
    CourseListScreen(),
    ProfileScreen(),
  ];

  Widget get currentScreen => screens[selectedIndex.value];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
