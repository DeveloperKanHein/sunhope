import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/api_repository/api_repo_singleton.dart';

import '../../data/category.dart';
import '../../data/res_message.dart';

part 'category_event.dart';
part 'category_state.dart';

class GetCategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  GetCategoryBloc() : super(CategoryInitializing()) {
    on<GetCategoryEvent>((event, emit) async {
      await ApiRepoSingleton.instance.categories();
      try {
        emit(CategoryLoading());
        List<Category> categories =
            await ApiRepoSingleton.instance.categories();
        if (categories.isNotEmpty) {
          emit(CategoryLoaded(categories: categories));
        } else {
          emit(CategoryEmpty());
        }
      } catch (e) {
        emit(CategoryError());
      }
    });
  }
}

class CreateCategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CreateCategoryBloc() : super(CategoryInitializing()) {
    on<CreateCategoryEvent>((event, emit) async {
      try {
        emit(CategoryCreating());
        ResMessage categories =
            await ApiRepoSingleton.instance.createCategory(event.category);
        emit(CategoryCreated());
      } catch (e) {
        emit(CategoryError());
      }
    });
  }
}

class UpdateCategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  UpdateCategoryBloc() : super(CategoryInitializing()) {
    on<UpdateCategoryEvent>((event, emit) async {
      try {
        emit(CategoryUpdating());
        ResMessage res =
            await ApiRepoSingleton.instance.updateCategory(event.category);
        emit(CategoryUpdated());
      } catch (e) {
        emit(CategoryError());
      }
    });
  }
}
