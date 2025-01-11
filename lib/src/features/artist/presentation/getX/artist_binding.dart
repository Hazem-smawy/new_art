
  import 'package:get/get.dart'; 
  import 'artist_controller.dart';

  class ArtistBinding implements Bindings {
    @override
    void dependencies() => Get.lazyPut(() => ArtistController());
  }
  