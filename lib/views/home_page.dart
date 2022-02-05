import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/blocs/news_bloc/bloc/news_bloc.dart';
import 'package:news_app/category/category_row.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/news_article_model.dart';
import 'package:news_app/widgets/dash_container.dart';

import 'package:news_app/utils/my_extensions.dart';
import 'package:news_app/widgets/news_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  NewsBloc? _newsBloc;
  @override
  Widget build(BuildContext context) {
    _newsBloc = BlocProvider.of<NewsBloc>(context);
    _newsBloc?.add(StartEvent());
    final formatDate = DateFormat("E, MMMM D ");
    final today = formatDate.format(DateTime.now());
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final double appBarHeight = size.height * .3;
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  collapsedHeight: kToolbarHeight,
                  backgroundColor: Colors.transparent,
                  expandedHeight: appBarHeight,
                  flexibleSpace: LayoutBuilder(builder: (context, constraints) {
                    double percent = ((constraints.maxHeight - kToolbarHeight) /
                        (appBarHeight - kToolbarHeight));

                    return Container(
                      height: appBarHeight -
                          MediaQuery.of(context).viewPadding.top -
                          MediaQuery.of(context).viewPadding.bottom,
                      width: double.infinity,
                      color: percent == 0 ? Colors.white : Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "News App",
                              style: theme.textTheme.headline2,
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            transform: Matrix4.identity()
                              ..scale(percent, percent),
                            child: Opacity(
                              opacity: percent,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20.0,
                                        left: 20,
                                        bottom: 10,
                                      ),
                                      child: Text(
                                        today,
                                        style: theme.textTheme.subtitle1,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 20.0, left: 20),
                                      child: Text(
                                        "Good Morning",
                                        style: theme.textTheme.headline1,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          CategoryRow(),
                        ],
                      ),
                    );
                  }),
                )
              ];
            },
            body: BlocBuilder<NewsBloc, NewsState>(
                builder: (BuildContext context, NewsState state) {
              if (state is NewsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NewsLoadedState) {
                List<NewsArticleModel> newsList = [];
                newsList = state.newsList;

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return NewsTile(
                      title: newsList[index].title,
                      categoryId: newsList[index].categoryId,
                      imgUrl: newsList[index].image,
                      userName: newsList[index].username,
                    ).containerPadding();
                  },
                );
              } else if (state is NewsErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })),
      ),
    );
  }
}
