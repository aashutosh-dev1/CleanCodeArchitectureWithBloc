import 'package:online_shop_app/data/models/food_model.dart';
import 'package:online_shop_app/presentation/resources/assets_manager.dart';

class MockData {
  List<FoodModel> listOfItems = [
    const FoodModel(
        image: ImageAsset.bagelImage,
        name: 'Bagel',
        nutrientsValue: ['Lorem ipsum 1', 'Lorem ipsum 2', 'Lorem ipsum 3'],
        price: 0.75),
    const FoodModel(
      image: ImageAsset.burgerImage,
      name: 'Burger',
      nutrientsValue: ['Lorem ipsum 3', 'Lorem ipsum 4'],
      price: 1.25,
    ),
    const FoodModel(
      image: ImageAsset.pizzaImage,
      name: 'Pizza',
      nutrientsValue: ['Lorem ipsum 5', 'Lorem ipsum 6'],
      price: 2.0,
    ),
    const FoodModel(
      image: ImageAsset.wheatImage,
      name: 'Wheat',
      nutrientsValue: ['Lorem ipsum 7', 'Lorem ipsum 8'],
      price: 3.0,
    ),
    const FoodModel(
        image: ImageAsset.bagelImage,
        name: 'Bagel 1',
        nutrientsValue: ['Lorem ipsum 1', 'Lorem ipsum 2', 'Lorem ipsum 3'],
        price: 0.75),
    const FoodModel(
      image: ImageAsset.burgerImage,
      name: 'Burger 1',
      nutrientsValue: ['Lorem ipsum 3', 'Lorem ipsum 4'],
      price: 1.25,
    ),
    const FoodModel(
      image: ImageAsset.pizzaImage,
      name: 'Pizza 1',
      nutrientsValue: ['Lorem ipsum 5', 'Lorem ipsum 6'],
      price: 2.0,
    ),
    const FoodModel(
      image: ImageAsset.wheatImage,
      name: 'Wheat 1',
      nutrientsValue: ['Lorem ipsum 7', 'Lorem ipsum 8'],
      price: 3.0,
    ),
    const FoodModel(
        image: ImageAsset.bagelImage,
        name: 'Bagel 2',
        nutrientsValue: ['Lorem ipsum 1', 'Lorem ipsum 2', 'Lorem ipsum 3'],
        price: 0.75),
    const FoodModel(
      image: ImageAsset.burgerImage,
      name: 'Burger 2',
      nutrientsValue: ['Lorem ipsum 3', 'Lorem ipsum 4'],
      price: 1.25,
    ),
    const FoodModel(
      image: ImageAsset.pizzaImage,
      name: 'Pizza 2',
      nutrientsValue: ['Lorem ipsum 5', 'Lorem ipsum 6'],
      price: 2.0,
    ),
    const FoodModel(
      image: ImageAsset.wheatImage,
      name: 'Wheat 2',
      nutrientsValue: ['Lorem ipsum 7', 'Lorem ipsum 8'],
      price: 3.0,
    ),
  ];
}
