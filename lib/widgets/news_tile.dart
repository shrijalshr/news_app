import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/category/category_bloc/category_bloc.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/news_article_model.dart';

import 'dash_container.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    Key? key,
    this.title,
    this.imgUrl,
    this.userName,
    this.updatedDate,
    this.categoryId,
  }) : super(key: key);

  final String? title;
  final String? imgUrl;
  final String? userName;
  final String? updatedDate;
  final int? categoryId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                  errorWidget: (context, url, error) => Placeholder(
                    color: Colors.red,
                  ),
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
                  BlocConsumer<CategoryBloc, CategoryState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is CategoryLoadedState) {
                        CategoryModel categoryModel = state.categoryList
                            .singleWhere((element) => element.id == categoryId);
                        final String? categoryTitle = categoryModel.category;
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFf2f3f4),
                          ),
                          child: Text(
                            categoryTitle ?? "Unknown",
                            style: theme.textTheme.subtitle2,
                          ),
                        );
                      } else if (state is CategoryErrorState) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFf2f3f4),
                          ),
                          child: Text(
                            "Unknown",
                            style: theme.textTheme.subtitle2,
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title ?? "null",
                    style: theme.textTheme.headline6!
                        .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "By $userName",
                    style: theme.textTheme.subtitle2,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
