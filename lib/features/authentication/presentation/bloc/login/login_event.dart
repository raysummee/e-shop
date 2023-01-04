part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  final String email;
  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends LoginEvent {
  final String password;
  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class NameChanged extends LoginEvent {
  final String name;
  const NameChanged(this.name);

  @override
  List<Object> get props => [name];
}

class FormLogin extends LoginEvent {}

class FormSignup extends LoginEvent {}

