part of 'add_to_cart_bloc.dart';

abstract class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object> get props => [];
}

class AddToCartInitial extends AddToCartState {}

class AddToCart extends AddToCartState {
  final List<FoodModel> foodList;
  const AddToCart(this.foodList);
}

class RemoveFromCart extends AddToCartState {
  final List<FoodModel> foodList;
  const RemoveFromCart(this.foodList);
}
