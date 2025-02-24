import 'package:get/get.dart';
import 'package:newart/src/features/banks/data/implements/implements.dart';
import 'package:newart/src/features/banks/data/sources/sources.dart';
import 'package:newart/src/features/banks/domain/repositories/repositories.dart';
import 'package:newart/src/features/banks/domain/usecases/usecases.dart';
import 'package:newart/src/features/banks/presentation/getX/banks_controller.dart';

class BanksBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BanksRemoteDataSource(httpMethons: Get.find()));

    Get.lazyPut<BanksRepository>(
        () => BanksRepositoryImp(remoteDataSource: Get.find()));

    Get.lazyPut(() => FetchBanksUseCase(banksRepository: Get.find()));
    Get.lazyPut(() => BanksController(fetchBanksUseCase: Get.find()));
  }
}
