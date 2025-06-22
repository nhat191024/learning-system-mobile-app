import 'package:learning_system/utils/imports.dart';

class OverviewScreen extends StatelessWidget {
  OverviewScreen({super.key});

  final controller = Get.find<ClassDetailController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: Get.width,
              height: Get.height * 0.12,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${controller.classDetail.value.name} (${controller.classDetail.value.code})",
                    style: const TextStyle(
                      fontSize: 24,
                      color: AppColors.primaryTextLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${controller.classDetail.value.description}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryTextLight,
                      fontFamily: FontStyleTextStrings.medium,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${controller.classDetail.value.teacherName} - ${controller.classDetail.value.createAt}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryTextLight,
                      fontFamily: FontStyleTextStrings.light,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: AppColors.primaryTextLight, blurRadius: 2, offset: Offset(0, 1)),
                ],
              ),
              child: Row(
                children: [
                  //TODO: make this can send notification (maybe)
                  const Text(
                    "Thông báo nội dung nào đó cho lớp học của bạn",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryTextLight,
                      fontFamily: FontStyleTextStrings.regular,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send_rounded, color: AppColors.primaryTextLight),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: List.generate(
                controller.notificationList.length,
                (index) => Container(
                  width: Get.width,
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 22,
                        backgroundColor: AppColors.primaryTextLight,
                        child: Icon(Icons.list_alt, color: AppColors.primary),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.notificationList[index].content ?? 'No Title',
                            style: const TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryTextLight,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            controller.notificationList[index].createdAt ?? 'No Description',
                            style: const TextStyle(fontSize: 14, color: AppColors.secondaryText),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
