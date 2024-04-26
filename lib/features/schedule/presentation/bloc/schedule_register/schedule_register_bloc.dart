import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';
import '../../../domain/usecases/register_event_usecase.dart';

part 'schedule_register_event.dart';
part 'schedule_register_state.dart';

class ScheduleRegisterBloc
    extends Bloc<ScheduleRegisterEvent, ScheduleRegisterState> {
  ScheduleRegisterBloc() : super(ScheduleRegisterInitial()) {
    on<RegisterEvent>((
      RegisterEvent event,
      Emitter<ScheduleRegisterState> emit,
    ) async {
      emit(const RegisterEventLoading());
      RegisterEventUseCase usecase = sl<RegisterEventUseCase>();
      await usecase(classToAdd: event.eventToAdd).then((dynamic value) {
        value.fold(
          (String l) => emit(
            RegisterEventError(
              errorMessage: l,
            ),
          ),
          (String r) {
            emit(
              RegisterEventSuccessfull(
                successMessage: r,
              ),
            );
          },
        );
      });
    });
  }
}
