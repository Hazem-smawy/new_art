import 'package:get/get.dart';
import 'package:newart/src/features/bunch/data/implements/implements.dart';
import 'package:newart/src/features/bunch/data/sources/sources.dart';
import 'package:newart/src/features/bunch/domain/repositories/repositories.dart';
import 'package:newart/src/features/bunch/domain/usecases/usecases.dart';
import 'package:newart/src/features/bunch/presentation/getX/bunch_controller.dart';

class BunchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BunchRemoteDataSource(httpMethons: Get.find()));

    Get.lazyPut<BunchRepository>(
        () => BunchRepositoryImp(remoteDataSource: Get.find()));

    Get.lazyPut(() => FetchBunchUseCase(bunchRepository: Get.find()));
    Get.lazyPut(() => BunchController(fetchBunchUseCase: Get.find()));
  }
}
