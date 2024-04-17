import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';
import '../../../data/models/class_model.dart';
import '../../../domain/usecases/delete_class_usecase.dart';

part 'delete_class_event.dart';
part 'delete_class_state.dart';

class DeleteClassBloc extends Bloc<DeleteClassEvent, DeleteClassState> {
  DeleteClassBloc() : super(DeleteClassInitial()) {
    on<DeleteAClass>((DeleteAClass event, Emitter<DeleteClassState> emit)async {
      emit(const DeleteClassLoading());
       DeleteClassUseCase usecase = sl<DeleteClassUseCase>();
       await usecase(classToDelete: event.classToDelete).then((dynamic value) {
        value.fold(
          (String l) => emit(
            DeleteClassError(
              errorMessage: l,
            ),
          ),
          (String r) {
            emit(
              DeleteClassSuccessfull(
                successMessage: r,
              ),
            );
          },
        );
      });
    });
  }
}
