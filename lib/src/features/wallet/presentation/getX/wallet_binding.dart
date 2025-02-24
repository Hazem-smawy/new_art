import 'package:get/get.dart';
import 'package:newart/src/features/wallet/data/implements/implements.dart';
import 'package:newart/src/features/wallet/data/sources/sources.dart';
import 'package:newart/src/features/wallet/domain/repositories/repositories.dart';
import 'package:newart/src/features/wallet/domain/usecases/usecases.dart';
import 'wallet_controller.dart';

class WalletBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalletRemoteDataSource(httpMethons: Get.find()));

    Get.lazyPut<WalletRepository>(
        () => WalletRepositoryImp(remoteDataSource: Get.find()));

    Get.lazyPut(() => FetchAllPaymentUseCase(repository: Get.find()));
    Get.lazyPut(() => WalletController(fetchAllPaymentUseCase: Get.find()));
  }
}
