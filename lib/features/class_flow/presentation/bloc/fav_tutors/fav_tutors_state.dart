part of 'fav_tutors_bloc.dart';

sealed class FavTutorsState extends Equatable {
  const FavTutorsState();

  @override
  List<Object> get props => <Object>[];
}

final class FavTutorsInitial extends FavTutorsState {}

class SaveTutorFavsError extends FavTutorsState {
  const SaveTutorFavsError({required this.errorMessage});
  final String errorMessage;
}

class SaveTutorFavsInfoSuccessful extends FavTutorsState {
  const SaveTutorFavsInfoSuccessful({required this.successMessage});
  final String successMessage;
}

class SaveTutorFavsLoading extends FavTutorsState {
  const SaveTutorFavsLoading();
}
