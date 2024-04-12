part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
  
  @override
  List<Object> get props => <Object>[];
}

final class ForgotPasswordInitial extends ForgotPasswordState {}


class ForgotPasswordError extends ForgotPasswordState {
  const ForgotPasswordError({required this.errorMessage});
  final String errorMessage;
}

class ForgotPasswordSuccessfull extends ForgotPasswordState {
  const ForgotPasswordSuccessfull({
    required this.message,
  });
  final String? message;
}

class ForgotPasswordLoading extends ForgotPasswordState {
  const ForgotPasswordLoading();
}
