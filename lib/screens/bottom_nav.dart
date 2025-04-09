import 'package:learning_system/utils/imports.dart';

class BottomNav extends GetView<BottomNavController> {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.currentScreen),
      bottomNavigationBar: Obx(() {
        return SizedBox(
          height: 75,
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon:
                    controller.selectedIndex.value == 0
                        ? Icon(Icons.home)
                        : Icon(Icons.home_filled),
                label: 'home'.tr,
              ),
              BottomNavigationBarItem(
                icon:
                    controller.selectedIndex.value == 1
                        ? Icon(Icons.home)
                        : Icon(Icons.home_filled),
                label: 'Class List',
              ),
              BottomNavigationBarItem(
                icon:
                    controller.selectedIndex.value == 2
                        ? Icon(Icons.home)
                        : Icon(Icons.home_filled),
                label: 'Class List',
              ),
              BottomNavigationBarItem(
                icon:
                    controller.selectedIndex.value == 3
                        ? Icon(Icons.home)
                        : Icon(Icons.home_filled),
                label: 'Class List',
              ),
              BottomNavigationBarItem(
                icon:
                    controller.selectedIndex.value == 4
                        ? Icon(Icons.home)
                        : Icon(Icons.home_filled),
                label: 'Class List',
              ),
            ],
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.disable,
            selectedLabelStyle: const TextStyle(
              fontFamily: FontStyleTextStrings.regular,
              fontSize: 12,
              color: AppColors.primaryTextLight,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: FontStyleTextStrings.regular,
              fontSize: 12,
              color: AppColors.disable,
            ),
            onTap: (index) {
              controller.changeIndex(index);
            },
          ),
        );
      }),
    );
  }
}
