import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/category_bloc/category_bloc.dart';
import 'package:news_app/models/category_model.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryBloc _categoryBloc = BlocProvider.of<CategoryBloc>(context);
    _categoryBloc.add(GetCategoryEvent());
    return BlocBuilder<CategoryBloc, CategoryState>(
        builder: (BuildContext context, CategoryState catstate) {
      if (catstate is CategoryLoadingState) {
        return const CircularProgressIndicator();
      } else if (catstate is CategoryLoadedState) {
        List<CategoryModel> catList = catstate.categoryList;
        return Container(
            padding: const EdgeInsets.all(7),
            margin: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
              color: Color(0xFFf2f3f4),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<CategoryBloc>(context).add(
                              SelectCategoryEvent(
                                  selectedId: "0", catList: catList));
                        },
                        child: const CategoryPill(
                          categoryName: "Latest",
                        ),
                      )
                    ] +
                    catList
                        .map((e) => GestureDetector(
                              onTap: () {
                                BlocProvider.of<CategoryBloc>(context).add(
                                    SelectCategoryEvent(
                                        selectedId: e.id ?? "0",
                                        catList: catList));
                              },
                              child: CategoryPill(
                                categoryId: e.id,
                                categoryName: e.category,
                              ),
                            ))
                        .toList(),
              ),
            ));
      } else if (catstate is CategoryErrorState) {
        return Center(child: Text(catstate.errorMessage));
      } else if (catstate is CategorySelectedState) {
        return const CircularProgressIndicator();
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}

class CategoryPill extends StatelessWidget {
  const CategoryPill(
      {Key? key, this.categoryId, this.categoryName, this.isSelected = false})
      : super(key: key);
  final String? categoryId;
  final String? categoryName;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color(0xFFf2f3f4),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(categoryName ?? ""));
  }
}
