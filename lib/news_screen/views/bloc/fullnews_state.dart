part of 'fullnews_bloc.dart';

abstract class FullNewsState extends Equatable {
  const FullNewsState();

  @override
  List<Object> get props => [];
}

class FullNewsInitialState extends FullNewsState {
  final int id;
  const FullNewsInitialState({required this.id});

  @override
  List<Object> get props => [id];
}

class FullNewsLoadingState extends FullNewsState {}

class FullNewsLoadedState extends FullNewsState {
  final NewsModel fullNews;
  const FullNewsLoadedState({required this.fullNews});

  @override
  List<Object> get props => [fullNews];
}

class FullNewsErrorState extends FullNewsState {
  final String errorMessage;
  const FullNewsErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
