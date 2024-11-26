import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/auth/AuthService.dart';
import 'package:flutter_demo/auth/google_sign_in.dart';
import 'package:flutter_demo/auth/login_screen.dart';
import 'package:flutter_demo/auth/signup_screen.dart';
import 'package:flutter_demo/home/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'Firebase App',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget{

  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{



  late String screenState;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(FirebaseAuth.instance.currentUser== null) {
      screenState = "Google";
      setState(() {

      });
    }
    else{
      screenState = "Home";
      setState(() {

      });
    }

  }


  void login(String email, String password) async{
    String? response = await AuthService().login(email: email, password: password);

    if(response!=null){
      if(response == "Success"){
        changeScreen("Home");
      }
    }
    setState(() {

    });



  }

  void signup(String email, String password) async{
    String? response = await AuthService().registration(email: email, password: password);

    if(response!=null){
      if(response == "Success"){
        changeScreen("Login");
      }
    }


  }



  void changeScreen(String screen)=>{

    setState(() {
      screenState= screen;
    })
  };

  @override
  Widget build(BuildContext context) {



    switch(screenState){
      case "Login": return LoginScreen(login: (String email,String password) => {login(email, password)} ,signup: ()=>{changeScreen("Signup")});
      case "Home": return HomePage(redirect: (String screen)=>{changeScreen(screen)});
      case "Signup": return SignupScreen(signup: (String email,String password) => {signup(email, password)});
      case "Google": return GoogleSignInScreen(redirect:(String screen)=>{changeScreen(screen)});

    }
    return LoginScreen(login: (String email,String password) => {login(email, password)},signup: ()=>{changeScreen("Signup")});
  }
}