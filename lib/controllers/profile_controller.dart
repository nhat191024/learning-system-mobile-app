import 'package:learning_system/utils/imports.dart';

class ProfileController extends GetxController {
  final Rx<ProfileModel> profile =
      ProfileModel(
        id: null,
        email: '',
        avatar: '',
        name: '',
        gender: '',
        role: '',
        status: '',
        createdAt: '',
        updatedAt: '',
      ).obs;

  final RxBool isLoading = true.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final RxString gender = ''.obs;
  final RxString role = ''.obs;
  final RxString status = ''.obs;
  final RxString createdAt = ''.obs;
  final RxString updatedAt = ''.obs;

  final RxString emailError = ''.obs;
  final RxString nameError = ''.obs;

  RxString token = "".obs;
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      token.value = await Token.getToken() ?? Api.testToken;
      await fetchProfile();
    });
  }

  fetchProfile() async {
    try {
      isLoading.value = true;
      String url = "${Api.server}profile";
      var response = await get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: Api.apiTimeOut));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        profile.value = ProfileModel.fromJson(data['user']);

        emailController.text = profile.value.email ?? '';
        nameController.text = profile.value.name ?? '';
      }
    } finally {
      isLoading.value = false;
    }
  }

  logout() async {
    try {
      String url = "${Api.server}logout";
      var response = await get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: Api.apiTimeOut));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var message = data['message'];

        if (kDebugMode) {
          print("Logout:");
          print("Status code: ${response.statusCode}");
          print("Message: $message");
        }

        if (message == "Đăng xuất thành công.") {
          StorageService.removeData(key: LocalStorageKeys.token);
          StorageService.removeData(key: 'username');
          StorageService.removeData(key: 'avatar');
          StorageService.removeData(key: 'isLogin');
          StorageService.removeData(key: 'role');
          Get.offAllNamed(Routes.loginScreen);
        }
      } else {
        Get.snackbar(
          "error".tr,
          "logout_error".tr,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print("Logout error: $e");
      }
    }
  }
}
