// import 'package:dartz/dartz.dart';
// import 'package:new_art/src/core/error/failures.dart';

// abstract class ParamsUseCase<Type, Params> {
//   Future<Either<Failure, Type>> call(Params params);
// }

// abstract class NoParamUseCase<Type> {
//   Future<Either<Failure, Type>> call();
// }

// class Params<T> {
//   final T data;
//   const Params(this.data);
// }

// class NoParams {
//   final void data;
//   NoParams(this.data);
// }
import 'package:dartz/dartz.dart';
import 'package:new_art/src/core/error/failures.dart';

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
  const NoParams(); // No data field, just an empty constructor
}
