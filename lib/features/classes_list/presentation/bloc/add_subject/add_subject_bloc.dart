import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';
import '../../../data/models/class_model.dart';
import '../../../domain/usecases/fetch_all_classes_usecase.dart';

part 'add_subject_event.dart';
part 'add_subject_state.dart';

class AddSubjectBloc extends Bloc<AddSubjectEvent, AddSubjectState> {
  AddSubjectBloc() : super(AddSubjectInitial()) {
    on<FetchAllClases>(
        (AddSubjectEvent event, Emitter<AddSubjectState> emit) async {
      emit(const AddSubjectLoading());
      FetchAllClassesUseCase usecase = sl<FetchAllClassesUseCase>();

      await usecase().then((dynamic value) {
        value.fold(
          (String l) => emit(
            AddSubjectError(
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
