import 'package:learning_system/utils/imports.dart';

class NotificationDialog extends StatelessWidget {
  final String title;
  final String message;

  const NotificationDialog({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.primary,
                fontFamily: FontStyleTextStrings.medium,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.primaryText,
                fontFamily: FontStyleTextStrings.regular,
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () {
                Get.back();
              },
              btnText: 'Đóng',
              width: 100,
              height: 40,
              textSize: 14,
              textColor: AppColors.white,
              fontFamily: FontStyleTextStrings.medium,
              btnColor: AppColors.primary,
              borderColor: AppColors.primary,
              borderRadius: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationDialogWithCustomButton extends StatelessWidget {
  final String title;
  final String message;
  final String btnText;
  final Color btnTextColor;
  final Color btnColor;
  final VoidCallback onTap;

  const NotificationDialogWithCustomButton({
    super.key,
    required this.title,
    required this.message,
    required this.btnText,
    this.btnTextColor = AppColors.primaryTextLight,
    this.btnColor = AppColors.primary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onTap: () {
                    Get.back();
                  },
                  btnText: 'close'.tr,
                  width: 100,
                  height: 40,
                  textSize: 14,
                  textColor: AppColors.primaryTextLight,
                  fontFamily: FontStyleTextStrings.medium,
                  btnColor: AppColors.primary,
                  borderColor: AppColors.primary,
                  borderRadius: 5,
                ),
                const SizedBox(width: 10),
                CustomButton(
                  onTap: onTap,
                  btnText: btnText,
                  width: 100,
                  height: 40,
                  textSize: 14,
                  textColor: btnTextColor,
                  fontFamily: FontStyleTextStrings.medium,
                  btnColor: btnColor,
                  borderColor: AppColors.primary,
                  borderRadius: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationDialogWithCustomButtonAndVideoUrl extends StatelessWidget {
  final String title;
  final String message;
  final String btnText;
  final Color btnTextColor;
  final Color btnColor;
  final VoidCallback onTap;
  final String videoUrl;

  const NotificationDialogWithCustomButtonAndVideoUrl({
    super.key,
    required this.title,
    required this.message,
    required this.btnText,
    this.btnTextColor = AppColors.primaryTextLight,
    this.btnColor = AppColors.primary,
    required this.onTap,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () async {
                try {
                  await launchUrl(Uri.parse(videoUrl), mode: LaunchMode.externalApplication);
                } catch (e) {
                  Get.snackbar('error'.tr, 'error_message'.tr);
                }
              },
              child: Text(
                'Xem video hướng dẫn',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  onTap: () {
                    Get.back();
                  },
                  btnText: 'close'.tr,
                  width: 100,
                  height: 40,
                  textSize: 14,
                  textColor: AppColors.primaryTextLight,
                  fontFamily: FontStyleTextStrings.medium,
                  btnColor: AppColors.primary,
                  borderColor: AppColors.primary,
                  borderRadius: 5,
                ),
                const SizedBox(width: 10),
                CustomButton(
                  onTap: onTap,
                  btnText: btnText,
                  width: 100,
                  height: 40,
                  textSize: 14,
                  textColor: btnTextColor,
                  fontFamily: FontStyleTextStrings.medium,
                  btnColor: btnColor,
                  borderColor: AppColors.primary,
                  borderRadius: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationDialogWithoutButton extends StatelessWidget {
  final String title;
  final String message;

  const NotificationDialogWithoutButton({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.primary,
                fontFamily: FontStyleTextStrings.medium,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.primaryText,
                fontFamily: FontStyleTextStrings.regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
