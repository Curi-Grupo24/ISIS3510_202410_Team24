import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'schedule_register_event.dart';
part 'schedule_register_state.dart';

class ScheduleRegisterBloc extends Bloc<ScheduleRegisterEvent, ScheduleRegisterState> {
  ScheduleRegisterBloc() : super(ScheduleRegisterInitial()) {
    on<ScheduleRegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
