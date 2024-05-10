import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'available_candidates_event.dart';
part 'available_candidates_state.dart';

class AvailableCandidatesBloc
    extends Bloc<AvailableCandidatesEvent, AvailableCandidatesState> {
  AvailableCandidatesBloc() : super(AvailableCandidatesInitial()) {
    on<GetCandidates>((
      GetCandidates event,
      Emitter<AvailableCandidatesState> emit,
    ) {
      emit(const AvailableCandidatesLoading());
      // poner el get jajaja
    });
  }
}
