part of 'available_candidates_bloc.dart';

sealed class AvailableCandidatesState extends Equatable {
  const AvailableCandidatesState();

  @override
  List<Object> get props => <Object>[];
}

final class AvailableCandidatesInitial extends AvailableCandidatesState {}

class AvailableCandidatesError extends AvailableCandidatesState {
  const AvailableCandidatesError({required this.errorMessage});
  final String errorMessage;
}

class AvailableCandidatesSuccessfull extends AvailableCandidatesState {
  const AvailableCandidatesSuccessfull({
    required this.successMessage,
    required this.candidatesTotal,
    this.acceptedUser = '',
    this.declinedUser = '',
  });
  final String successMessage;
  final List<Map<String, dynamic>> candidatesTotal;
  final String? acceptedUser;
  final String? declinedUser;
}

class AvailableCandidatesLoading extends AvailableCandidatesState {
  const AvailableCandidatesLoading();
}
