import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_shop_app/data/models/food_model.dart';
import 'package:online_shop_app/domain/usecase/fetch_item_usecase.dart';

part 'fetch_item_event.dart';
part 'fetch_item_state.dart';

class FetchItemBloc extends Bloc<FetchItemEvent, FetchItemState> {
  final FetchItemUseCase _fetchItemUseCase;

  FetchItemBloc(this._fetchItemUseCase) : super(const FetchItemLoading()) {
    on<GetItem>((event, emit) {
      emit(const FetchItemLoading());
      List<FoodModel> list = _fetchItemUseCase();
      if (list.isNotEmpty) {
        emit(FetchItemLoaded(list));
      } else {
        emit(const FetchItemError('List Is Empty'));
      }
    });
  }
}
