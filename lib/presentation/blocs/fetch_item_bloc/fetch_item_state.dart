part of 'fetch_item_bloc.dart';

abstract class FetchItemState extends Equatable {
  const FetchItemState();

  @override
  List<Object> get props => [];
}

class FetchItemInitial extends FetchItemState {}

class FetchItemLoading extends FetchItemState {
  const FetchItemLoading();
}

class FetchItemLoaded extends FetchItemState {
  final List<FoodModel> listModel;
  const FetchItemLoaded(this.listModel);

  @override
  List<Object> get props => [listModel];
}

class FetchItemError extends FetchItemState {
  final String error;
  const FetchItemError(this.error);
  @override
  List<Object> get props => [error];
}
