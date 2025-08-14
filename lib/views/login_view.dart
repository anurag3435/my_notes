import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}


class _LoginViewState extends State<LoginView> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  @override 
  void dispose () {
     _emailcontroller.dispose();
     _passwordcontroller.dispose();
     super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login",
        style: TextStyle(color: Colors.white30,fontSize: 35),
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
            padding: const EdgeInsets.only(left: 25,right:25,top: 25),
            child: TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                hintText: "enter your email address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                )
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,right:25,top: 15),
            child: TextField(
              controller: _passwordcontroller,
              decoration: InputDecoration(
                hintText: "enter your password",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
              ),
              obscureText: true,
              keyboardType:TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: TextButton(
              style: ButtonStyle(
                 backgroundColor:WidgetStatePropertyAll(Colors.blueGrey),
              ),
              onPressed:()
             {
              
            } , child: const Text("Login",style: TextStyle(fontSize: 35,color: Colors.white60),),),
          ),

        ],
      ),
      ),

    );
  }
}