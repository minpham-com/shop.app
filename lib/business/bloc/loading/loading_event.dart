import 'package:store/business/bloc/base_event.dart';

class LoadingEvent extends BaseEvent {
  final bool loading;

  LoadingEvent({this.loading = false});

  @override
  List<Object?> get props => [loading];
}
