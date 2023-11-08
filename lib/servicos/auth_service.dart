import '/models/campo_user.dart';
import 'dart:io';

import '/servicos/auth_firebase.dart';

abstract class AuthService {
  CampoUser? get currentUser;

  Stream<CampoUser?> get userChanges;

  Future<void> signup(
    String nome,
    String email,
    String password,
    File? image,
  );

  Future<void> login(
    String email,
    String password,
  );

  Future<void> logout();

  factory AuthService() {
    return AuthFirebaseService();
  }
}
