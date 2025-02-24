// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:newart/src/core/utils/usecase_helper.dart';
import 'package:newart/src/features/home/data/models/home_model.dart';
import 'package:newart/src/features/home/data/models/points_model.dart';

import 'package:newart/src/features/home/domain/usecases/usecases.dart';

import '../../../../core/types/status_types.dart';

class HomeController extends GetxController {
  Rx<Status> homeStatus = Status.initial.obs;

  final isOpenForexclusive = false.obs;

  FetchHomeUseCase fetchHomeUseCase;
  FetchPointsUseCase fetchPointsUseCase;
  final homeData = Rx<HomeModel?>(null);
  final points = Rx<PointsModel>(PointsModel(points: 0, status: ''));
  final errorMessage = ''.obs;

  HomeController({
    required this.fetchHomeUseCase,
    required this.fetchPointsUseCase,
  });

  @override
  void onInit() {
    super.onInit();
    fetchHomeData();
  }

  Future<void> fetchHomeData() async {
    homeStatus.value = Status.loading;
    await handleUsecase(
      usecase: fetchHomeUseCase.call,
      target: homeData,
      errorMessageTarget: errorMessage,
    );
    await fetchPoints();
    homeStatus.value = homeData.value != null ? Status.success : Status.error;
  }

  Future<void> fetchPoints() async {
    await handleUsecase(
      usecase: fetchPointsUseCase.call,
      target: points,
      errorMessageTarget: errorMessage,
    );
  }
}
