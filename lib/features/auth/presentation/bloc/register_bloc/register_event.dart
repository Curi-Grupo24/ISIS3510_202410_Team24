part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => <Object>[];
}

class RegisterAccount extends RegisterEvent {
  const RegisterAccount({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
