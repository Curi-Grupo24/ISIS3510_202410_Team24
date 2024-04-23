import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';
import '../../../../classes_list/data/models/class_model.dart';
import '../../../domain/usecases/get_my_classes.dart';

part 'my_classes_event.dart';
part 'my_classes_state.dart';

class MyClassesBloc extends Bloc<MyClassesEvent, MyClassesState> {
  MyClassesBloc() : super(MyClassesInitial()) {
    on<GetMyClasses>((GetMyClasses event, Emitter<MyClassesState> emit)async {
      emit(const GetMyClassesLoading());
      GetMyClassesUseCase usecase = sl<GetMyClassesUseCase>();
      await usecase().then((dynamic value) {
        value.fold(
          (String l) => emit(
            GetMyClassesError(
              errorMessage: l,
            ),
          ),
          (List<ClassModel> r) {
            emit(
              GetMyClassesSuccessfull(
                listClasses: r,
              ),
            );
          },
        );
      });
    });
  }
}
