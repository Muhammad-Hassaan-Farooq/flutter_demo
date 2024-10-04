import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/job.dart';
import 'package:http/http.dart' as http;

Future<List<Job>> fetchJobs() async{
    final res = await http.get(Uri.parse("https://mpa0771a40ef48fcdfb7.free.beeceptor.com/jobs"));

    if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        List<Job> jobs = (data['data'] as List).map((jobData) {
                return Job.fromJson(jobData['job']);
                }).toList();
        return jobs;
    }
    else{
        throw Exception("failed to load jobs");
    }

}


class JobsList extends StatefulWidget{
    const JobsList({super.key});

    @override
        State<StatefulWidget> createState()  => _JobsList();
}

class _JobsList extends State<JobsList>{

    late Future<List<Job>> jobs;
    @override
        void initState() {
            super.initState();
            jobs = fetchJobs();
        }

    @override
        Widget build(BuildContext context) {
            return      Center(
                    child: FutureBuilder(future: jobs, builder: (context,snapshot){
                        if (snapshot.hasData) {
                        return ListView.builder(itemCount: snapshot.data!.length,itemBuilder:(context,index){
                                return Card(
                                        key: ValueKey(index),
                                        child: ListTile(
                                            leading: CircleAvatar(radius: 20,backgroundImage: NetworkImage(snapshot.data![index].logo)),
                                            title: Text(snapshot.data![index].title),
                                            subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start
                                            ,children:<Widget> [
                                                Text(snapshot.data![index].company),
                                                Text("${snapshot.data![index].location}.${snapshot.data![index].preference }.${snapshot.data![index].type }"),
                                                Row(children: [const Text("test")],mainAxisAlignment: MainAxisAlignment.end,)
                                            ],),

                                            ),
                                        );
                                } );
                        }
                        else if(snapshot.hasError){
                        return Text("Error Loading jobs");}
                        return CircularProgressIndicator();
                        }),
                    );
        }

}
