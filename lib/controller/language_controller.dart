import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../service/settings_service.dart';

class LanguageController extends GetxController {
  late GetStorage _box;

  @override
  void onInit() {
    super.onInit();
    _box = GetStorage();

  }

  void updateLocale(value) async {
    var languageCode ='';
    if (value.contains('_')) {

      languageCode =  value.substring(0, value.indexOf('_'));
      // en_US
   //   Get.updateLocale(Locale(value.split('_').elementAt(0), value.split('_').elementAt(1)));
    } else {
      languageCode = value;
      // en
    //  Get.updateLocale(Locale(value));
    }
    Get.updateLocale(Locale(languageCode.trim()));
    await GetStorage().write('language', languageCode);
    Get.rootController.setTheme(Get.find<SettingsService>().getLightTheme());
   Get.forceAppUpdate();
  }
}
