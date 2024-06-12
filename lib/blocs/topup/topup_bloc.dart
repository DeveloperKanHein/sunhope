import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sunhope_computer_software/api_repository/api_repo_singleton.dart';
import 'package:sunhope_computer_software/data/topup_req.dart';

import '../../data/topup_history.dart';
import '../../data/topup_req.dart';

part 'topup_event.dart';
part 'topup_state.dart';

class TopupBloc extends Bloc<TopupEvent, TopupState> {
  TopupBloc() : super(TopupInitializing()) {
    on<TopupEvent>((event, emit) async {
      if (event is FillTopupEvent) {
        try {
          emit(TopupFilling());
          final res = await ApiRepoSingleton.instance.topup(event.req);
          emit(TopupFillSuccess());
        } catch (e) {
          emit(TopupFillError());
        }
      }
    });
  }
}

class GetTopupHistoryBloc extends Bloc<TopupEvent, TopupState> {
  GetTopupHistoryBloc() : super(TopupInitializing()) {
    on<TopupEvent>((event, emit) async {
      if (event is GetTopupHistoryEvent) {
        try {
          emit(TopupHistoryLoading());
          final res = await ApiRepoSingleton.instance.topupHistories();
          emit(TopupHistoryLoaded(histories: res));
        } catch (e) {
          emit(TopupHistoryError());
        }
      } else if (event is GetCustomerTopupHistoryEvent) {
        try {
          emit(TopupHistoryLoading());
          final res = await ApiRepoSingleton.instance
              .customerTopupHistories(event.customer);
          emit(TopupHistoryLoaded(histories: res));
        } catch (e) {
          emit(TopupHistoryError());
        }
      }
    });
  }
}
