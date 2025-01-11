
  import 'package:get/get.dart'; 
  import 'new_work_controller.dart';

  class NewWorkBinding implements Bindings {
    @override
    void dependencies() => Get.lazyPut(() => NewWorkController());
  }
  