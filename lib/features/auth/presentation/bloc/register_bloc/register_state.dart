part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class RegisterInitial extends RegisterState {}

class RegisterError extends RegisterState {
  const RegisterError({required this.errorMessage});
  final String errorMessage;
}

class RegisterSuccessfull extends RegisterState {
  const RegisterSuccessfull({
    required this.user,
  });
  final User? user;
}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
}
