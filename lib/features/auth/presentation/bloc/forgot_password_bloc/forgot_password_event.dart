part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => <Object>[];
}

class ForgotPasswordSend extends ForgotPasswordEvent {
  const ForgotPasswordSend({
    required this.email,
  });

  final String email;
}
