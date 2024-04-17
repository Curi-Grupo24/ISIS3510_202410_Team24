part of 'my_tutor_classes_bloc.dart';

sealed class MyTutorClassesState extends Equatable {
  const MyTutorClassesState();

  @override
  List<Object> get props => <Object>[];
}

final class MyTutorClassesInitial extends MyTutorClassesState {}

class GetMyTutorClassesError extends MyTutorClassesState {
  const GetMyTutorClassesError({required this.errorMessage});
  final String errorMessage;
}

class GetMyTutorClassesSuccessfull extends MyTutorClassesState {
  const GetMyTutorClassesSuccessfull({
    required this.listClasses,
  });
  final List<ClassModel> listClasses;
}

class GetMyTutorClassesLoading extends MyTutorClassesState {
  const GetMyTutorClassesLoading();
}
