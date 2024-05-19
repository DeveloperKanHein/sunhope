import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sunhope_computer_software/api_repository/api_repo_singleton.dart';
import 'package:sunhope_computer_software/data/fill_topup.dart';

part 'topup_event.dart';
part 'topup_state.dart';

class TopupBloc extends Bloc<TopupEvent, TopupState> {
  TopupBloc() : super(TopupInitializing()) {
    on<TopupEvent>((event, emit) async {
      if (event is FillTopupEvent) {
        try {
          emit(TopupFilling());
          final res = await ApiRepoSingleton.instance
              .topup(FillTopup(id: event.customerId, amount: event.amount));
          emit(TopupFillSuccess());
        } catch (e) {
          emit(TopupFillError());
        }
      }
    });
  }
}
