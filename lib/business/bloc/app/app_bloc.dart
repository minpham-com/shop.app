import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/business/bloc/app/app_event.dart';
import 'package:store/business/bloc/app/app_state.dart';
import 'package:store/business/bloc/base_event.dart';
import 'package:store/services/log_service.dart';

class AppBloc extends Bloc<BaseEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<AppStarting>(_starting);
    on<AppStarted>(_started);
    on<AppFinishing>(_finishing);
    on<AppFinished>(_finished);
  }

  static const String TAG = "AppBloc";
  final LogService _log = LogService.getInstance();

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
