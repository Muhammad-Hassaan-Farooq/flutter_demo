import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/data/Post.dart';
import 'package:http/http.dart' as http;

class ListELement extends StatelessWidget{

  Future<List<Post>> fetchAllPosts() async{
    final response  = await http.get(Uri.parse("https://jsonplaceholder.org/posts"));

    if(response.statusCode == 200){
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((post) => Post.fromJson(post)).toList();

    }
    else{
      throw Exception("Failed to load posts");
    }
  }



  @override
  Widget build(BuildContext context) {
      return Center(child: FutureBuilder(future: fetchAllPosts(),builder: (context,snap){
        if(snap.hasData){
          return ListView.builder(itemBuilder: (context,index){
            return Card(

              key: ValueKey(index),
              child: ListTile(
                leading: Image.network(snap.data![index].image),
                title: Text(snap.data![index].title),
                subtitle: Text(snap.data![index].content,overflow: TextOverflow.ellipsis,),

              ),

            );
          });

        }
        else if(snap.hasError){

          return Text("Error in fetch");
        }
        return const CircularProgressIndicator();

      },),);
  }



}