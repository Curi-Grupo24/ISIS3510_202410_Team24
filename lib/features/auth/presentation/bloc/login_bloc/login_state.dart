part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class LoginInitial extends LoginState {}

class LoginError extends LoginState {
  const LoginError({required this.errorMessage});
  final String errorMessage;
}

class LoginSuccessfull extends LoginState {
  const LoginSuccessfull({
    required this.user,
  });
  final UserModel user;
}

class LoginLoading extends LoginState {
  const LoginLoading();
}
