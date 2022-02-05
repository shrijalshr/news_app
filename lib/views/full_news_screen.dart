import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:news_app/blocs/category_bloc/category_bloc.dart';
import 'package:news_app/blocs/full_news_blocs/fullnews_bloc.dart';
import 'package:news_app/widgets/category_row.dart';
import 'package:news_app/utils/my_extensions.dart';

class FullNewsScreen extends StatelessWidget {
  const FullNewsScreen({Key? key, required this.newsId, this.category})
      : super(key: key);
  final int newsId;
  final String? category;
  @override
  Widget build(BuildContext context) {
    FullNewsBloc fullNewsBloc = BlocProvider.of<FullNewsBloc>(context);
    fullNewsBloc.id = newsId;
    fullNewsBloc.add(StartFullNewsEvent());
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BlocBuilder<FullNewsBloc, FullNewsState>(builder: (context, state) {
              if (state is FullNewsLoadedState) {
                final catId = state.fullNews.categoryId;
                return CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      expandedHeight: size.height * .4,
                      stretch: true,
                      floating: false,
                      flexibleSpace: SizedBox(
                        height: size.height * .4,
                        child: Image.asset(
                          "assets/images/image1.png",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Transform(
                            transform: Matrix4.translationValues(
                                0, -size.height * .0, 0),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CategoryPill(
                                    categoryName: category ?? "Anime",
                                    isSelected: false,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    state.fullNews.title ??
                                        "Demon Slayer: Zenitsu Demon Slayer: Zenitsu Demon Slayer: Zenitsu Demon Slayer: Zenitsu ",
                                    style: theme.textTheme.headline1,
                                  ).verticalPadding(10, 10),
                                  Row(
                                    children: [
                                      ClipOval(
                                        child: SizedBox(
                                          height: 24,
                                          child: Image.asset(
                                            "assets/images/image2.jpg",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          state.fullNews.username ??
                                              "Shrijal Shrestha",
                                          style: theme.textTheme.subtitle1)
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Html(
                                    data: state.fullNews.content ??
                                        "This means nothing in an inner circle can know anything at all about something in an outer circle. i.e. the inner circle shouldn’t depend on anything in the outer circle. The Black arrows represented in the diagram show the dependency rule. \n This is the important rule that makes this architecture work. Also, this is hard to understand. So I’m gonna break this rule at first to let you understand what problems it brings and then explain and let’s see how to keep up with this rule. So please bear with me.This means nothing in an inner circle can know anything at all about something in an outer circle. i.e. the inner circle shouldn’t depend on anything in the outer circle. The Black arrows represented in the diagram show the dependency rule. \n This is the important rule that makes this architecture work. Also, this is hard to understand. So I’m gonna break this rule at first to let you understand what problems it brings and then explain and let’s see how to keep up with this rule. So please bear with me.This means nothing in an inner circle can know anything at all about something in an outer circle. i.e. the inner circle shouldn’t depend on anything in the outer circle. The Black arrows represented in the diagram show the dependency rule. \n This is the important rule that makes this architecture work. Also, this is hard to understand. So I’m gonna break this rule at first to let you understand what problems it brings and then explain and let’s see how to keep up with this rule. So please bear with me.This means nothing in an inner circle can know anything at all about something in an outer circle. i.e. the inner circle shouldn’t depend on anything in the outer circle. The Black arrows represented in the diagram show the dependency rule. \n This is the important rule that makes this architectur  e work. Also, this is hard to understand. So I’m gonna break this rule at first to let you understand what problems it brings and then explain and let’s see how to keep up with this rule. So please bear with me.This means nothing in an inner circle can know anything at all about something in an outer circle. i.e. the inner circle shouldn’t depend on anything in the outer circle. The Black arrows represented in the diagram show the dependency rule. \n This is the important rule that makes this architecture work. Also, this is hard to understand. So I’m gonna break this rule at first to let you understand what problems it brings and then explain and let’s see how to keep up with this rule. So please bear with me.This means nothing in an inner circle can know anything at all about something in an outer circle. i.e. the inner circle shouldn’t depend on anything in the outer circle. The Black arrows represented in the diagram show the dependency rule. \n This is the important rule that makes this architecture work. Also, this is hard to understand. So I’m gonna break this rule at first to let you understand what problems it brings and then explain and let’s see how to keep up with this rule. So please bear with me.",
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              } else if (state is FullNewsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FullNewsErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return const Center(
                  child: Text("I dont know what state I am in."),
                );
              }
            }),
            Positioned(
              top: 20,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white70.withOpacity(.8),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.arrow_back_rounded,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Home",
                        style: theme.textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
