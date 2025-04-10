import 'package:learning_system/utils/imports.dart';

class Token {
  static dynamic getToken() async {
    if (StorageService.checkData(key: LocalStorageKeys.token)) {
      return StorageService.readData(key: LocalStorageKeys.token);
    } else {
      return null;
    }
  }

  static Future<bool> checkToken() async {
    if (StorageService.checkData(key: LocalStorageKeys.token)) {
      var url = Uri.parse("${Api.server}token");
      var token = StorageService.readData(key: LocalStorageKeys.token);
      try {
        var response = await get(
          url,
          headers: {"Authorization": "Bearer $token"},
        );

        var message = jsonDecode(response.body)['message'];

        if (response.statusCode == 200 && message == "Token hợp lệ") {
          Get.offAllNamed(Routes.bottomNav);
          return true;
        }

        return false;
      } catch (e) {
        return false;
      }
    } else {
      return false;
    }
  }

  static storeToken(String token) async {
    if (StorageService.checkData(key: LocalStorageKeys.token)) {
      StorageService.removeData(key: LocalStorageKeys.token);
    }

    StorageService.writeStringData(key: LocalStorageKeys.token, value: token);
  }

  static removeToken() {
    StorageService.removeData(key: LocalStorageKeys.token);
  }
}
