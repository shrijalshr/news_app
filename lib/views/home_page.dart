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

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  NewsBloc? _newsBloc;
  @override
  Widget build(BuildContext context) {
    _newsBloc = BlocProvider.of<NewsBloc>(context);
    _newsBloc?.add(StartEvent());
    final theme = Theme.of(context);
    final formatDate = DateFormat("E, MMMM D ");
    final today = formatDate.format(DateTime.now());
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
                    return DashContainer(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://images.pexels.com/photos/5662857/pexels-photo-5662857.png?auto=compress&cs=tinysrgb&dpr=1&w=500",
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xFFf2f3f4),
                                    ),
                                    child: Text(
                                      "Politics",
                                      style: theme.textTheme.subtitle1,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    newsList[index].title ?? "null",
                                    style: theme.textTheme.headline6!.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "By ${newsList[index].username}",
                                    style: theme.textTheme.subtitle2,
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ).containerPadding().horizontalPadding();
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
