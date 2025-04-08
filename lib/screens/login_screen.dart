import 'package:learning_system/utils/imports.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Learning',
              style: TextStyle(
                fontSize: 46,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 5),
            Text(
              'System',
              style: TextStyle(
                fontSize: 46,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * 0.08),
              Image.asset(Images.login),
              SizedBox(height: Get.height * 0.06),
              Text(
                'login'.tr,
                style: TextStyle(
                  fontSize: 36,
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Obx(
                () => CustomTextField(
                  labelText: "username".tr,
                  hintText: "username_label".tr,
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.username,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      controller.usernameErrorText.value = "username_error".tr;
                      controller.isUsernameError.value = true;
                    } else {
                      controller.usernameErrorText.value = "";
                      controller.isUsernameError.value = false;
                      // if (!GetUtils.isEmail(value)) {
                      //   controller.usernameErrorText.value = "Email không hợp lệ";
                      //   controller.isUsernameError.value = true;
                      // } else {
                      //   controller.usernameErrorText.value = "";
                      //   controller.isUsernameError.value = false;
                      // }
                    }
                  },
                  errorText: controller.usernameErrorText.value,
                  isError: controller.isUsernameError,
                  obscureText: false.obs,
                  width: Get.width * 0.9,
                  border: 8,
                  leftPadding: 0,
                  rightPadding: 0,
                  topPadding: 10,
                  bottomPadding: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "password".tr,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: FontStyleTextStrings.bold,
                        color: AppColors.primaryText,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: Get.width * 0.9,
                      child: Obx(
                        () => TextField(
                          obscureText: controller.isObscureText.value,
                          keyboardType: TextInputType.visiblePassword,
                          controller: controller.password,
                          onChanged: (value) {
                            if (value.isEmpty) {
                              controller.passwordErrorText.value =
                                  "password_error".tr;
                              controller.isPasswordError.value = true;
                            } else {
                              if (value.length < 6) {
                                controller.passwordErrorText.value =
                                    "password_error_1".tr;
                                controller.isPasswordError.value = true;
                              } else {
                                controller.passwordErrorText.value = "";
                                controller.isPasswordError.value = false;
                              }
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "password_label".tr,
                            hintStyle: const TextStyle(
                              color: AppColors.disable,
                            ),
                            contentPadding: const EdgeInsets.fromLTRB(
                              15,
                              15,
                              10,
                              15,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color:
                                    controller.isPasswordError.value
                                        ? AppColors.errorMain
                                        : AppColors.dividers,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: BorderSide(
                                color:
                                    controller.isPasswordError.value
                                        ? AppColors.errorMain
                                        : AppColors.dividers,
                                width: 1,
                              ),
                            ),
                            errorText:
                                controller.isPasswordError.value
                                    ? controller.passwordErrorText.value
                                    : null,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    controller.isPasswordError.value
                                        ? AppColors.errorMain
                                        : AppColors.primaryText,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            filled: controller.isPasswordError.value,
                            fillColor:
                                controller.isPasswordError.value
                                    ? AppColors.errorLight
                                    : AppColors.background,
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isObscureText.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                controller.isObscureText.value =
                                    !controller.isObscureText.value;
                              },
                            ),
                            alignLabelWithHint: true,
                            isDense: true,
                            suffixIconConstraints: const BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => CustomButton(
                  onTap: () {
                    controller.login();
                  },
                  isLoading: controller.isButtonLoading.value,
                  btnText: "login".tr,
                  width: Get.width * 0.9,
                  textColor: AppColors.primaryTextLight,
                  btnColor: AppColors.primary,
                  borderRadius: 8,
                  leftPadding: 0,
                  rightPadding: 0,
                  bottomPadding: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
