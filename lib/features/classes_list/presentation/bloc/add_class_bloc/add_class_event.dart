part of 'add_class_bloc.dart';

sealed class AddClassEvent extends Equatable {
  const AddClassEvent();

  @override
  List<Object> get props => <Object>[];
}

class AddAClass extends AddClassEvent {
  const AddAClass({
    required this.classToAdd,
  });
  final ClassModel classToAdd;
}
