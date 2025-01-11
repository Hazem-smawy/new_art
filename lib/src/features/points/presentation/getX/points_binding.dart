
  import 'package:get/get.dart'; 
  import 'points_controller.dart';

  class PointsBinding implements Bindings {
    @override
    void dependencies() => Get.lazyPut(() => PointsController());
  }
  