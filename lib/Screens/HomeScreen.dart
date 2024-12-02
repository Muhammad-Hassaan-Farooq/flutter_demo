import 'package:flutter/material.dart';
import 'package:flutter_demo/Screens/LoginScreen.dart';
import 'package:flutter_demo/Services/AuthService.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
        actions: [
          ElevatedButton(
              onPressed: () async {
                await AuthService().signOutWithGoogle();
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: const Text("Log out")),
        ],
      ),
      body: const Center(child: Text("Home page"),),
    );
  }

}