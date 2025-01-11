// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_art/src/core/routes/app_pages.dart';

import '../constants/share_pref_keys.dart';
import '../services/shared_preferences.dart';

class AuthMiddleware extends GetMiddleware {
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString(SharedPrefKeys.USERID_KEY) !=
        null) {
      return const RouteSettings(name: Routes.BOTTOMNAVIGATIONBAR);
    }
    return null;
  }
}
