import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_shop_app/data/models/food_model.dart';

part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  List<FoodModel> foodList = [];

  AddToCartBloc() : super(AddToCartInitial()) {
    on<AddToCartInitialEvent>((event, emit) {
      if (foodList.contains(event.foodModel)) {
      } else {
        foodList.add(event.foodModel);
      }
      emit(AddToCart(foodList.toSet().toList()));
    });

    on<RemoveFromCartInitialEvent>((event, emit) {
      foodList.removeWhere((element) => element.name == event.name);
     
      emit(RemoveFromCart(foodList));
    });
  }
}
