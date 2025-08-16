import "dart:developer" as devtool;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_notes/constants/routes.dart';
import 'package:my_notes/utilities/snackbar.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
      appBar: AppBar(
        title: const Text(
          "Register",
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
                  hintText: "create your password",
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

                  }
                  else {try {
                    final userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        if (!context.mounted)return;
                        devtool.log(userCredential.toString());
                        showCustomSnackBar(context, "registered successfully");
                        Navigator.pushReplacementNamed(context, emailVerifyRoute);


                  } on FirebaseAuthException catch (e) {
                    if (e.code == "invalid-email") {
                      if(!mounted)return;
                     showCustomSnackBar(context, "enter valid email");
                    }
                    else if (e.code == "weak-password") {
                      showCustomSnackBar(context, "use a mixed password");
                    }
                    else if (e.code == "email-already-in-use") {
                      showCustomSnackBar(context, "email already in use");
                    }
                    else {
                      showCustomSnackBar(context, "${e.message}");
                    }
                  }
                  catch (_) {
                    showCustomSnackBar(context, "something went wrong,try again");
                  }
                     
                    }
        
                     
                      
                },
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 35, color: Colors.white60),
                ),
                
              ),
              
            ),
            TextButton(onPressed: () {
              Navigator.pushReplacementNamed(context, loginRoute);
            }, child: const Text("already login? login here!"),),
          ],
        ),
      ),
    );
  }
}
