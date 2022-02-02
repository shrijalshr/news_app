part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}


class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<NewsArticleModel> newsList;
  const NewsLoadedState({required this.newsList});

  @override
  List<Object> get props => [newsList];
}

class NewsErrorState extends NewsState {
  final String errorMessage;
  const NewsErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
