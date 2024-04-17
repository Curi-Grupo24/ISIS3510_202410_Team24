part of 'shcedule_home_bloc.dart';

sealed class ShceduleHomeState extends Equatable {
  const ShceduleHomeState();
  
  @override
  List<Object> get props => <Object>[];
}

final class ShceduleHomeInitial extends ShceduleHomeState {}
