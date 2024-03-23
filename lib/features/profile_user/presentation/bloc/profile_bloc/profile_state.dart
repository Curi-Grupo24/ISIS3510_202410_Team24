part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => <Object>[];
}

final class ProfileInitial extends ProfileState {}
