import 'package:dartz/dartz.dart';
import 'package:newart/src/core/error/failures.dart';

abstract class ParamsUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class NoParamUseCase<Type> {
  Future<Either<Failure, Type>> call();
}

class Params<T> {
  final T data;
  const Params(this.data);
}

class NoParams {
  const NoParams();
}
