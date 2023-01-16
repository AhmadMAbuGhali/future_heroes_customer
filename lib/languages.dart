import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'ar_SA': {
      'greeting': 'مرحبا',
    },

    'en_US': {
      'greeting': 'Hello',
    },
  };
}