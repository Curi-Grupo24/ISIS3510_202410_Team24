part of 'schedule_register_bloc.dart';

sealed class ScheduleRegisterState extends Equatable {
  const ScheduleRegisterState();

  @override
  List<Object> get props => <Object>[];
}

final class ScheduleRegisterInitial extends ScheduleRegisterState {}

class RegisterEventError extends ScheduleRegisterState {
  const RegisterEventError({required this.errorMessage});
  final String errorMessage;
}

class RegisterEventSuccessfull extends ScheduleRegisterState {
  const RegisterEventSuccessfull({
    required this.successMessage,
  });
  final String successMessage;
}

class RegisterEventLoading extends ScheduleRegisterState {
  const RegisterEventLoading();
}
