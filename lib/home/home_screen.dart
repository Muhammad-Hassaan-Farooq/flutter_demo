import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/auth/AuthService.dart';

class HomePage extends StatelessWidget{

  final Set<void> Function(String screen) redirect;

  const HomePage({required this.redirect, super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
        actions: [
          ElevatedButton(
              onPressed: () async {
                await AuthService().signOutWithGoogle();
                redirect("Google");
              },
              child: const Text("Log out")),
        ],
      ),
      body: Text("Home page"),
    );
  }
}