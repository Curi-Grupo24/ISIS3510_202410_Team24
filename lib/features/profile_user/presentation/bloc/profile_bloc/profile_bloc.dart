import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';
import '../../../domain/usecases/get_user_info.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetUserInfo>((ProfileEvent event, Emitter<ProfileState> emit) async {
      //
      emit(const ProfileLoading());
      print("llegue aca");
      GetProfileUserInfoUseCase usecase = sl<GetProfileUserInfoUseCase>();
      await usecase().then(
        (Map<String, dynamic>? r) {
          emit(ProfileSuccessfull(user: r));
        },
      );
    });
  }
}
