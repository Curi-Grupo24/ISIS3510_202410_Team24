part of 'fetch_subject_bloc.dart';

sealed class FetchSubjectState extends Equatable {
  const FetchSubjectState();
  
  @override
  List<Object> get props => <Object>[];
}

final class FetchClassInitial extends FetchSubjectState {}

class FetchClassError extends FetchSubjectState {
  const FetchClassError({required this.errorMessage});
  final String errorMessage;
}
class FetchAllClasesSuccessful extends FetchSubjectState {
  const FetchAllClasesSuccessful({required this.classesList});
  final List<ClassModel> classesList;
}

class FetchClassSuccessfull extends FetchSubjectState {
  const FetchClassSuccessfull(
  );
}

class FetchClassLoading extends FetchSubjectState {
  const FetchClassLoading();
}
