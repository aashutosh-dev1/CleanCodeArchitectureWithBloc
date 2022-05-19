import 'package:online_shop_app/app/di.dart';
import 'package:online_shop_app/data/local/mock_data.dart';
import 'package:online_shop_app/data/models/food_model.dart';
import 'package:online_shop_app/domain/repository/fetch_items_repository.dart';

class FetchItemsRepositoryImpl extends FetchItemRepository {
  @override
  List<FoodModel> fetchBakeryItems() {
    MockData mockData =instance<MockData>();
    return mockData.listOfItems;
  }
}
