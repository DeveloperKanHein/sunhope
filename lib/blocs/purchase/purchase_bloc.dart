import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunhope_computer_software/api_repository/api_repo_singleton.dart';
import 'package:sunhope_computer_software/constants/const_api_routes.dart';
import 'package:sunhope_computer_software/data/purchase.dart';
import 'package:sunhope_computer_software/data/res_message.dart';

part 'purchase_event.dart';
part 'purchase_state.dart';

class CreatePurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  CreatePurchaseBloc() : super(PurchaseInitializing()) {
    on<CreatePurchaseEvent>((event, emit) async {
      try {
        emit(PurchaseCreating());
        final res = await ApiRepoSingleton.instance.purchase(event.purchase);
        if (res.status == ConstApiRoutes.success) {
          emit(PurchaseCreated());
        } else {
          emit(PurchaseFail(message: res));
        }
      } catch (e) {
        emit(PurchaseError());
      }
    });
  }
}
