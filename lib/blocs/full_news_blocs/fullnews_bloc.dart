import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/repositories/news_repository.dart';

part 'fullnews_event.dart';
part 'fullnews_state.dart';

class FullNewsBloc extends Bloc<FullnewsEvent, FullNewsState> {
  NewsRepository _newsRepository = NewsRepository();
  int? id;

  FullNewsBloc() : super(const FullNewsInitialState()) {
    on<FullnewsEvent>((event, emit) async {
      if (id != null) {
        emit(FullNewsLoadingState());
        await _newsRepository
            .fetchNews(id!)
            .then((value) => emit(FullNewsLoadedState(fullNews: value)))
            .onError((error, stackTrace) =>
                emit(FullNewsErrorState(errorMessage: error.toString())));
      } else {
        emit(const FullNewsErrorState(
            errorMessage: "Sorry could not fetch data"));
      }
    });
  }
}
