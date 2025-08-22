import "dart:developer" as devtool;
import 'package:flutter/material.dart';
import 'package:my_notes/constants/routes.dart';
import 'package:my_notes/services/auth/auth_exceptions.dart';
import 'package:my_notes/services/auth/auth_service.dart';
import 'package:my_notes/utilities/snackbar.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white30, fontSize: 35),
        ),
        backgroundColor: Colors.blueGrey,
        // actions: [
        //   PopupMenuButton(itemBuilder: itemBuilder)
        // ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: TextField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                  hintText: "enter your email address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
              child: TextField(
                controller: _passwordcontroller,
                decoration: InputDecoration(
                  hintText: "enter your password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                obscureText: true,
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueGrey),
                ),
                onPressed: () async {
                  final email = _emailcontroller.text;
                  final password = _passwordcontroller.text;
                  if (email.isEmpty || password.isEmpty) {
                    showCustomSnackBar(context, "fill all fields");
                    return;
                  } else {
                    try {
                      final userCredential = await AuthService.firebase().login(
                        email: email,
                        password: password,
                      );
                      final user = AuthService.firebase().currentUser;
                      if (!context.mounted) return;
                      if (user != null) {
                        if (user.emailVerified) {
                          showCustomSnackBar(context, "email verifed");
                          Navigator.pushReplacementNamed(context, notesRoute);
                        }
                      } else {
                        showCustomSnackBar(context, "something went wrong");
                      }
                      if (!mounted) return;
                      devtool.log(userCredential.toString());
                    } on InvalidEmail {
                      if (!mounted) return;
                      showCustomSnackBar(context, "enter a valid email");
                    } on WrongPassword {
                      showCustomSnackBar(context, "wrong password");
                    } on UserNotFound {
                      showCustomSnackBar(context, "user not found");
                    } on GenericException {
                      showCustomSnackBar(context, "something went wrong");
                    }
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 35, color: Colors.white60),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, registerRoute);
              },
              child: const Text("haven't registered yet! register here"),
            ),
          ],
        ),
      ),
    );
  }
}
