import 'package:learning_system/utils/imports.dart';

class DoCourseAssignmentScreen extends GetView<DoCourseAssignmentController> {
  const DoCourseAssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading:
            kDebugMode
                ? IconButton(
                  icon: const Icon(Icons.arrow_back, color: AppColors.primaryText),
                  onPressed: () {
                    Get.back();
                  },
                )
                : null,
        title: Obx(() {
          if (controller.isLoading.value) {
            return CircularProgressIndicator(color: AppColors.primary);
          }
          return Text(
            controller.assignmentTitle.value,
            style: TextStyle(color: AppColors.primaryText, fontWeight: FontWeight.bold),
          );
        }),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: Get.width,
                height: Get.height * 0.16,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.assignmentTitle.value,
                      style: const TextStyle(
                        fontSize: 24,
                        color: AppColors.primaryTextLight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${"Candidate".tr}: ${controller.username.value}",
                      style: const TextStyle(
                        fontSize: 24,
                        color: AppColors.primaryTextLight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Text(
                            "${"time_left".tr}: ${controller.timeLeft.value}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.primaryTextLight,
                              fontFamily: FontStyleTextStrings.light,
                            ),
                          ),
                        ),
                        CustomButton(
                          onTap: controller.submitAssignment,
                          btnText: "submit".tr,
                          btnColor: AppColors.background,
                          textColor: AppColors.primaryText,
                          height: 40,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(20),
                width: Get.width,
                height: Get.height * 0.38,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text(
                      "Câu ${controller.currentQuestion.value + 1}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryTextLight,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.questionList[controller.currentQuestion.value].question!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryTextLight,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            controller
                                .questionList[controller.currentQuestion.value]
                                .choices!
                                .length,
                            (index) {
                              final choice =
                                  controller
                                      .questionList[controller.currentQuestion.value]
                                      .choices![index];
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Radio(
                                        value: choice.id,
                                        groupValue:
                                            controller
                                                .answerList[controller.currentQuestion.value]
                                                .choiceId,
                                        onChanged: (value) {
                                          if (value != null) {
                                            controller.saveSelection(
                                              controller
                                                  .questionList[controller.currentQuestion.value]
                                                  .id!,
                                              value,
                                            );
                                          }
                                        },
                                        fillColor: WidgetStateProperty.all(AppColors.background),
                                        activeColor: AppColors.primaryTextLight,
                                      ),
                                      Expanded(
                                        child: Text(
                                          choice.choice!,
                                          softWrap: true,
                                          overflow: TextOverflow.visible,
                                          maxLines: 3,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: FontStyleTextStrings.medium,
                                            color: AppColors.primaryTextLight,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(20),
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Danh sách câu hỏi",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryTextLight,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => Wrap(
                          alignment: WrapAlignment.center,
                          children: List.generate(
                            controller.questionList.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.currentQuestion.value = index;
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(12),
                                  backgroundColor:
                                      controller.currentQuestion.value == index
                                          ? AppColors.white
                                          : AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(color: AppColors.background),
                                  ),
                                ),
                                child: Text(
                                  (index + 1).toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: FontStyleTextStrings.medium,
                                    color:
                                        controller.currentQuestion.value == index
                                            ? AppColors.primaryText
                                            : AppColors.primaryTextLight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      }),
    );
  }
}
