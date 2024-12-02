import 'package:flutter/material.dart';
import 'package:flutter_demo/Screens/LoginScreen.dart';
import 'package:flutter_demo/Services/AuthService.dart';

class SignupScreen extends StatefulWidget {

  const SignupScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Firebase app")),
        body: Center(
          child: ListView(
            children: [
              Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                    ),
                    onPressed: () async{
                      String? response = await AuthService().registration(
                          email: emailController.text,
                          password: passwordController.text);

                      if (response != null) {
                        if (response == "Success") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        }
                        else{
                          passwordController.clear();
                          emailController.clear();
                        }
                      }
                    }, child: const Text("Signup")),
              )
            ],
          ),
        ));
  }
}