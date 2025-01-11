import 'package:get/get.dart';

import '../services/shared_preferences.dart';

String getToken(String retTo) {
  MyServices myServices = Get.find();

  if (retTo == '0') {
    if (myServices.sharedPreferences.getString("step") == "2") {
      String token = myServices.sharedPreferences.getString("token").toString();
      return token;
    }
  } else if (retTo == '1') {
    myServices.sharedPreferences.clear();
    //myServices.sharedPreferences.setString("priceuser", "0");
    // log('delet is done');
  }
  return '';
}
