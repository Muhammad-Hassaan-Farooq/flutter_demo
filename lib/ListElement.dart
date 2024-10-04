import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/data/Post.dart';
import 'package:http/http.dart' as http;

class ListElement extends StatefulWidget{
    const ListElement({super.key});
    @override
        State<StatefulWidget> createState() => _ListELement();
}


class _ListELement extends State<ListElement>{  

    List<Post> _posts =[];
    bool isLoading = true;

    Future<void> fetchAllPosts() async{
        try{
            setState(() {
                    isLoading = true;
                    });
            final response  = await http.get(Uri.parse("https://jsonplaceholder.org/posts"));


            if(response.statusCode == 200){
                List jsonResponse = jsonDecode(response.body);
                _posts =  jsonResponse.map((post) => Post.fromJson(post)).toList();

            }
        }
        catch(e){
            throw Exception("Error loading posts");
        }
        finally{
            setState(() {
                    isLoading = false;
                    });
        }
    }


    @override
        void initState() {
            super.initState();
            fetchAllPosts();
        }




    @override
        Widget build(BuildContext context) {

            return isLoading? CircularProgressIndicator() : ListView.builder(itemBuilder: (context,index){
                    return Card(

                            key: ValueKey(index),
                            child: ListTile(
                                leading: Image.network(_posts[index].image),
                                title: Text(_posts[index].title),
                                subtitle: Text(_posts[index].content,overflow: TextOverflow.ellipsis,),

                                ),

                            );
                    });

        }



}
