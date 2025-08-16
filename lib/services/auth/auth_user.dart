import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  final bool isEmailVerified;
  AuthUser(this.isEmailVerified);
  factory AuthUser.fromFirebase(User? user) {
    return AuthUser(user?.emailVerified ?? false);
  }

  Future<void> reload() async {}
}

//  factory just gets the user from firebase and make a custom user with the properties
// that are actually i wanted
