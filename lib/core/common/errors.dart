import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? cause;

  const Failure([this.cause]);

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure([String? cause]) : super(cause);
}

class FailureImpl extends Failure {
  const FailureImpl([String? cause]) : super(cause);
}
