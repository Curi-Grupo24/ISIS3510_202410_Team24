part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => <Object>[];
}

final class ProfileInitial extends ProfileState {}

class ProfileError extends ProfileState {
  const ProfileError({required this.errorMessage});
  final String errorMessage;
}

class ProfileSuccessfull extends ProfileState {
  const ProfileSuccessfull({required this.user, this.profilePicture});
  final Map<String, dynamic>? user;
  final String? profilePicture;
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}
