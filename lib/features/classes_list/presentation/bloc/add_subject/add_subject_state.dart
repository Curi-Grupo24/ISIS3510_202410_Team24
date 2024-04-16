part of 'add_subject_bloc.dart';

sealed class AddSubjectState extends Equatable {
  const AddSubjectState();
  
  @override
  List<Object> get props => <Object>[];
}

final class AddSubjectInitial extends AddSubjectState {}

class AddSubjectError extends AddSubjectState {
  const AddSubjectError({required this.errorMessage});
  final String errorMessage;
}
class FetchAllClasesSuccessful extends AddSubjectState {
  const FetchAllClasesSuccessful({required this.classesList});
  final List<ClassModel> classesList;
}

class AddSubjectSuccessfull extends AddSubjectState {
  const AddSubjectSuccessfull(
    // required this.user,
  );
  // final UserModel user;
}

class AddSubjectLoading extends AddSubjectState {
  const AddSubjectLoading();
}
