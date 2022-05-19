import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/presentation/blocs/add_to_cart/add_to_cart_bloc.dart';
import 'package:online_shop_app/presentation/resources/color_manager.dart';

import '../widget/cart_items.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: ColorManager.primary,
          title: const Text(
            'My Cart',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: context.watch<AddToCartBloc>().foodList.length,
          itemBuilder: (context, index) {
            return CartItemsWidget(
              foodModel: context.watch<AddToCartBloc>().foodList[index],
            );
          },
        ));
  }
}
