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
    required this.name,
    required this.phone,
    required this.career,
    required this.studentCode,
  });

  final String email;
  final String password;
  final String name;
  final String phone;
  final String career;
  final String studentCode;
}
