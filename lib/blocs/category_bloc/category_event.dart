part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetCategoryEvent extends CategoryEvent {}

class SelectCategoryEvent extends CategoryEvent {
  final String selectedId;
  final List<CategoryModel> catList;
  const SelectCategoryEvent({required this.selectedId, required this.catList});

  @override
  List<Object> get props => [selectedId];
}
