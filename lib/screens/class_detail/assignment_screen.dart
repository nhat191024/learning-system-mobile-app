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
              padding: const EdgeInsets.only(top: 0),  
              itemBuilder: (context, index) {
                return Container(
                  width: Get.width,
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
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
                        controller.assignmentList[index].dueDate ??
                            'No Description',
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.primaryTextLight,
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
