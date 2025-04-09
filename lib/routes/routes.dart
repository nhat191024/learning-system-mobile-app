part of 'pages.dart';

abstract class Routes {
  Routes._();

  static const loginScreen = _Paths.loginScreen;
  static const bottomNav = _Paths.bottomNav;
  static const classListScreen = _Paths.classListScreen;
}

abstract class _Paths {
  static const loginScreen = '/login-screen';
  static const bottomNav = '/bottom-nav';
  static const classListScreen = '/class-list-screen';
}