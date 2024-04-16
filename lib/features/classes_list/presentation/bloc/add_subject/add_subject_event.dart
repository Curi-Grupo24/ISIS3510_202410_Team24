part of 'add_subject_bloc.dart';

sealed class AddSubjectEvent extends Equatable {
  const AddSubjectEvent();

  @override
  List<Object> get props => <Object>[];
}

class FetchAllClases extends AddSubjectEvent {
  const FetchAllClases();
}
