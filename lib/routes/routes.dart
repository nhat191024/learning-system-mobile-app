part of 'pages.dart';

abstract class Routes {
  Routes._();

  static const loginScreen = _Paths.loginScreen;
  static const bottomNav = _Paths.bottomNav;
  static const classListScreen = _Paths.classListScreen;
  static const classDetailScreen = _Paths.classDetailScreen;
  static const courseListScreen = _Paths.courseListScreen;
  static const doAssignment = _Paths.doAssignment;
}

abstract class _Paths {
  static const loginScreen = '/login-screen';
  static const bottomNav = '/bottom-nav';
  static const classListScreen = '/class-list-screen';
  static const classDetailScreen = '/class-detail-screen';
  static const courseListScreen = '/course-list-screen';
  static const doAssignment = '/do-assignment';
}