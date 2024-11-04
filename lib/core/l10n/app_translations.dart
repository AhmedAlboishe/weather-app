import 'package:get/get.dart';

import 'translations/ar.dart';
import 'translations/en.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'ar': ar};
}
