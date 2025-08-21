import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  final String id;
  final String? email;
  final bool emailVerified;
  AuthUser({
    required this.id,
    required this.emailVerified,
    required this.email,
  });
  factory AuthUser.fromFirebase(User user) {
    return AuthUser(
      id: user.uid,
      email: user.email,
      emailVerified: user.emailVerified,
    );
  }

  Future<void> reload() async {}
}

//  factory just gets the user from firebase and make a custom user with the properties
// that are actually i wanted
