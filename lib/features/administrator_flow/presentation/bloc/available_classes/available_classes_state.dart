part of 'available_classes_bloc.dart';

sealed class AvailableClassesState extends Equatable {
  const AvailableClassesState();
  
  @override
  List<Object> get props => <Object>[];
}

final class AvailableClassesInitial extends AvailableClassesState {}
