part of 'my_classes_bloc.dart';

sealed class MyClassesState extends Equatable {
  const MyClassesState();

  @override
  List<Object> get props => <Object>[];
}

final class MyClassesInitial extends MyClassesState {}

class GetMyClassesError extends MyClassesState {
  const GetMyClassesError({required this.errorMessage});
  final String errorMessage;
}

class GetMyClassesSuccessfull extends MyClassesState {
  const GetMyClassesSuccessfull({
    required this.listClasses,
  });
  final List<ClassModel> listClasses;
}

class GetMyClassesLoading extends MyClassesState {
  const GetMyClassesLoading();
}
