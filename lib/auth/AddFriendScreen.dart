import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddFriendScreen extends StatefulWidget {
  final Set<void> Function(String) redirect;

  const AddFriendScreen({super.key,required this.redirect});

  @override
  State<StatefulWidget> createState() => _AddFriendScreen();
}

class _AddFriendScreen extends State<AddFriendScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Firebase app"),leading: IconButton(onPressed: (){widget.redirect("Home");}, icon: const Icon(Icons.arrow_back)),),
        body: Center(
          child: ListView(
            children: [
              Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue
                    ),
                    onPressed: ()async{
                       String name = nameController.text;
                       String email = emailController.text;

                       final friend = {
                         "name":name,
                         "email":email
                       };
                       await FirebaseFirestore.instance.collection("friends").add(friend);
                       widget.redirect("Home");

                    }, child: const Text("Add")),
              )
            ],
          ),
        ));
  }
}