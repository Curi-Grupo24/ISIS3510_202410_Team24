import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shcedule_home_event.dart';
part 'shcedule_home_state.dart';

class ShceduleHomeBloc extends Bloc<ShceduleHomeEvent, ShceduleHomeState> {
  ShceduleHomeBloc() : super(ShceduleHomeInitial()) {
    on<ShceduleHomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
