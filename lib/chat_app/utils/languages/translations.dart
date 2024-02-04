import 'package:get/get.dart';

import 'kr.dart';
import 'en.dart';

class AppLanguage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': en,
    'kr': kr,
  };
}
