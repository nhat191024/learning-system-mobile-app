import 'package:learning_system/utils/imports.dart';

class CourseDetailScreen extends GetView<CourseDetailController> {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 160,
                padding: const EdgeInsets.fromLTRB(5, 60, 5, 0),
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: AppColors.primaryText),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'course_detail'.tr,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TabBar(
                      controller: controller.tabController,
                      labelColor: AppColors.primary,
                      unselectedLabelColor: Colors.black,
                      labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      indicatorColor: AppColors.primary,
                      indicatorWeight: 2,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 2),
                      tabs: [Tab(text: '${"assignment".tr} '), Tab(text: '${"points".tr} ')],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return TabBarView(
                        controller: controller.tabController,
                        children: [
                          CourseAssignment(), CoursePoint()
                        ],
                      );
                    }
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
