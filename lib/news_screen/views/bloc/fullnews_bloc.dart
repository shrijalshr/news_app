import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fullnews_event.dart';
part 'fullnews_state.dart';

class FullnewsBloc extends Bloc<FullnewsEvent, FullnewsState> {
  FullnewsBloc() : super(FullnewsInitial()) {
    on<FullnewsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
