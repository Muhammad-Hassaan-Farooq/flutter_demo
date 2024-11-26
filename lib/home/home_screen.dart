import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/auth/AuthService.dart';

class HomePage extends StatelessWidget {
  final Set<void> Function(String screen) redirect;

  const HomePage({required this.redirect, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home screen"),
          actions: [
            IconButton(
                onPressed: () {
                  redirect("Add");
                },
                icon: const Icon(Icons.add)),
            ElevatedButton(
                onPressed: () async {
                  await AuthService().signOutWithGoogle();
                  redirect("Google");
                },
                child: const Text("Log out")),
          ],
        ),
        body: new StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("friends").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text(snapshot.toString());
              } else {
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data?.docs[index]
                          as DocumentSnapshot<Object?>;

                      return Card(
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(ds["name"]),
                              IconButton(
                                  onPressed: () async {
                                    _showMyDialog(context, ds);
                                  },
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                          subtitle: Text(ds["email"]),
                        ),
                      );
                    });
              }
            }));
  }
}

Future<void> _showMyDialog(context, doc) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete'),
        content: const Text("Are you sure you wanna delete?"),
        actions: <Widget>[
          TextButton(
            child: const Text('Delete'),
            onPressed: () async{
              Navigator.of(context).pop();
              await FirebaseFirestore.instance
                  .collection("friends")
                  .doc(doc.id)
                  .delete();

            },
          ),
          TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      );
    },
  );
}
