import 'package:store/business/bloc/base_state.dart';

class LoadingState extends BaseState {
  final bool loading;

  LoadingState({this.loading = false});

  @override
  List<Object?> get props => [loading];
}
