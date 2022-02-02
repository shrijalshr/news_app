part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends NewsEvent {}

class SingleNewsEvent extends NewsEvent {
  final int newsId;

  const SingleNewsEvent({required this.newsId});
}
