import 'package:online_shop_app/data/models/food_model.dart';

abstract class FetchItemRepository {
  List<FoodModel> fetchBakeryItems();
}
