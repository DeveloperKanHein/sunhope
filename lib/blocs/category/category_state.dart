part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class CategoryInitializing extends CategoryState {
  //
}

//GET
class CategoryLoading extends CategoryState {
  //
}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;
  CategoryLoaded({required this.categories});
}

class CategoryEmpty extends CategoryState {
  //
}

//CREATE
class CategoryCreating extends CategoryState {
  //
}

class CategoryCreated extends CategoryState {
  //
}

class CategoryUpdating extends CategoryState {
  //
}

class CategoryUpdated extends CategoryState {
  //
}

class CategoryError extends CategoryState {
  //
}
