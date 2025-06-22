import 'package:learning_system/utils/imports.dart';

class CourseAssignment extends StatelessWidget {
  CourseAssignment({super.key});

  final controller = Get.find<CourseDetailController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(
            () => ListView.builder(
              itemCount: controller.assignmentList.length,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.assignmentList[index].title ?? 'No Title',
                            style: const TextStyle(
                              fontSize: 18,
                              color: AppColors.primaryTextLight,
                              fontFamily: FontStyleTextStrings.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${"duration".tr}: ${controller.assignmentList[index].duration} ${"m".tr}",
                            style: const TextStyle(fontSize: 16, color: AppColors.primaryTextLight),
                          ),
                          if (controller.assignmentList[index].isSubmitted ?? false) ...[
                            const SizedBox(height: 5),
                            Text(
                              "${"status".tr}: ${"handed".tr}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: AppColors.primaryTextLight,
                                fontFamily: FontStyleTextStrings.bold,
                              ),
                            ),
                          ],
                        ],
                      ),
                      const Spacer(),
                      CustomButton(
                        onTap: () {
                          if (controller.assignmentList[index].isSubmitted ?? false) {
                            Get.snackbar(
                              "error".tr,
                              "assignment_already_submitted".tr,
                              backgroundColor: AppColors.primary,
                              colorText: AppColors.primaryText,
                            );
                          } else {
                            Get.dialog(
                              NotificationDialogWithCustomButtonAndVideoUrl(
                                title: 'note'.tr,
                                message: 'assignment_notification'.tr,
                                videoUrl: controller.assignmentList[index].videoUrl ?? '',
                                btnText: 'submit'.tr,
                                btnColor: AppColors.errorMain,
                                onTap: () {
                                  Get.back();
                                  Get.toNamed(
                                    Routes.doCourseAssignment,
                                    arguments: {
                                      'courseId': controller.courseId,
                                      'assignmentId': controller.assignmentList[index].id,
                                      'assignmentTitle': controller.assignmentList[index].title,
                                    },
                                  );
                                },
                              ),
                            );
                          }
                        },
                        btnText: 'start'.tr,
                        textColor: AppColors.primaryText,
                        width: 10,
                        btnColor: AppColors.background,
                        suffixIcon: Icons.play_circle,
                        suffixIconColor: AppColors.primaryText,
                        isDisabled:
                            (controller.assignmentList[index].isSubmitted ?? false) ? true : false,
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
