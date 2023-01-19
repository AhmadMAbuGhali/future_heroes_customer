import 'package:get/get.dart';

class MyLocale extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "ar":{
      "login":"تسجيل الدخول",
      "changeDisplayLang":"تغيير لغة العرض "
    },
    "en":{
      "login":"Login",
      "changeDisplayLang":"Change Display Language"
    }
  };
}