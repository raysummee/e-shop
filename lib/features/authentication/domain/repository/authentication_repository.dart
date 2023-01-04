import 'package:firebase_auth/firebase_auth.dart';

import '../../data/models/user_model.dart';

abstract class AuthenticationRepository{
  Stream<User?> getCurrentUser();
  Future<UserCredential?> signUp(UserModel user);
  Future<UserCredential?> login(UserModel user);
  Future<void> signOut();
  Future<void> saveUserData(UserModel user);
}