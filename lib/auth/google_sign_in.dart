
import 'package:flutter/material.dart';
import 'package:flutter_demo/auth/AuthService.dart';

class GoogleSignInScreen extends StatelessWidget{

  final Set<void> Function(String screen) redirect;

  const GoogleSignInScreen({required this.redirect,super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: ()async{
          try {
            await AuthService().signInWithGoogle();
            redirect("Home");
          }
          catch(e){
            print(e);
            redirect("Google");
          }
        }, child: const Text("Google Sign in")),
      ),
    );

  }
}