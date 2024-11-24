import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/news/bloc/news_bloc.dart';
import 'package:flutter_demo/news/views/article_list.dart';
import 'package:flutter_demo/news/views/shimmer_list.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffff9ff),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          elevation: 1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    style: TextStyle(fontWeight: FontWeight.bold)
                      ,"Headline News"
                  ),
                  Text(
                      style: TextStyle(fontSize: 15),
                      "Read Top News Today")
                ],
              ),
              IconButton(
                  onPressed:()=>{},
                  icon: Image.asset(
                      height: 50, // Adjust height
                      width: 50,
                      "assets/newspaper.png"))
            ],
          )),
      body: Center(
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state == const NewsLoading()) {
              context.read<NewsBloc>().add(const FetchNews());
            }
            switch (state) {
              case NewsLoaded():
                return ArticleList(articles: state.articles);
              case NewsLoading():
                return const ShimmerList();
              case NewsError():
                return const Text("Error");
            }
          },
        ),
      ),
    );
  }
}
