part of 'topup_bloc.dart';

abstract class TopupState extends Equatable {
  @override
  List<Object> get props => [];
}

class TopupInitializing extends TopupState {
  ///
}

class TopupFilling extends TopupState {
  //
}

class TopupFillSuccess extends TopupState {
  //
}

class TopupFillError extends TopupState {
  //
}

class TopupHistoryLoading extends TopupState {
  //
}

class TopupHistoryLoaded extends TopupState {
  final List<TopupHistory> histories;
  TopupHistoryLoaded({required this.histories});
}

class TopupHistoryEmpty extends TopupState {
  //
}

class TopupHistoryError extends TopupState {
  //
}
