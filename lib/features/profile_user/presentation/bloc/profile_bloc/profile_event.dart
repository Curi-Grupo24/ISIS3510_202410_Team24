part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetUserInfo extends ProfileEvent {
  const GetUserInfo();
}
