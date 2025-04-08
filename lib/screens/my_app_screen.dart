import 'package:learning_system/utils/imports.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Pages.initialRoute,
      getPages: Pages.routes,
      debugShowCheckedModeBanner: true,
      defaultTransition: Transition.cupertino,
      locale: const Locale('vi', 'VN'),
      translations: Words(),
      transitionDuration: const Duration(milliseconds: 500),
      theme: ThemeData(
        useMaterial3: false,
        hintColor: AppColors.secondaryText,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.white,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontFamily: FontStyleTextStrings.regular),
          displayMedium: TextStyle(fontFamily: FontStyleTextStrings.regular),
          displaySmall: TextStyle(fontFamily: FontStyleTextStrings.regular),
          headlineMedium: TextStyle(fontFamily: FontStyleTextStrings.regular),
          headlineSmall: TextStyle(fontFamily: FontStyleTextStrings.regular),
          titleLarge: TextStyle(fontFamily: FontStyleTextStrings.medium),
          titleMedium: TextStyle(fontFamily: FontStyleTextStrings.regular),
          titleSmall: TextStyle(fontFamily: FontStyleTextStrings.medium),
          bodySmall: TextStyle(
            fontSize: 10,
            fontFamily: FontStyleTextStrings.regular,
          ),
          bodyLarge: TextStyle(
            fontSize: 13,
            fontFamily: FontStyleTextStrings.medium,
          ),
          bodyMedium: TextStyle(
            fontSize: 13,
            fontFamily: FontStyleTextStrings.light,
          ),
          labelLarge: TextStyle(fontFamily: FontStyleTextStrings.medium),
        ),
      ),
    );
  }
}
