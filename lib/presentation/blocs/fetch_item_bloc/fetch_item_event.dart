part of 'fetch_item_bloc.dart';

abstract class FetchItemEvent extends Equatable {
  const FetchItemEvent();

  @override
  List<Object> get props => [];
}
class GetItem extends FetchItemEvent {
  const GetItem();
}


