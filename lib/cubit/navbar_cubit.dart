import 'package:flutter_bloc/flutter_bloc.dart';

class NavbarCubit extends Cubit<int> {
  NavbarCubit() : super(0);
  void changeIndex(int i) {
    emit(i);
  }
}
