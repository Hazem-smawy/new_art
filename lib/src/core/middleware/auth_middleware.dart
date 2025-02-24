// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newart/src/core/routes/app_pages.dart';
import 'package:newart/src/features/auth/presentation/getX/auth_controller.dart';

import '../services/shared_preferences.dart';

class AuthMiddleware extends GetMiddleware {
  MyServices myServices = Get.find();
  AuthController authController = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (authController.currentUser.value == null) {
      return const RouteSettings(name: Routes.AUTH);
    }
    return null;
  }
}
