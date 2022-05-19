import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/data/models/food_model.dart';
import 'package:online_shop_app/presentation/blocs/add_to_cart/add_to_cart_bloc.dart';
import 'package:online_shop_app/presentation/cubit/add_remove_cubit/increment_cubit.dart';
import 'package:online_shop_app/presentation/resources/app_size.dart';

import '../resources/routes_manager.dart';

class CartItemsWidget extends StatefulWidget {
  final FoodModel foodModel;
  const CartItemsWidget({Key? key, required this.foodModel}) : super(key: key);

  @override
  State<CartItemsWidget> createState() => _CartItemsWidgetState();
}

class _CartItemsWidgetState extends State<CartItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          context.read<IncrementCubit>().resetQuantity();
          Navigator.pushNamed(context, Routes.detailPage,
              arguments: widget.foodModel);
        },
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                      width: 100.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(widget.foodModel.image!)))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.foodModel.name!,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Row(
                      children: [
                        Text(
                          "€" + widget.foodModel.price!.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    BlocProvider.of<AddToCartBloc>(context).add(
                        RemoveFromCartInitialEvent(
                            widget.foodModel, widget.foodModel.name!));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red.shade900,
                      borderRadius: BorderRadius.circular(AppSize.a4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Remove',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: AppSize.a24,
                            ),
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  width: AppSize.a16,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
