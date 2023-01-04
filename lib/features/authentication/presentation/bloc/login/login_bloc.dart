import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eshop/features/authentication/domain/repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../data/models/user_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authenticationRepository;

  LoginBloc(this._authenticationRepository) : super(const LoginValidate(
      email: "", 
      password: "", 
      name: "",
      isEmailValid: true, 
      isPasswordValid: true, 
      isNameValid: true,
      isLoginValidateFailed: false, 
      isLoading: false, )) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<NameChanged>(_onNameChanged);
    on<FormLogin>(_onFormLogin);
    on<FormSignup>(_onFormSignup);
  }

  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  bool _isEmailValid(String email) {
    return _emailRegExp.hasMatch(email);
  }

  _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    if(state is! LoginValidate){
      return;
    }
    emit((state as LoginValidate).copyWith(
      isLoginValidateFailed: false,
      error: "",
      email: event.email,
      isEmailValid: _isEmailValid(event.email),
    ));
  }

  _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    if(state is! LoginValidate){
      return;
    }
    emit((state as LoginValidate).copyWith(
      isLoginValidateFailed: false,
      error: "",
      password: event.password,
      isPasswordValid: event.password.length>6
    ));
  }

  _onNameChanged(NameChanged event, Emitter<LoginState> emit) {
    if(state is! LoginValidate){
      return;
    }
    emit((state as LoginValidate).copyWith(
      isLoginValidateFailed: false,
      error: "",
      name: event.name,
      isNameValid: event.name.length>3
    ));
  }

  _onFormLogin(FormLogin event, Emitter<LoginState> emit) async {
    if(state is! LoginValidate){
      return;
    }
    LoginValidate stateVal = state as LoginValidate;

    emit(stateVal.copyWith(isLoading: true, error: "", isLoginValidateFailed: false));

    bool isLoginValid = stateVal.password.length>6 &&
      _isEmailValid(stateVal.email);
      
    UserModel user = UserModel(
      email: stateVal.email,
      password: stateVal.password);

    if (isLoginValid) {
      try {
        await Future.delayed(const Duration(milliseconds: 300));
        UserCredential? authUser = await _authenticationRepository.login(user);
        emit(LoginSuccess());
      } on FirebaseAuthException catch (e) {
        emit(stateVal.copyWith(isLoading: false, error: e.message));
      }
    } else {
      emit(stateVal.copyWith(isLoading: false, isLoginValidateFailed: true));
    }
  }

  _onFormSignup(FormSignup event, Emitter<LoginState> emit) async {
    if(state is! LoginValidate){
      return;
    }
    LoginValidate stateVal = state as LoginValidate;

    emit(stateVal.copyWith(isLoading: true, error: "", isLoginValidateFailed: false));

    bool isLoginValid = stateVal.password.length>6 &&
      _isEmailValid(stateVal.email)&&
      stateVal.name.length>3;
      
    UserModel user = UserModel(
      email: stateVal.email,
      password: stateVal.password,
      name: stateVal.name);

    if (isLoginValid) {
      try {
        await Future.delayed(const Duration(milliseconds: 300));
        UserCredential? authUser = await _authenticationRepository.signUp(user);
        await _authenticationRepository.saveUserData(UserModel(
          uid: authUser?.user?.uid,
          name: user.name,
          email: user.email,
        ));
        emit(LoginSuccess());
      } on FirebaseAuthException catch (e) {
        emit(stateVal.copyWith(isLoading: false, error: e.message));
      }
    } else {
      emit(stateVal.copyWith(isLoading: false, isLoginValidateFailed: true));
    }
  }
}
