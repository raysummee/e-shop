import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/repository/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationBloc(this._authenticationRepository) : super(AuthenticationInitial()) {
    on<AuthenticationStarted>(_onAuthenticationStarted);
    on<AuthenticationSignedOut>(_onAuthenticationSignout);
  }

  _onAuthenticationStarted(AuthenticationStarted event, Emitter<AuthenticationState> emit) async {
    User? user = await _authenticationRepository.getCurrentUser().first;
    if (user!=null) {
      emit(AuthenticationSuccess(
        uid: user.uid
      ));
    } else {
      emit(AuthenticationFailed());
    }
  }

  _onAuthenticationSignout(AuthenticationSignedOut event, Emitter<AuthenticationState> emit) async {
    await _authenticationRepository.signOut();
    emit(AuthenticationFailed());
  }


}
