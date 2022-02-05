part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetCategoryEvent extends CategoryEvent {}

class SelectCategoryEvent extends CategoryEvent {
  final int selectedId;

  const SelectCategoryEvent(this.selectedId);

  @override
  List<Object> get props => [selectedId];
}
