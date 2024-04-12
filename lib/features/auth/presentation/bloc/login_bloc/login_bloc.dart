import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

import '../../../../../injection_container.dart';
import '../../../data/models/user_model.dart';
import '../../../domain/usecases/login_account.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginAccount>((LoginAccount event, Emitter<LoginState> emit) async {
      //
      emit(const LoginLoading());
      LoginAccountUseCase usecase = sl<LoginAccountUseCase>();
      await usecase(email: event.email, password: event.password)
          .then((Either<String, UserModel> value) {
        value.fold(
          (String l) => emit(
            LoginError(
              errorMessage: l,
            ),
          ),
          (UserModel r) {
            Get.offAndToNamed('/dashboard_home');
            emit(LoginSuccessfull(user: r));
          },
        );
      });
    });
  }
}
