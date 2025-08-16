import 'package:my_notes/services/auth/auth_user.dart';

abstract class AuthProvider {
  Future<void> initialize();
  AuthUser? get currentUser;
  // login case
  Future<AuthUser?> login({required String email, required String password});

  Future<AuthUser?> register({required String email, required String password});
  Future<void> logout();
  Future<void> sendEmailVerification();
  Future<void> reload();
}
