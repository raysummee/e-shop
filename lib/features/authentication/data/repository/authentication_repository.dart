import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repository/authentication_repository.dart';
import '../models/user_model.dart';
import '../service/authentication_service.dart';
import '../service/database_user_service.dart';


class AuthenticationRepositoryImpl extends AuthenticationRepository{
  AuthenticationService service = AuthenticationService();
  DatabaseUserService dbService = DatabaseUserService();

  @override
  Stream<User?> getCurrentUser() {
    return service.retrieveCurrentUser();
  }

  @override
  Future<UserCredential?> signUp(UserModel user) {
    try {
      return service.signUp(user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<UserCredential?> login(UserModel user) {
    try {
      return service.login(user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> signOut() {
    return service.signOut();
  }

  @override
  Future<void> saveUserData(UserModel user) {
    return dbService.addUserData(user);
  }
}