import 'package:bloc/bloc.dart';

class SignCubit extends Cubit<bool> {
  SignCubit() : super(false);

  void pressedLogin(bool islogged) {
    emit(islogged);
  }
}
