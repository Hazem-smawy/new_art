import 'package:get/get.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:newart/src/core/utils/usecase_helper.dart';
import 'package:newart/src/features/bunch/data/models/bunch_model.dart';
import 'package:newart/src/features/bunch/domain/usecases/usecases.dart';

import '../../../../core/types/status_types.dart';

class BunchController extends GetxController {
  Rx<Status> bunchStatus = Status.initial.obs;

  FetchBunchUseCase fetchBunchUseCase;
  final bunchData = Rx<BunchModel?>(null);
  final errorMessage = ''.obs;

  BunchController({
    required this.fetchBunchUseCase,
  });

  @override
  void onInit() {
    super.onInit();
    fetchBunchData();
  }

  Future<void> fetchBunchData() async {
    bunchStatus.value = Status.loading;
    await handleUsecase(
      usecase: fetchBunchUseCase.call,
      target: bunchData,
      errorMessageTarget: errorMessage,
    );
    bunchStatus.value = bunchData.value != null ? Status.success : Status.error;
  }
}
