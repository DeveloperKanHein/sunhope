part of 'shop_bloc.dart';

abstract class ShopState extends Equatable {
  @override
  List<Object> get props => [];
}

class ShopInitializing extends ShopState {
  //
}

//GET
class ShopLoading extends ShopState {
  //
}

class ShopLoaded extends ShopState {
  final List<Shop> shops;
  ShopLoaded({required this.shops});
}

class ShopEmpty extends ShopState {
  //
}

//CREATE
class ShopCreating extends ShopState {
  //
}

class ShopCreated extends ShopState {
  //
}

class ShopUpdating extends ShopState {
  //
}

class ShopUpdated extends ShopState {
  //
}

class ShopError extends ShopState {
  //
}
