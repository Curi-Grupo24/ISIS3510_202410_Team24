part of 'my_tutor_classes_bloc.dart';

sealed class MyTutorClassesEvent extends Equatable {
  const MyTutorClassesEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetMyTutorClasses extends MyTutorClassesEvent {
  const GetMyTutorClasses();
}
