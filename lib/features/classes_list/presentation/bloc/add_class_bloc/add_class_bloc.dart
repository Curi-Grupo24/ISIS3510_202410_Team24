import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';
import '../../../data/models/class_model.dart';
import '../../../domain/usecases/add_class_usecase.dart';

part 'add_class_event.dart';
part 'add_class_state.dart';

class AddClassBloc extends Bloc<AddClassEvent, AddClassState> {
  AddClassBloc() : super(AddClassInitial()) {
    on<AddAClass>((AddAClass event, Emitter<AddClassState> emit) async{
       emit(const AddSubjectLoading());
       AddClassUseCase usecase = sl<AddClassUseCase>();
       await usecase(classToAdd: event.classToAdd).then((dynamic value) {
        value.fold(
          (String l) => emit(
            AddSubjectError(
              errorMessage: l,
            ),
          ),
          (String r) {
            emit(
              AddSubjectSuccessfull(
                successMessage: r,
              ),
            );
          },
        );
      });

       
    });
  }
}
