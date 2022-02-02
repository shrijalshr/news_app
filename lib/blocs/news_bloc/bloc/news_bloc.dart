import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/models/news_article_model.dart';
import 'package:news_app/repositories/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository newsRepository = NewsRepository();

  NewsBloc() : super(NewsInitial()) {
    on<StartEvent>((event, emit) async {
      emit(NewsLoadingState());
      await newsRepository.fetchNews("/news-list").then((value) {
        emit(NewsLoadedState(newsList: value));
      }).onError((error, stackTrace) {
        emit(const NewsErrorState(errorMessage: "Sorry"));
      });
    });
  }
}
