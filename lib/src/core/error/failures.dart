import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});
}

class OfflineFailures extends Failure {
  const OfflineFailures({required super.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailures extends Failure {
  const ServerFailures({required super.message});
  @override
  List<Object?> get props => [message];
}
class NeedLoginFailures extends Failure {
  const NeedLoginFailures({required super.message});
  @override
  List<Object?> get props => [message];
}

class LocalStorageFailures extends Failure {
  const LocalStorageFailures({required super.message});

  @override
  List<Object?> get props => [message];
}
