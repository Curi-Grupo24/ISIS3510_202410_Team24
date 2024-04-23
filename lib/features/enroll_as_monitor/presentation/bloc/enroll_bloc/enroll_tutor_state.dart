part of 'enroll_tutor_bloc.dart';

sealed class EnrollTutorState extends Equatable {
  const EnrollTutorState();

  @override
  List<Object> get props => <Object>[];
}

final class EnrollTutorInitial extends EnrollTutorState {}

class EnrollTutorError extends EnrollTutorState {
  const EnrollTutorError({required this.errorMessage});
  final String errorMessage;
}

class EnrollTutorSuccessfull extends EnrollTutorState {
  const EnrollTutorSuccessfull({
    required this.successMessage,
  });
  final String successMessage;
}

class EnrollTutorLoading extends EnrollTutorState {
  const EnrollTutorLoading();
}
