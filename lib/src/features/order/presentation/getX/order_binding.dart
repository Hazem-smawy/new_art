import 'package:get/get.dart';
import 'package:newart/src/features/audio_player/presentation/getX/audio_player_controller.dart';
import 'package:newart/src/features/order/data/implements/implements.dart';
import 'package:newart/src/features/order/data/sources/sources.dart';
import 'package:newart/src/features/order/domain/repositories/repositories.dart';
import 'package:newart/src/features/order/domain/usecases/usecases.dart';
import 'package:newart/src/features/order/presentation/getX/file_picker_controller.dart';
import 'package:newart/src/features/order/presentation/getX/record_controller.dart';
import 'order_controller.dart';

class OrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecordController());
    Get.lazyPut(() => AudioController());
    Get.lazyPut(() => FilePickerController());
    Get.lazyPut(() => OrderRemoteDataSource(httpMethons: Get.find()));
    Get.lazyPut<OrderRepository>(
        () => OrderRepositoryImp(remoteDataSource: Get.find()));

    Get.lazyPut(() => FetchAllOrderTypesUseCase(orderRepository: Get.find()));
    Get.lazyPut(() => AddNewOrderUseCase(orderRepository: Get.find()));
    Get.lazyPut(() => FetchAllOrderUseCase(orderRepository: Get.find()));
    Get.lazyPut(
        () => GetOrderPaymentDetailsUseCase(orderRepository: Get.find()));
    Get.lazyPut(() => PostTranserUserCase(orderRepository: Get.find()));
    Get.lazyPut(() => OrderController(
          fetchAllOrderTypesUseCase: Get.find(),
          addNewOrderUseCase: Get.find(),
          fetchAllOrderUseCase: Get.find(),
          getOrderPaymentDetailsUseCase: Get.find(),
          postTranserUserCase: Get.find(),
        ));
  }
}
