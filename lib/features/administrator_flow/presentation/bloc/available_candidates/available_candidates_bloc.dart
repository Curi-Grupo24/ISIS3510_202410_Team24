import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';
import '../../../domain/usecases/get_available_candidates_usecase.dart';

part 'available_candidates_event.dart';
part 'available_candidates_state.dart';

class AvailableCandidatesBloc
    extends Bloc<AvailableCandidatesEvent, AvailableCandidatesState> {
  AvailableCandidatesBloc() : super(AvailableCandidatesInitial()) {
    on<GetCandidates>((
      GetCandidates event,
      Emitter<AvailableCandidatesState> emit,
    ) async {
      emit(const AvailableCandidatesLoading());
      GetAvailableCandidatesUseCase usecase =
          sl<GetAvailableCandidatesUseCase>();
      await usecase().then((dynamic value) {
        value.fold(
          (String l) => emit(
            AvailableCandidatesError(
              errorMessage: l,
            ),
          ),
          (List<Map<String, dynamic>> r) {
            emit(
              AvailableCandidatesSuccessfull(
                successMessage: 'Todos los candidatos',
                candidatesTotal: r,
              ),
            );
          },
        );
      });
      // poner el get jajaja
    });
  }
}
