import 'package:learning_system/utils/imports.dart';

class Words extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      //login screen
      'login': 'Login',
      'username': 'Username',
      'password': 'Password',
      'username_label': 'Enter your username',
      'password_label': 'Enter your password',
      'username_error': 'Username cannot be empty',
      'password_error': 'Password cannot be empty',
      'password_error_1': 'Password must be at least 6 characters',
    },
    'vi_VN': {
      //login screen
      'login': 'Đăng nhập',
      'username': 'Tên đăng nhập',
      'password': 'Mật khẩu',
      'username_label': 'Nhập tên đăng nhập của bạn',
      'password_label': 'Nhập mật khẩu của bạn',
      'username_error': 'Tên đăng nhập không được để trống',
      'password_error': 'Mật khẩu không được để trống',
      'password_error_1': 'Mật khẩu phải có ít nhất 6 ký tự',
    },
  };
}
