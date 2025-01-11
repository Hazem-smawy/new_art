
  import 'package:get/get.dart'; 
  import 'banks_controller.dart';

  class BanksBinding implements Bindings {
    @override
    void dependencies() => Get.lazyPut(() => BanksController());
  }
  