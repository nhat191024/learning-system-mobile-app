import 'package:learning_system/utils/imports.dart';

class AssignmentScreen extends StatelessWidget {
  AssignmentScreen({super.key});

  final controller = Get.find<ClassDetailController>();
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
                            "${"due".tr} ${controller.assignmentList[index].dueDate}",
                            style: const TextStyle(fontSize: 16, color: AppColors.primaryTextLight),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "${"duration".tr}: ${controller.assignmentList[index].duration} ${"m".tr}",
                            style: const TextStyle(fontSize: 16, color: AppColors.primaryTextLight),
                          ),
                          if (controller.assignmentList[index].isDue ?? false) ...[
                            const SizedBox(height: 10),
                            Text(
                              "${"status".tr}: ${"overdue".tr}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: AppColors.primaryTextLight,
                                fontFamily: FontStyleTextStrings.bold,
                              ),
                            ),
                          ] else if (controller.assignmentList[index].isSubmitted ?? false) ...[
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
                          if (controller.assignmentList[index].type == "quiz") {
                            Get.toNamed(
                              Routes.doAssignment,
                              arguments: {
                                'classId': controller.classId.value,
                                'assignmentId': controller.assignmentList[index].id,
                                'assignmentTitle': controller.assignmentList[index].title,
                              },
                            );
                          } else if (controller.assignmentList[index].type == "lab") {
                            _showLinkSubmitModal(
                              context,
                              controller.assignmentList[index].title ?? 'No Title',
                              controller.assignmentList[index].description ?? 'No Description',
                              controller.assignmentList[index].type ?? 'No Type',
                              controller.assignmentList[index].id.toString(),
                            );
                          } else {
                            Get.snackbar("Error", "Assignment type not supported");
                          }
                        },
                        btnText:
                            controller.assignmentList[index].type == 'quiz'
                                ? 'start'.tr
                                : 'hand_in'.tr,
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

  Future _showLinkSubmitModal(
    BuildContext context,
    String title,
    String description,
    String type,
    String id,
  ) {
    return showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withAlpha(90),
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (_, __, ___) => _buildSubmitDialog(context, title, description, type, id),
    );
  }

  Widget _buildSubmitDialog(
    BuildContext context,
    String title,
    String description,
    String type,
    String id,
  ) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          controller.linkSubmit.clear();
          controller.isLinkSubmitError.value = false;
        }
      },
      child: Center(
        child: Material(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.background,
          child: Container(
            width: Get.width * 0.9,
            constraints: BoxConstraints(maxWidth: 600, maxHeight: Get.height * 0.5),
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildDialogHeader(),
                const SizedBox(height: 16),
                _buildAssignmentDetails(title, description),
                const SizedBox(height: 24),
                _buildSubmissionField(),
                const SizedBox(height: 30),
                _buildSubmitButton(type, id),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDialogHeader() {
    return Text(
      'submit_assignment'.tr,
      style: const TextStyle(fontSize: 26, color: AppColors.primary, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildAssignmentDetails(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.secondaryText,
            fontFamily: FontStyleTextStrings.regular,
          ),
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildSubmissionField() {
    return Obx(
      () => CustomTextField(
        labelText: "assignment_link".tr,
        labelColor: AppColors.primary,
        labelSize: 18,
        hintText: "enter_link".tr,
        errorText: controller.linkSubmitError.value,
        isError: controller.isLinkSubmitError.value.obs,
        width: double.infinity,
        obscureText: false.obs,
        controller: controller.linkSubmit,
        minLines: 1,
        maxLines: 3,
        onChanged: (value) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            controller.isLinkSubmitError.value = value.isEmpty;
            if (value.isEmpty) {
              controller.linkSubmitError.value = "link_required".tr;
            }
          });
        },
      ),
    );
  }

  Widget _buildSubmitButton(String type, String id) {
    return CustomButton(
      onTap: () {
        if (controller.linkSubmit.text.isNotEmpty) {
          controller.submitAssignment(type, id);
        } else {
          controller.isLinkSubmitError.value = true;
          controller.linkSubmitError.value = "link_required".tr;
        }
      },
      btnText: 'submit'.tr,
      textColor: AppColors.primaryTextLight,
      btnColor: AppColors.primary,
      width: 160,
    );
  }
}
