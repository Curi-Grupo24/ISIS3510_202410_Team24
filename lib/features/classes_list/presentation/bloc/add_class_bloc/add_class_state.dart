part of 'add_class_bloc.dart';

sealed class AddClassState extends Equatable {
  const AddClassState();

  @override
  List<Object> get props => <Object>[];
}

final class AddClassInitial extends AddClassState {}

class AddSubjectError extends AddClassState {
  const AddSubjectError({required this.errorMessage});
  final String errorMessage;
}

class AddSubjectSuccessfull extends AddClassState {
  const AddSubjectSuccessfull({
    required this.successMessage,
  });
  final String successMessage;
}

class AddSubjectLoading extends AddClassState {
  const AddSubjectLoading();
}
