part of 'delete_class_bloc.dart';

sealed class DeleteClassEvent extends Equatable {
  const DeleteClassEvent();

  @override
  List<Object> get props => <Object>[];
}

class DeleteAClass extends DeleteClassEvent {
  const DeleteAClass({
    required this.classToDelete,
  });
  final ClassModel classToDelete;
}
