import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/category_model.dart';

import 'category_bloc/category_bloc.dart';

class CategoryRow extends StatelessWidget {
  CategoryRow({
    Key? key,
  }) : super(key: key);

  CategoryBloc? _categoryBloc;
  @override
  Widget build(BuildContext context) {
    _categoryBloc = BlocProvider.of<CategoryBloc>(context);
    _categoryBloc?.add(GetCategoryEvent());
    return BlocBuilder<CategoryBloc, CategoryState>(
        builder: (BuildContext context, CategoryState state) {
      if (state is CategoryLoadingState) {
        return const CircularProgressIndicator();
      } else if (state is CategoryLoadedState) {
        List<CategoryModel> catList = state.categoryList;
        return Container(
          width: 250,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.only(left: 10),
          decoration: const BoxDecoration(
            color: Color(0xFFf2f3f4),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
          // child: ListView.builder(
          //   physics: const BouncingScrollPhysics(),
          //   scrollDirection: Axis.horizontal,
          //   itemCount: catList.length,
          //   itemBuilder: (context, index) => CategoryPill(
          //     categoryId: catList[index].id,
          //     categoryName: catList[index].category,
          //   ),
          // ),
        );
      } else if (state is CategoryErrorState) {
        return Center(child: Text(state.errorMessage));
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
    return GestureDetector(
      onTap: () {
        // ignore: avoid_print
        // print(id);
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : const Color(0xFFf2f3f4),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(categoryName ?? "")),
    );
  }
}
