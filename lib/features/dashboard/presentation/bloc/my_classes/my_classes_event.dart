part of 'my_classes_bloc.dart';

sealed class MyClassesEvent extends Equatable {
  const MyClassesEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetMyClasses extends MyClassesEvent {
  const GetMyClasses();
}
