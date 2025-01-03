import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/l10n/app_translations.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: backgroundClr,
      statusBarColor: backgroundClr,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: Locale(Get.deviceLocale?.languageCode == 'ar' ? 'ar' : 'en'),
      theme: Themes.dark,
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.homeScreen,
    );
  }
}
