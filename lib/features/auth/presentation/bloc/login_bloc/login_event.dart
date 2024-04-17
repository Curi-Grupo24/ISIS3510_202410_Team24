part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => <Object>[];
}

class LoginAccount extends LoginEvent {
  const LoginAccount({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
