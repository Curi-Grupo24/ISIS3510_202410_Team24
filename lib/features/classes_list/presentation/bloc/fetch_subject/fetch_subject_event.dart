part of 'fetch_subject_bloc.dart';

sealed class FetchSubjectEvent extends Equatable {
  const FetchSubjectEvent();

  @override
  List<Object> get props => <Object>[];
}

class FetchAllClases extends FetchSubjectEvent {
  const FetchAllClases();
}
