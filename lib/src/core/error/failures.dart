import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String? message;

  Failure({this.message});
}

class OfflineFailure extends Failure {
  OfflineFailure({super.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure({super.message});
  @override
  List<Object?> get props => [message];
}

class NeedLoginFailures extends Failure {
  NeedLoginFailures({super.message});
  @override
  List<Object?> get props => [message];
}

class LocalStorageFailures extends Failure {
  LocalStorageFailures({super.message});

  @override
  List<Object?> get props => [message];
}

class FirebaseFailures extends Failure {
  FirebaseFailures({super.message});

  @override
  List<Object?> get props => [message];
}

class GoogleAuthFailures extends Failure {
  GoogleAuthFailures({super.message});

  @override
  List<Object?> get props => [message];
}
