part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetUserInfo extends ProfileEvent {
  const GetUserInfo();
}

class AddProfilePicture extends ProfileEvent {
  const AddProfilePicture({
    required this.user,
    required this.file,
  });
  final Map<String, dynamic>? user;
   final Uint8List file;
}
