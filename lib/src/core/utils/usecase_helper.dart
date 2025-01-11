import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../error/error.dart';

typedef UseCaseFunction<T> = Future<Either<Failure, T>> Function();

Future<void> handleUsecase<T>({
  required UseCaseFunction<T> usecase,
  required Rx<T?> target,
  RxString? errorMessageTarget,
}) async {
  final result = await usecase();

  result.fold(
    (failure) {
      if (errorMessageTarget != null) {
        errorMessageTarget.value = failure.message;
      }
    },
    (data) {
      target.value = data;
    },
  );
}
