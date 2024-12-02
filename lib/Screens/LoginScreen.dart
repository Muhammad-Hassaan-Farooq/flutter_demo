import 'package:flutter/material.dart';
import 'package:flutter_demo/Screens/HomeScreen.dart';
import 'package:flutter_demo/Screens/SignupScreen.dart';
import 'package:flutter_demo/Services/AuthService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8),
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
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () async {
                    String? response = await AuthService().login(
                        email: emailController.text,
                        password: passwordController.text);

                    if (response != null) {
                      if (response == "Success") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      }
                    }
                  },
                  child: const Text("Login")),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextButton(onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupScreen()));
              }, child: const Text("Signup")),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(onPressed: ()async{
                try {
                  await AuthService().signInWithGoogle();
                  Navigator.push(context
                  ,MaterialPageRoute(
                          builder: (context) => const HomeScreen())
                  );
                }
                catch(e){
                  emailController.clear();
                  passwordController.clear();
                }
              }, child: const Text("Google Sign in")),
            )
          ],
        ),
      ),
    );
  }
}
