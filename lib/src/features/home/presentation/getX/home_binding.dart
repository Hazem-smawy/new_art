import 'package:get/get.dart';
import 'package:newart/src/features/audio_player/presentation/getX/audio_player_controller.dart';
import 'package:newart/src/features/home/data/implements/implements.dart';
import 'package:newart/src/features/home/data/sources/home_remote_srouce.dart';
import 'package:newart/src/features/home/domain/repositories/repositories.dart';
import 'package:newart/src/features/home/domain/usecases/usecases.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AudioController(), fenix: true);

    Get.lazyPut(() => HomeRemoteSrouce(httpMethons: Get.find()));

    Get.lazyPut<HomeRepository>(
        () => HomeRepositoryImp(remoteSrouce: Get.find()));

    Get.lazyPut(() => FetchHomeUseCase(repository: Get.find()));
    Get.lazyPut(() => FetchPointsUseCase(repository: Get.find()));

    Get.lazyPut(
      () => HomeController(
        fetchHomeUseCase: Get.find(),
        fetchPointsUseCase: Get.find(),
      ),
    );
  }
}
