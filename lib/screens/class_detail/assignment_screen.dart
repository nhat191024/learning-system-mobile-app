import 'package:learning_system/utils/imports.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ClassDetailController>();
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
                            "${"due".tr} ${controller.assignmentList[index].dueDate}",
                            style: const TextStyle(fontSize: 16, color: AppColors.primaryTextLight),
                          ),
                          if (controller.assignmentList[index].isDue ?? false) ...[
                            const SizedBox(height: 5),
                            Text(
                              "overdue".tr,
                              style: const TextStyle(
                                fontSize: 18,
                                color: AppColors.primaryTextLight,
                                fontFamily: FontStyleTextStrings.bold,
                              ),
                            ),
                          ],
                          const SizedBox(height: 5),
                          Text(
                            "${"duration".tr}: ${controller.assignmentList[index].duration} ${"m".tr}",
                            style: const TextStyle(fontSize: 16, color: AppColors.primaryTextLight),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CustomButton(
                        onTap: () {
                          Get.toNamed(
                            Routes.doAssignment,
                            arguments: {
                              'classId': controller.classId.value,
                              'assignmentId': controller.assignmentList[index].id,
                              'assignmentTitle': controller.assignmentList[index].title,
                            },
                          );
                        },
                        btnText: "start",
                        textColor: AppColors.primaryText,
                        width: 10,
                        btnColor: AppColors.background,
                        suffixIcon: Icons.play_circle,
                        suffixIconColor: AppColors.primaryText,
                        isDisabled:
                            (controller.assignmentList[index].isDue ?? false)
                                ? true
                                : false || (controller.assignmentList[index].isSubmitted ?? false)
                                ? true
                                : false,
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
