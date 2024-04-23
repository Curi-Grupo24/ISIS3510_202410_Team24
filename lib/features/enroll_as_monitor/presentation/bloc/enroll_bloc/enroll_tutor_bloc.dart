import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';
import '../../../../classes_list/data/models/class_model.dart';
import '../../../domain/usecases/enroll_tutor_usecase.dart';

part 'enroll_tutor_event.dart';
part 'enroll_tutor_state.dart';

class EnrollTutorBloc extends Bloc<EnrollTutorEvent, EnrollTutorState> {
  EnrollTutorBloc() : super(EnrollTutorInitial()) {
    on<EnroolToAClass>(
        (EnroolToAClass event, Emitter<EnrollTutorState> emit) async {
      emit(const EnrollTutorLoading());
      EnrollTutorUseCase usecase = sl<EnrollTutorUseCase>();
      await usecase(
              answersList: event.answersList,
              classToAdd: event.classToAdd,
              lastAnswer: event.lastAnswer,)
          .then((dynamic value) {
        value.fold(
          (String l) => emit(
            EnrollTutorError(
              errorMessage: l,
            ),
          ),
          (String r) {
            emit(
              EnrollTutorSuccessfull(
                successMessage: r,
              ),
            );
          },
        );
      });
    });
  }
}
