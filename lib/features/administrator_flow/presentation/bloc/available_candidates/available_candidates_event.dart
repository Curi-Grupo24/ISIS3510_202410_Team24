part of 'available_candidates_bloc.dart';

sealed class AvailableCandidatesEvent extends Equatable {
  const AvailableCandidatesEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetCandidates extends AvailableCandidatesEvent {
  const GetCandidates();
}

class AcceptCandidate extends AvailableCandidatesEvent {
  const AcceptCandidate({
    required this.candidate,
  });
  final Map<String, dynamic> candidate;
}

class DeclineCandidate extends AvailableCandidatesEvent {
  const DeclineCandidate();
}
