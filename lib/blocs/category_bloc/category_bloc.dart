import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/repositories/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryRepository categoryRepository = CategoryRepository();

  CategoryBloc() : super(CategoryInitialState()) {
    on<GetCategoryEvent>(
      (event, emit) async {
        emit(CategoryLoadingState());
        await categoryRepository.fetchCategory().then((value) {
          emit(CategoryLoadedState(categoryList: value));
        }).onError((error, stackTrace) {
          emit(const CategoryErrorState(
              errorMessage: "Could not load category"));
        });
      },
    );
    
    on<SelectCategoryEvent>((event, emit) async {
      emit(CategoryLoadedState(
          selectedId: event.selectedId, categoryList: event.catList));
    });
  }
}
