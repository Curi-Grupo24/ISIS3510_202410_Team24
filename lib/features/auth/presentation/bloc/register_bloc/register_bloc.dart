// ignore_for_file: lines_longer_than_80_chars

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:get/route_manager.dart';

import '../../../../../injection_container.dart';
import '../../../data/models/user_model.dart';
import '../../../domain/usecases/register_account.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterAccount>(
        (RegisterAccount event, Emitter<RegisterState> emit) async {
      //
      emit(const RegisterLoading());
      RegisterAccountUseCase usecase = sl<RegisterAccountUseCase>();
      await usecase(
        email: event.email,
        password: event.password,
        name: event.name,
        career: event.career,
        phone: event.phone,
        studentCode: event.studentCode,
      ).then((Either<String, UserModel> value) {
        value.fold(
          (String l) => emit(
            RegisterError(
              errorMessage: l,
            ),
          ),
          (UserModel r) {
            Get.toNamed('/dashboard_home');
            emit(RegisterSuccessfull(user: r));
          },
        );
      });
    });
  }
}
