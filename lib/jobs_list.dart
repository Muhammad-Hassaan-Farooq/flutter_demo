import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/job.dart';
import 'package:http/http.dart' as http;

Future<List<Job>> fetchJobs() async{
    final res = await http.get(Uri.parse("https://mpa0771a40ef48fcdfb7.free.beeceptor.com/jobs"));

    if (res.statusCode == 200) {
        final data = jsonDecode(utf8.decode(res.body.codeUnits));
        List<Job> jobs = (data['data'] as List).map((jobData) {
                return Job.fromJson(jobData['job']);
                }).toList();
        return jobs;
    }
    else{
        throw Exception("failed to load jobs");
    }

}

String parseDate(DateTime date){
    Duration diff = DateTime.now().difference(date);
    if(diff.inDays > 30) {
        return "${diff.inDays~/30} ${diff.inDays~/30 == 1 ? "month" : "months"} ago";
    }else if (diff.inDays > 0) {
        return "${diff.inDays} ${diff.inDays == 1 ? 'day' : 'days'} ago";
    } else if (diff.inHours > 0) {
        return "${diff.inHours} ${diff.inHours == 1 ? 'hour' : 'hours'} ago";
    } else if (diff.inMinutes > 0) {
        return "${diff.inMinutes} ${diff.inMinutes == 1 ? 'minute' : 'minutes'} ago";
    } else {
        return "just now";
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
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                            side: const BorderSide(
                                                width: 2,
                                                color: Color(0xfff7f7f7)
                                                )
                                            ),
                                        color: Colors.white,
                                        key: ValueKey(index),
                                        child: ListTile(
                                            leading: ClipRRect(
                                                borderRadius:BorderRadius.circular(5),
                                                child: Image.network(
                                                    snapshot.data![index].logo,
                                                    fit: BoxFit.fill,
                                                ),
                                            ),
                                            title: Text(
                                                snapshot.data![index].title,
                                                style: const TextStyle(fontWeight: FontWeight.bold),
                                                ),
                                            subtitle: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start
                                                ,children:<Widget> [
                                                Text(snapshot.data![index].company),
                                                Text("${snapshot.data![index].location}.${snapshot.data![index].preference }.${snapshot.data![index].type }"),
                                                Row(mainAxisAlignment: MainAxisAlignment.end,children: [Text(parseDate(snapshot.data![index].updatedDate))],)  
                                                ],),

                                            ),
                                        );
                        } );
                        }
                        else if(snapshot.hasError){
                            return const Text("Error Loading jobs");}
                        return const CircularProgressIndicator();
                    }),
                );
        }

}
