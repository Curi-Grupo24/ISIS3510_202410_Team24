import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';
import '../../../../classes_list/data/models/class_model.dart';
import '../../../domain/usecases/get_my_tutor_classes.dart';

part 'my_tutor_classes_event.dart';
part 'my_tutor_classes_state.dart';

class MyTutorClassesBloc
    extends Bloc<MyTutorClassesEvent, MyTutorClassesState> {
  MyTutorClassesBloc() : super(MyTutorClassesInitial()) {
    on<GetMyTutorClasses>(
        (GetMyTutorClasses event, Emitter<MyTutorClassesState> emit) async {
      emit(const GetMyTutorClassesLoading());
      GetMyTutorClassesUseCase usecase = sl<GetMyTutorClassesUseCase>();
      await usecase().then((dynamic value) {
        value.fold(
          (String l) => emit(
            GetMyTutorClassesError(
              errorMessage: l,
            ),
          ),
          (List<ClassModel> r) {
            emit(
              GetMyTutorClassesSuccessfull(
                listClasses: r,
              ),
            );
          },
        );
      });
    });
  }
}
