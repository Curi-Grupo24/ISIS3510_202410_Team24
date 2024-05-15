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
  });
  final String successMessage;
  final List<Map<String, dynamic>> candidatesTotal;
}

class AvailableCandidatesLoading extends AvailableCandidatesState {
  const AvailableCandidatesLoading();
}
