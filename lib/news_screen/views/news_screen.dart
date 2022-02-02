import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/category/category_row.dart';
import 'package:news_app/utils/circle_clipper.dart';
import 'package:news_app/utils/my_extensions.dart';

class FullNewsScreen extends StatelessWidget {
  const FullNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
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
                        transform:
                            Matrix4.translationValues(0, -size.height * .0, 0),
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
                              Row(
                                children: const [
                                  CategoryPill(
                                    categoryName: "Anime",
                                    isSelected: false,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  CategoryPill(
                                    categoryName: "Demon Slayer",
                                    isSelected: false,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
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
                                  Text("Shrijal Shrestha",
                                      style: theme.textTheme.subtitle2)
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "This means nothing in an inner circle can know anything at all about something in an outer circle. i.e. the inner circle shouldn’t depend on anything in the outer circle. The Black arrows represented in the diagram show the dependency rule. \n This is the important rule that makes this architecture work. Also, this is hard to understand. So I’m gonna break this rule at first to let you understand what problems it brings and then explain and let’s see how to keep up with this rule. So please bear with me.This means nothing in an inner circle can know anything at all about something in an outer circle. i.e. the inner circle shouldn’t depend on anything in the outer circle. The Black arrows represented in the diagram show the dependency rule. \n This is the important rule that makes this architecture work. Also, this is hard to understand. So I’m gonna break this rule at first to let you understand what problems it brings and then explain and let’s see how to keep up with this rule. So please bear with me.This means nothing in an inner circle can know anything at all about something in an outer circle. i.e. the inner circle shouldn’t depend on anything in the outer circle. The Black arrows represented in the diagram show the dependency rule. \n This is the important rule that makes this architecture work. Also, this is hard to understand. So I’m gonna break this rule at first to let you understand what problems it brings and then explain and let’s see how to keep up with this rule. So please bear with me.This means nothing in an inner circle can know anything at all about something in an outer circle. i.e. the inner circle shouldn’t depend on anything in the outer circle. The Black arrows represented in the diagram show the dependency rule. \n This is the important rule that makes this architecture work. Also, this is hard to understand. So I’m gonna break this rule at first to let you understand what problems it brings and then explain and let’s see how to keep up with this rule. So please bear with me.This means nothing in an inner circle can know anything at all about something in an outer circle. i.e. the inner circle shouldn’t depend on anything in the outer circle. The Black arrows represented in the diagram show the dependency rule. \n This is the important rule that makes this architecture work. Also, this is hard to understand. So I’m gonna break this rule at first to let you understand what problems it brings and then explain and let’s see how to keep up with this rule. So please bear with me.This means nothing in an inner circle can know anything at all about something in an outer circle. i.e. the inner circle shouldn’t depend on anything in the outer circle. The Black arrows represented in the diagram show the dependency rule. \n This is the important rule that makes this architecture work. Also, this is hard to understand. So I’m gonna break this rule at first to let you understand what problems it brings and then explain and let’s see how to keep up with this rule. So please bear with me.",
                                style: theme.textTheme.subtitle1,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 20,
              left: 10,
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
          ],
        ),
      ),
    );
  }
}
