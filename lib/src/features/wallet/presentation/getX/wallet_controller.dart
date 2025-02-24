import 'package:get/get.dart';
import 'package:newart/src/core/types/status_types.dart';
import 'package:newart/src/features/wallet/data/models/all_payment_model.dart';
import 'package:newart/src/features/wallet/domain/usecases/usecases.dart';

import '../../../../core/utils/usecase_helper.dart';

class WalletController extends GetxController {
  FetchAllPaymentUseCase fetchAllPaymentUseCase;
  Rx<Status> allPaymentStatus = Status.initial.obs;
  final errorMessage = ''.obs;

  final allPayments = Rx<AllPaymentsModel?>(null);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAllPayments();
  }

  WalletController({required this.fetchAllPaymentUseCase});

  Future<void> fetchAllPayments() async {
    allPaymentStatus.value = Status.loading;
    await handleUsecase(
      usecase: fetchAllPaymentUseCase.call,
      target: allPayments,
      errorMessageTarget: errorMessage,
    );
    allPaymentStatus.value =
        allPayments.value != null ? Status.success : Status.error;
  }
}
