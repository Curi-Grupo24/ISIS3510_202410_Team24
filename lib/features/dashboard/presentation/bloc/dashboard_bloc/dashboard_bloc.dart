import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';
import '../../../domain/usecases/get_user_info.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<GetUserInfo>((DashboardEvent event, Emitter<DashboardState> emit) async {
      //
      emit(const DashboardLoading());
      GetUserInfoUseCase usecase = sl<GetUserInfoUseCase>();
      await usecase().then((dynamic value) {
        value.fold(
          (String l) => emit(
            DashboardError(
              errorMessage: l,
            ),
          ),
          (String r) {
            emit(DashboardSuccessfull(name: r));
          },
        );
      });
    });
  }
}
