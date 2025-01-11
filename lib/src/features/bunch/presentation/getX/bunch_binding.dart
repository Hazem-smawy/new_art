
  import 'package:get/get.dart'; 
  import 'bunch_controller.dart';

  class BunchBinding implements Bindings {
    @override
    void dependencies() => Get.lazyPut(() => BunchController());
  }
  