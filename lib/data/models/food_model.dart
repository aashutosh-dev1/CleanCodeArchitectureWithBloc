import 'package:equatable/equatable.dart';

class FoodModel extends Equatable {
  final String? image;
  final String? name;
  final double? price;
  final List<String>? nutrientsValue;

  const FoodModel({this.image, this.name, this.price, this.nutrientsValue});

  @override
  List<Object?> get props => [
        image,
        name,
        price,
        nutrientsValue,
      ];
}
