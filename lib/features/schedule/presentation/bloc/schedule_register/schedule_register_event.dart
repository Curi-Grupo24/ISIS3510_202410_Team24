part of 'schedule_register_bloc.dart';

sealed class ScheduleRegisterEvent extends Equatable {
  const ScheduleRegisterEvent();

  @override
  List<Object> get props => <Object>[];
}

class RegisterEvent extends ScheduleRegisterEvent {
  const RegisterEvent({
    required this.eventToAdd,
  });
  final Map<String, dynamic> eventToAdd;
}
