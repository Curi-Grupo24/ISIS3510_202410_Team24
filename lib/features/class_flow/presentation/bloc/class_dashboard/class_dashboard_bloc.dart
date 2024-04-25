import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../../domain/usecases/get_dashboard_class_info.dart';

part 'class_dashboard_event.dart';
part 'class_dashboard_state.dart';

class ClassDashboardBloc
    extends Bloc<ClassDashboardEvent, ClassDashboardState> {
  ClassDashboardBloc() : super(ClassDashboardInitial()) {
    on<GetDashboardClassInitial>((
      GetDashboardClassInitial event,
      Emitter<ClassDashboardState> emit,
    ) async {
      emit(const GetDashboardLoading());
      FetchDashbaordClassInfoUseCase usecase =
          sl<FetchDashbaordClassInfoUseCase>();
      await usecase(tutorsIdsList: event.availableTutors).then((dynamic value) {
        value.fold(
          (String l) => emit(
            GetDashboardError(
              errorMessage: l,
            ),
          ),
          (List<UserModel> r) {
            emit(
              GetDashboardInfoSuccessful(
                tutorsList: r,
              ),
            );
          },
        );
      });
    });
  }
}
