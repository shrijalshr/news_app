part of 'fullnews_bloc.dart';

abstract class FullNewsState extends Equatable {
  const FullNewsState();

  @override
  List<Object> get props => [];
}

class FullNewsLoadingState extends FullNewsState {}

class NewsLoadedState extends FullNewsState {}
