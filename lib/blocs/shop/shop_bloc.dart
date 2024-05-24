import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/api_repository/api_repo_singleton.dart';
import 'package:sunhope_computer_software/core/log/debug_log.dart';

import '../../data/shop.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class GetShopBloc extends Bloc<GetShopEvent, ShopState> {
  GetShopBloc() : super(ShopInitializing()) {
    on<GetShopEvent>((event, emit) async {
      try {
        emit(ShopLoading());
        List<Shop> shops = await ApiRepoSingleton.instance.shops();
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
        final resMessage =
            await ApiRepoSingleton.instance.createShop(event.shop);
        emit(ShopCreated());
      } catch (e) {
        emit(ShopError());
      }
    });
  }
}

class UpdateShopBloc extends Bloc<UpdateShopEvent, ShopState> {
  UpdateShopBloc() : super(ShopInitializing()) {
    on<UpdateShopEvent>((event, emit) async {
      try {
        emit(ShopUpdating());
        final resMessage =
            await ApiRepoSingleton.instance.updateShop(event.shop);
        emit(ShopUpdated());
      } catch (e) {
        emit(ShopError());
      }
    });
  }
}
