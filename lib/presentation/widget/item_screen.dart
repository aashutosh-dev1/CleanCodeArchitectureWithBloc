import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/app/di.dart';
import 'package:online_shop_app/presentation/blocs/fetch_item_bloc/fetch_item_bloc.dart';
import 'package:online_shop_app/presentation/cubit/add_remove_cubit/increment_cubit.dart';
import 'package:online_shop_app/presentation/resources/app_size.dart';
import 'package:online_shop_app/presentation/resources/color_manager.dart';
import 'package:online_shop_app/presentation/resources/routes_manager.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  final FetchItemBloc _fetchItemBloc = instance<FetchItemBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _fetchItemBloc,
      child: BlocBuilder<FetchItemBloc, FetchItemState>(
        bloc: _fetchItemBloc..add(const GetItem()),
        builder: (context, state) {
          if (state is FetchItemLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FetchItemLoaded) {
            return Flexible(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: AppSize.a8,
                crossAxisSpacing: AppSize.a8,
                children: List.generate(state.listModel.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        context.read<IncrementCubit>().resetQuantity();
                        Navigator.pushNamed(context, Routes.detailPage,
                            arguments: state.listModel[index]);
                      },
                      child: Card(
                        semanticContainer: true,
                        color: ColorManager.primary,
                        elevation: AppSize.a4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.a8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 130,
                              width: double.maxFinite,
                              child: Image.asset(
                                state.listModel[index].image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppSize.a8, top: AppSize.a6),
                              child: Text(
                                state.listModel[index].name ?? "",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: AppSize.a16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                    state.listModel[index].price.toString())),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );
          }
          if (state is FetchItemError) {
            return Center(
              child: Text(
                state.error.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }
          return Center(
            child: Text(
              state.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        },
      ),
    );
  }
}
