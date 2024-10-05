import 'package:flutter/material.dart';
import 'package:flutter_demo/jobs_list.dart';

void main() {
  runApp(const MyApp());
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
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget{

    const MyHomePage({super.key});
    @override
      State<MyHomePage> createState() => _MyHomePage();

}

class _MyHomePage extends State<MyHomePage> {
 
  int _selectedPage = 0;

  final List _pages = <Widget>[
    JobsList(),
     Center(
      child: Text("Resume"),
    ),
     Center(
      child: Text("Settings"),
    ),
  ];

  _changeTab(int index){
    setState(() {
          _selectedPage = index;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Jobs"),
        actions:<Widget>[
            IconButton(onPressed:(){}, icon: const Icon(Icons.notifications_outlined,color: Color(0xff784d81),))
        ],
          ),
         bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: _selectedPage,
            onTap: (index)=>_changeTab(index),
         items:const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
                icon: Icon(Icons.work_outline),
                label: "Jobs"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                label: "Resume"
            ),
            BottomNavigationBarItem(
                 icon: Icon(Icons.settings_outlined),
                 label: "Settings"
            )
         ],),
         body: _pages[_selectedPage],
    );
  }
}
