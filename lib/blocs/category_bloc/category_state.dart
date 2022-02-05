part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  final List<CategoryModel> categoryList;
  final bool isSelected;

  const CategoryLoadedState(
      {required this.categoryList, this.isSelected = false});

  @override
  List<Object> get props => [categoryList];
}

class CategoryErrorState extends CategoryState {
  final String errorMessage;
  const CategoryErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class CategorySelectedState extends CategoryState {}
