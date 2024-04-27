import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.errorMessage);
  final String errorMessage;

  @override
  List<Object> get props => <Object>[errorMessage];
}

class NetworkFailure extends Failure {
  const NetworkFailure()
      : super('Error de conexión, asegurate de estar conectado a internet.');
}

class CacheFailure extends Failure {
  const CacheFailure() : super('CacheFailure');
}
