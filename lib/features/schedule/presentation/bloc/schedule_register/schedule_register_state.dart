part of 'schedule_register_bloc.dart';

sealed class ScheduleRegisterState extends Equatable {
  const ScheduleRegisterState();
  
  @override
  List<Object> get props => [];
}

final class ScheduleRegisterInitial extends ScheduleRegisterState {}
