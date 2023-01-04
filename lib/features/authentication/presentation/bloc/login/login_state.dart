part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {}

class LoginValidate extends LoginState {
  final String email;
  final String password;
  final String name;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isNameValid;
  final bool isLoginValidateFailed;
  final bool isLoading;
  final String error;
  
  const LoginValidate({
    required this.email,
    required this.password,
    required this.name,
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.isNameValid,
    required this.isLoginValidateFailed,
    required this.isLoading,
    this.error="",
  });

  LoginValidate copyWith({
    String? email,
    String? password,
    String? name,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isNameValid,
    bool? isLoginValidateFailed,
    bool? isLoading,
    String? error,
  }) {
    return LoginValidate(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isNameValid: isNameValid ?? this.isNameValid,
      isLoginValidateFailed: isLoginValidateFailed ?? this.isLoginValidateFailed,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'LoginValidate(email: $email, password: $password, name: $name, isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isNameValid: $isNameValid, isLoginValidateFailed: $isLoginValidateFailed, isLoading: $isLoading, error: $error)';
  }

    @override
  List<Object> get props => [email, password, name,isEmailValid, isPasswordValid, isNameValid, isLoginValidateFailed, isLoading, error];
}

