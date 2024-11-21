
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/news/cubit/news_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NewsPage extends StatelessWidget{

  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: Text("News")),
      body: Center(
        child: BlocBuilder<NewsCubit,NewsState>(
          builder: (context,state){

            print(state.status);

            if(state.status == NewsStatus.loading){

              //context.read<NewsCubit>().fetchNews();
            }

            return switch(state.status){

              NewsStatus.loading => Text("Loading"),
              NewsStatus.error => Text("Error"),
              NewsStatus.success => Text("Success"),

            };
          },
        ),
      ),
    );

  }

}