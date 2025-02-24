// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:newart/src/core/utils/usecase_helper.dart';
import 'package:newart/src/features/exclusive/data/models/all_exclusive_model.dart';
import 'package:newart/src/features/exclusive/domain/usecases/usecases.dart';

import '../../../../core/types/status_types.dart';

class ExclusiveController extends GetxController {
  Rx<Status> exclusiveStatus = Status.initial.obs;

  FetchAllExclusiveUseCase fetchAllExclusiveUseCase;
  final allExclusive = Rx<AllExclusiveModel?>(null);
  final errorMessage = ''.obs;

  ExclusiveController({
    required this.fetchAllExclusiveUseCase,
  });

  @override
  void onInit() {
    super.onInit();
    fetchAllExclusive();
  }

  Future<void> fetchAllExclusive() async {
    // Set initial status to loading.
    exclusiveStatus.value = Status.loading;

    try {
      // Attempt to fetch all products via the use case.
      await handleUsecase(
        usecase: fetchAllExclusiveUseCase.call,
        target: allExclusive,
        errorMessageTarget: errorMessage,
      );

      // Safely update the audio list.

      if (allExclusive.value != null && allExclusive.value!.data.isNotEmpty) {
        exclusiveStatus.value = Status.success;
      } else if (allExclusive.value != null &&
          allExclusive.value!.data.isEmpty) {
        exclusiveStatus.value = Status.initial;
      } else {
        exclusiveStatus.value = Status.error;
      }
    } catch (e) {
      // Handle any exceptions and update error state.
      exclusiveStatus.value = Status.error;
      errorMessage.value = e.toString();
    }
  }
}
