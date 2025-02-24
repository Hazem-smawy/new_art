import 'package:get/get.dart';
import 'package:newart/src/features/exclusive/data/implements/implements.dart';
import 'package:newart/src/features/exclusive/data/sources/sources.dart';
import 'package:newart/src/features/exclusive/domain/repositories/repositories.dart';
import 'package:newart/src/features/exclusive/domain/usecases/usecases.dart';
import 'package:newart/src/features/exclusive/presentation/getX/exclusive_controller.dart';

class ExclusiveBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExclusiveRemoteDataSource(httpMethons: Get.find()));

    Get.lazyPut<ExclusiveRepository>(
        () => ExclusiveRepositoryImp(remoteDataSource: Get.find()));

    Get.lazyPut(() => FetchAllExclusiveUseCase(repository: Get.find()));
    Get.lazyPut(
        () => ExclusiveController(fetchAllExclusiveUseCase: Get.find()));
  }
}
