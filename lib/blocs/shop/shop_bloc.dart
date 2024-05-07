import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/shop.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class GetShopBloc extends Bloc<ShopEvent, ShopState> {
  GetShopBloc() : super(ShopInitializing()) {
    on<GetShopEvent>((event, emit) async {
      try {
        emit(ShopLoading());
        List<Shop> shops = [];
        if (shops.isNotEmpty) {
          emit(ShopLoaded(shops: shops));
        } else {
          emit(ShopEmpty());
        }
      } catch (e) {
        emit(ShopError());
      }
    });
  }
}

class CreateShopBloc extends Bloc<ShopEvent, ShopState> {
  CreateShopBloc() : super(ShopInitializing()) {
    on<CreateShopEvent>((event, emit) async {
      try {
        emit(ShopCreating());
        emit(ShopCreated());
      } catch (e) {
        emit(ShopError());
      }
    });
  }
}

class UpdateShopBloc extends Bloc<ShopEvent, ShopState> {
  UpdateShopBloc() : super(ShopInitializing()) {
    on<CreateShopEvent>((event, emit) async {
      try {
        emit(ShopUpdating());
        emit(ShopUpdated());
      } catch (e) {
        emit(ShopError());
      }
    });
  }
}
