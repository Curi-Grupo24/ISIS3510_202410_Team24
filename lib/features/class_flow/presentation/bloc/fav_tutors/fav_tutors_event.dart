part of 'fav_tutors_bloc.dart';

sealed class FavTutorsEvent extends Equatable {
  const FavTutorsEvent();

  @override
  List<Object> get props => <Object>[];
}

class SaveTutorToFavs extends FavTutorsEvent {
  const SaveTutorToFavs({
    required this.tutorToSave,
  });
  final TutorModel tutorToSave;
}
class DeleteToFavs extends FavTutorsEvent {
  const DeleteToFavs({
    required this.tutorToSave,
  });
  final TutorModel tutorToSave;
}
