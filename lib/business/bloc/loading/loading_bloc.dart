import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/business/bloc/loading/loading_event.dart';
import 'package:store/business/bloc/loading/loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingState(false)) {
    on<LoadingEvent>(_loading);
  }

  Future<void> _loading(LoadingEvent event, Emitter<LoadingState> emit) async {
    emit(LoadingState(event.loading));
  }
}
