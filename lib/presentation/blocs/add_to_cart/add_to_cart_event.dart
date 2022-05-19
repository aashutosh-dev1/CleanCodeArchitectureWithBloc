part of 'add_to_cart_bloc.dart';

abstract class AddToCartEvent extends Equatable {
  const AddToCartEvent();

  @override
  List<Object> get props => [];
}

class AddToCartInitialEvent extends AddToCartEvent {
  final FoodModel foodModel;

  const AddToCartInitialEvent(this.foodModel);
}

class RemoveFromCartInitialEvent extends AddToCartEvent {
  final FoodModel foodModel;
  final String name;

  const RemoveFromCartInitialEvent(this.foodModel,this.name);
}
