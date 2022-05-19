import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/presentation/blocs/add_to_cart/add_to_cart_bloc.dart';
import 'package:online_shop_app/presentation/resources/app_size.dart';
import 'package:online_shop_app/presentation/resources/routes_manager.dart';

class ShopingCartBadge extends StatelessWidget {
  const ShopingCartBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.cartPage);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: AppSize.a8),
        child: Badge(
          position: BadgePosition.topEnd(top: 0, end: AppSize.a2),
          animationDuration: const Duration(milliseconds: 300),
          animationType: BadgeAnimationType.slide,
          badgeContent: Text(
            context.watch<AddToCartBloc>().foodList.length.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.cartPage);
              }),
        ),
      ),
    );
  }
}
