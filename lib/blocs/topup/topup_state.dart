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
