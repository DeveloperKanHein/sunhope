part of 'shop_bloc.dart';

abstract class ShopEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetShopEvent extends ShopEvent {
  //
}

class CreateShopEvent extends ShopEvent {
  final Shop shop;
  CreateShopEvent({required this.shop});
}

class UpdateShopEvent extends ShopEvent {
  //
}
