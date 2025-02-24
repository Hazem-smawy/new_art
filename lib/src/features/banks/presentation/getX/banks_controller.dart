// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:newart/src/core/utils/usecase_helper.dart';
import 'package:newart/src/features/banks/data/models/bank_model.dart';
import 'package:newart/src/features/banks/domain/usecases/usecases.dart';


import '../../../../core/types/status_types.dart';

class BanksController extends GetxController {
  Rx<Status> banksStatus = Status.initial.obs;

  final isOpenForexclusive = false.obs;

  FetchBanksUseCase fetchBanksUseCase;
  final banksData = Rx<AllBanksModel?>(null);
  final errorMessage = ''.obs;

  BanksController({
    required this.fetchBanksUseCase,
  });

  @override
  void onInit() {
    super.onInit();
    fetchAllBanks();
  }

  Future<void> fetchAllBanks() async {
    banksStatus.value = Status.loading;
    await handleUsecase(
      usecase: fetchBanksUseCase.call,
      target: banksData,
      errorMessageTarget: errorMessage,
    );
    banksStatus.value = banksData.value != null ? Status.success : Status.error;
  }
}
