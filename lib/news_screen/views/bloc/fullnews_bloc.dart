import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/repositories/news_repository.dart';

part 'fullnews_event.dart';
part 'fullnews_state.dart';

class FullnewsBloc extends Bloc<FullnewsEvent, FullNewsState> {
  NewsRepository _newsRepository = NewsRepository();
  final int id;

  FullnewsBloc(this.id) : super(FullNewsInitialState(id: id)) {
    on<FullnewsEvent>((event, emit) async {
      await _newsRepository
          .fetchNews(id)
          .then((value) => emit(FullNewsLoadedState(fullNews: value)))
          .onError((error, stackTrace) =>
              emit(FullNewsErrorState(errorMessage: error.toString())));
    });
  }
}
