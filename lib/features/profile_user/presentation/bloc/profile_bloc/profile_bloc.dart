import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';
import '../../../domain/usecases/add_profile_picture.dart';
import '../../../domain/usecases/get_user_info.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetUserInfo>((GetUserInfo event, Emitter<ProfileState> emit) async {
      emit(const ProfileLoading());
      GetProfileUserInfoUseCase usecase = sl<GetProfileUserInfoUseCase>();
      await usecase().then(
        (Map<String, dynamic>? r) {
          emit(ProfileSuccessfull(user: r));
        },
      );
    });
    on<AddProfilePicture>(
        (AddProfilePicture event, Emitter<ProfileState> emit) async {
      emit(const ProfileLoading());
      AddProfilePictureUseCase usecase = sl<AddProfilePictureUseCase>();
      await usecase(file: event.file).then((dynamic value) {
        value.fold(
          (String l) => emit(
            ProfileError(
              errorMessage: l,
            ),
          ),
          (String r) {
            emit(
              ProfileSuccessfull(
                user: event.user,
                profilePicture: r,
              ),
            );
          },
        );
      });
    });
  }
}
