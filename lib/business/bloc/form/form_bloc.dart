import 'package:store/business/bloc/base_bloc.dart';

abstract class FormBloc<T, E> extends BaseBloc<T, E> {
  FormBloc(super.initialState);
}
