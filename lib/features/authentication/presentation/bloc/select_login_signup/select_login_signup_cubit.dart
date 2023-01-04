import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_login_signup_state.dart';

class SelectLoginSignupCubit extends Cubit<SelectLoginSignupState> {
  SelectLoginSignupCubit() : super(SelectSignup());

  selectLogin(){
    emit(SelectLogin());
  }

  selectSignup(){
    emit(SelectSignup());
  }
}
