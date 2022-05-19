import 'package:online_shop_app/app/base_use_case.dart';
import 'package:online_shop_app/domain/repository/fetch_items_repository.dart';

class FetchItemUseCaseInput {}

class FetchItemUseCase implements BaseUseCase<FetchItemUseCaseInput, dynamic> {
  final FetchItemRepository fetchItemRepository;
  FetchItemUseCase(this.fetchItemRepository);
  @override
  call() {
    return fetchItemRepository.fetchBakeryItems();
  }
}
