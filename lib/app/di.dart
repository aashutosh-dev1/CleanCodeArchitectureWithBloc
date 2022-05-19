import 'package:get_it/get_it.dart';
import 'package:online_shop_app/data/local/mock_data.dart';
import 'package:online_shop_app/data/repository/fetch_items_repository_impl.dart';
import 'package:online_shop_app/domain/repository/fetch_items_repository.dart';
import 'package:online_shop_app/domain/usecase/fetch_item_usecase.dart';
import 'package:online_shop_app/presentation/blocs/add_to_cart/add_to_cart_bloc.dart';
import 'package:online_shop_app/presentation/blocs/fetch_item_bloc/fetch_item_bloc.dart';
import 'package:online_shop_app/presentation/cubit/add_remove_cubit/increment_cubit.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  instance.registerSingleton<MockData>(MockData());
  instance.registerSingleton<IncrementCubit>(IncrementCubit());
  instance.registerLazySingleton<FetchItemRepository>(
      () => FetchItemsRepositoryImpl());
  instance.registerLazySingleton<FetchItemUseCase>(
      () => FetchItemUseCase(instance()));
  instance.registerSingleton<FetchItemBloc>(FetchItemBloc(instance()));
  instance.registerSingleton<AddToCartBloc>(AddToCartBloc());


}


