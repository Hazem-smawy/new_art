
  import 'package:get/get.dart'; 
  import 'user_controller.dart';

  class UserBinding implements Bindings {
    @override
    void dependencies() => Get.lazyPut(() => UserController());
  }
  