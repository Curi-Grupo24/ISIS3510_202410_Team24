import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';
import '../../../data/models/class_model.dart';
import '../../../domain/usecases/fetch_all_classes_usecase.dart';

part 'fetch_subject_event.dart';
part 'fetch_subject_state.dart';

class FetchSubjectBloc extends Bloc<FetchSubjectEvent, FetchSubjectState> {
  FetchSubjectBloc() : super(FetchClassInitial()) {
    on<FetchAllClases>(
        (FetchSubjectEvent event, Emitter<FetchSubjectState> emit) async {
      emit(const FetchClassLoading());
      FetchAllClassesUseCase usecase = sl<FetchAllClassesUseCase>();

      await usecase().then((dynamic value) {
        value.fold(
          (String l) => emit(
            FetchClassError(
              errorMessage: l,
            ),
          ),
          (List<ClassModel> r) {
            emit(
              FetchAllClasesSuccessful(
                classesList: r,
              ),
            );
          },
        );
      });
    });
  }
}
