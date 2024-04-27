import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';
import '../../../data/models/tutor_model.dart';
import '../../../domain/usecases/save_tutor_favs.dart';

part 'fav_tutors_event.dart';
part 'fav_tutors_state.dart';

class FavTutorsBloc extends Bloc<FavTutorsEvent, FavTutorsState> {
  FavTutorsBloc() : super(FavTutorsInitial()) {
    on<SaveTutorToFavs>(
        (SaveTutorToFavs event, Emitter<FavTutorsState> emit) async {
      emit(const SaveTutorFavsLoading());
      AddTutorToFavsUseCase usecase = sl<AddTutorToFavsUseCase>();
      await usecase(tutorsToAdd: event.tutorToSave).then((dynamic value) {
        value.fold(
          (String l) => emit(
            SaveTutorFavsError(
              errorMessage: l,
            ),
          ),
          (String r) {
            emit(
              SaveTutorFavsInfoSuccessful(
                successMessage: r,
              ),
            );
          },
        );
      });
    });
  }
}
