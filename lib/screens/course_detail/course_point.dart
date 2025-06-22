import 'package:learning_system/utils/imports.dart';

class CoursePoint extends StatelessWidget {
  const CoursePoint({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CourseDetailController>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(
            () => ListView.builder(
              itemCount: controller.studentPointList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              itemBuilder: (context, index) {
                return Container(
                  width: Get.width,
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Text(
                        controller.studentPointList[index].title ?? 'No Title',
                        style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.primaryTextLight,
                          fontFamily: FontStyleTextStrings.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${'point'.tr} ${controller.studentPointList[index].point} / ${controller.studentPointList[index].totalPoint}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.primaryTextLight,
                          fontFamily: FontStyleTextStrings.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
