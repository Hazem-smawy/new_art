import 'package:get/get.dart';
import 'package:newart/src/features/product/data/implements/implements.dart';
import 'package:newart/src/features/product/data/sources/sources.dart';
import 'package:newart/src/features/product/domain/repositories/repositories.dart';
import 'package:newart/src/features/product/domain/usecases/usecases.dart';
import 'product_controller.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductRemoteDataSource(httpMethons: Get.find()));

    Get.lazyPut<ProductRepository>(
        () => ProductRepositoryImp(remoteSrouce: Get.find()));

    Get.lazyPut(() => FetchAllProcutUseCase(repository: Get.find()));
    Get.lazyPut(() => ProductController(fetchAllProcutUseCase: Get.find()));
  }
}
