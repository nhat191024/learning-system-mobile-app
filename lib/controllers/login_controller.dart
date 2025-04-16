import 'package:learning_system/utils/imports.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final RxBool isUsernameError = false.obs;
  final RxString usernameErrorText = "".obs;
  final TextEditingController password = TextEditingController();
  final RxBool isPasswordError = false.obs;
  final RxBool isObscureText = true.obs;
  final RxString passwordErrorText = "".obs;

  final RxBool isButtonLoading = false.obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!await Token.checkToken()) return;
    });
    super.onInit();
  }

  void validate() {
    if (username.text.isEmpty) {
      isUsernameError.value = true;
      usernameErrorText.value = "username_error".tr;
    } else {
      isUsernameError.value = false;
      usernameErrorText.value = "";
    }

    if (password.text.isEmpty) {
      isPasswordError.value = true;
      passwordErrorText.value = "password_error".tr;
    } else {
      isPasswordError.value = false;
      passwordErrorText.value = "";
    }
  }

  login() async {
    validate();
    if (!isUsernameError.value && !isPasswordError.value) {
      var url = Uri.parse("${Api.server}login");
      try {
        isButtonLoading.value = true;
        var response = await post(url, body: {"login": username.text, "password": password.text});
        var data = jsonDecode(response.body);
        if (response.statusCode == 200) {
          Token.storeToken(data["token"]);
          StorageService.writeStringData(key: "username", value: data["name"]);
          StorageService.writeStringData(key: "avatar", value: data["avatar"]);
          StorageService.writeStringData(key: "isLogin", value: "true");
          StorageService.writeStringData(key: "role", value: data["role"]);
          Get.offAllNamed(Routes.bottomNav);
        } else if (response.statusCode == 401) {
          Get.dialog(
            const NotificationDialog(
              title: "Đăng nhập thất bại",
              message: "Tài khoản hoặc mật khẩu không đúng",
            ),
          );
        }
      } finally {
        isButtonLoading.value = false;
      }
    }
  }

  @override
  void onClose() {
    // Giải phóng tài nguyên khi controller bị hủy
    username.dispose();
    password.dispose();
    isUsernameError.close();
    isPasswordError.close();
    isObscureText.close();
    usernameErrorText.close();
    passwordErrorText.close();
    isButtonLoading.close();
    super.onClose();
  }
}
