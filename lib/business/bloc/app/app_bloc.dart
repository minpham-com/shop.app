import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:store/business/bloc/app/app_event.dart';
import 'package:store/business/bloc/app/app_state.dart';
import 'package:store/di/get_it.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<AppStarting>(_starting);
    on<AppStarted>(_started);
    on<AppFinishing>(_finishing);
    on<AppFinished>(_finished);
  }
  final String TAG = "AppBloc";
  final Logger _log = getIt<Logger>();

  Future<void> _starting(AppStarting event, Emitter<AppState> emit) async {
    _log.d("$TAG _starting");
    emit(AppState());
  }

  Future<void> _started(AppStarted event, Emitter<AppState> emit) async {
    _log.d("$TAG _started");
    emit(AppState());
  }

  Future<void> _finishing(AppFinishing event, Emitter<AppState> emit) async {
    _log.d("$TAG _finishing");
    emit(AppState());
  }

  Future<void> _finished(AppFinished event, Emitter<AppState> emit) async {
    _log.d("$TAG _finished");
    emit(AppState());
  }
}
