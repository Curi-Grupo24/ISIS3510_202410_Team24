part of 'enroll_tutor_bloc.dart';

sealed class EnrollTutorEvent extends Equatable {
  const EnrollTutorEvent();

  @override
  List<Object> get props => <Object>[];
}

class EnroolToAClass extends EnrollTutorEvent {
  const EnroolToAClass({
    required this.classToAdd,
    required this.answersList,
    required this.lastAnswer,
  });
  final ClassModel classToAdd;
  final List<Map<int, Map<int, String>>> answersList;
  final String lastAnswer;
}
