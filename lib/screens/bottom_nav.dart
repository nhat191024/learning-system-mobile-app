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
                icon: Icon(Icons.school_outlined),
                label: 'class'.tr,
                activeIcon: Icon(Icons.school),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined),
                label: 'course'.tr,
                activeIcon: Icon(Icons.book),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'profile'.tr,
                activeIcon: Icon(Icons.person),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: 'favorite'.tr,
                activeIcon: Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_circle_outline),
                label: 'result'.tr,
                activeIcon: Icon(Icons.check_circle),
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
