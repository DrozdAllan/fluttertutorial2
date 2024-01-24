import 'package:bloc/bloc.dart';

class IsDarkThemeCubit extends Cubit<bool> {
  IsDarkThemeCubit() : super(false);

  void swap() => emit(!state);
}
