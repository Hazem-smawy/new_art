// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:newart/src/core/utils/usecase_helper.dart';

import 'package:newart/src/features/product/data/models/all_products_model.dart';
import 'package:newart/src/features/product/domain/usecases/usecases.dart';

import '../../../../core/types/status_types.dart';
import '../../../audio_player/presentation/getX/audio_player_controller.dart';

class ProductController extends GetxController {
  Rx<Status> allProductStatus = Status.initial.obs;

  FetchAllProcutUseCase fetchAllProcutUseCase;
  final allProducts = Rx<AllProductsModel?>(null);
  final errorMessage = ''.obs;

  final AudioController audioController = Get.find();

  ProductController({
    required this.fetchAllProcutUseCase,
  });

  @override
  void onInit() {
    super.onInit();
    fetchAllProduct();
  }

  Future<void> fetchAllProduct() async {
    // Set initial status to loading.
    allProductStatus.value = Status.loading;

    try {
      // Attempt to fetch all products via the use case.
      await handleUsecase(
        usecase: fetchAllProcutUseCase.call,
        target: allProducts,
        errorMessageTarget: errorMessage,
      );

      // Safely update the audio list.
      audioController.audioList.value = allProducts.value?.data ?? [];
      if (allProducts.value != null && allProducts.value!.data.isNotEmpty) {
        allProductStatus.value = Status.success;
        audioController.setSession(null, allProducts.value?.data);
      } else if (allProducts.value != null && allProducts.value!.data.isEmpty) {
        allProductStatus.value = Status.initial;
      } else {
        allProductStatus.value = Status.error;
      }
    } catch (e) {
      // Handle any exceptions and update error state.
      allProductStatus.value = Status.error;
      errorMessage.value = e.toString();
    }
  }
}
