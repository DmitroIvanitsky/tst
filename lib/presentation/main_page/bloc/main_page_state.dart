part of 'main_page_cubit.dart';

abstract class MainPageState{} //extends Equatable{}

class MainPageStateInitial extends MainPageState {
  @override
  List<Object?> get props => [];
}

class MainPageStateLoading extends MainPageState {
  @override
  List<Object?> get props => [];
}

class MainPageStateSucceed extends MainPageState {
  final List<UserViewModel> models;

  MainPageStateSucceed({required this.models});

  @override
  List<Object?> get props => [models];
}

class MainPageStateFailed extends MainPageState {
  final String error;

  MainPageStateFailed({required this.error});

  @override
  List<Object?> get props => [error];
}
