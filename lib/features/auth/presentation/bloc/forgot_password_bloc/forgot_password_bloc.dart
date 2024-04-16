import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../../injection_container.dart';
import '../../../domain/usecases/forgot_password_account.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ForgotPasswordSend>(
        (ForgotPasswordSend event, Emitter<ForgotPasswordState> emit) async {
      emit(const ForgotPasswordLoading());
      ForgotPasswordUseCase usecase = sl<ForgotPasswordUseCase>();
      await usecase(
        email: event.email,
      ).then((Either<String, dynamic> value) {
        value.fold(
          (String l) => emit(
            ForgotPasswordError(
              errorMessage: l,
            ),
          ),
          (dynamic r) {
            emit(ForgotPasswordSuccessfull(message: r));
          },
        );
      });
    });
  }
}
