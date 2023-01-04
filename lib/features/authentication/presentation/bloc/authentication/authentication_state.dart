part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}
class AuthenticationFailed extends AuthenticationState {}
class AuthenticationSuccess extends AuthenticationState {
  final String uid;

  const AuthenticationSuccess({
    required this.uid,
  });

  @override
  List<Object> get props => [uid];
}
