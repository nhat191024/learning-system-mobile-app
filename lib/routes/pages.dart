import 'package:learning_system/utils/imports.dart';

part 'routes.dart';

class Pages {
  Pages._();

  static const initialRoute = Routes.loginScreen;

  static final routes = [
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
  ];
}
