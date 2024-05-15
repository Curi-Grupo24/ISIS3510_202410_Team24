import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'available_classes_event.dart';
part 'available_classes_state.dart';

class AvailableClassesBloc extends Bloc<AvailableClassesEvent, AvailableClassesState> {
  AvailableClassesBloc() : super(AvailableClassesInitial()) {
    on<AvailableClassesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
