part of 'delete_class_bloc.dart';

sealed class DeleteClassState extends Equatable {
  const DeleteClassState();
  
  @override
  List<Object> get props => <Object>[];
}

final class DeleteClassInitial extends DeleteClassState {}

class DeleteClassError extends DeleteClassState {
  const DeleteClassError({required this.errorMessage});
  final String errorMessage;
}

class DeleteClassSuccessfull extends DeleteClassState {
  const DeleteClassSuccessfull({
    required this.successMessage,
  });
  final String successMessage;
}

class DeleteClassLoading extends DeleteClassState {
  const DeleteClassLoading();
}
