part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCategoryEvent extends CategoryEvent {
  //
}

class CreateCategoryEvent extends CategoryEvent {
  final Category category;
  CreateCategoryEvent({required this.category});
}

class UpdateCategoryEvent extends CategoryEvent {
  final Category category;
  UpdateCategoryEvent({required this.category});
}
