import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/business/bloc/error/error_event.dart';
import 'package:store/business/bloc/error/error_state.dart';

class ErrorBloc extends Bloc<ErrEvent, ErrorState> {
  ErrorBloc() : super(ErrorState<NullEvent>("", NullEvent())) {
    on<EmergencyEvent>(_emergency);
    on<ErrorEvent>(_error);
    on<WarningEvent>(_warning);
  }

  Future<void> _emergency(
      EmergencyEvent event, Emitter<ErrorState<ErrEvent>> emit) async {
    emit(ErrorState(event.message, event));
  }

  Future<void> _error(
      ErrorEvent event, Emitter<ErrorState<ErrEvent>> emit) async {
    emit(ErrorState(event.message, event));
  }

  Future<void> _warning(
      WarningEvent event, Emitter<ErrorState<ErrEvent>> emit) async {
    emit(ErrorState(event.message, event));
  }
}
