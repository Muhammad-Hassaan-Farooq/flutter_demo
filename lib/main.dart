import 'package:flutter/material.dart';
import 'package:flutter_demo/PostList.dart';
import 'package:flutter_demo/PostListWidget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> Counter())
      ,ChangeNotifierProvider(create: (_)=> PostList())
    ],
    child: const MyApp(),)
  );
}

class Counter with ChangeNotifier{
  int _count = 0;
  int get count => _count;

  void increment(){
    _count++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});




  final String title;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text("Example"),
     ),
     body: Center(
       child: PostListWidget(),
     ),
     floatingActionButton: FloatingActionButton(
         onPressed: ()=>context.read<Counter>().increment(),
         tooltip: 'Increment',
       key: const Key('increment_floatingActionButton'),
       child: const Icon(Icons.add),
     ),
   );
  }




}

