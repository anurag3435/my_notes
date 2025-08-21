//before working on this file first read all the previous files
//  ESPECIALLY SNACKBAR

/* 
things to do in verifyEmailView:
-stf widget 
-scaffold 
- three buttons (sendEmailverify,verficationStatus,go back to login page)
*/
// front end done!
// backend still left to do!! 16 august done !
import 'package:flutter/material.dart';
import 'package:my_notes/constants/routes.dart';
import 'package:my_notes/services/auth/auth_service.dart';
import 'package:my_notes/utilities/snackbar.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("verifyEmail"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Center(
          child: Column(
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
                ),
                onPressed: () async {
                  final user = AuthService.firebase().currentUser;
                  if (user != null) {
                    await AuthService.firebase().sendEmailVerification();
                    if (!context.mounted) return;

                    showCustomSnackBar(context, "email verification sent");
                  } else {
                    showCustomSnackBar(context, "no user found");
                  }
                },
                child: const Text(
                  "send verfication email",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
                ),
                onPressed: () async {
                  if (!context.mounted) return;
                  await AuthService.firebase().reload();
                  final user = AuthService.firebase().currentUser;
                  if (user != null) {
                    if (!context.mounted) return;
                    if (user.emailVerified) {
                      showCustomSnackBar(context, "email verified");
                      Navigator.pushReplacementNamed(context, notesRoute);
                    } else {
                      showCustomSnackBar(context, "something went wrong");
                    }
                  }
                },
                child: const Text(
                  "verification status",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
                ),
                onPressed: () async {
                  Navigator.pushReplacementNamed(context, loginRoute);
                },
                child: const Text(
                  "back to login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
