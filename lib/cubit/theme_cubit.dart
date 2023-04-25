import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false);
  bool isChanged = false;
  void changeTheme() {
    isChanged = !isChanged;
    emit(isChanged);
  }
}
