import 'package:flutter/material.dart';
import 'package:online_shop_app/presentation/resources/app_size.dart';
import 'package:online_shop_app/presentation/resources/app_strings.dart';
import 'package:online_shop_app/presentation/resources/assets_manager.dart';
import 'package:online_shop_app/presentation/resources/color_manager.dart';
import 'package:online_shop_app/presentation/widget/cart_badge.dart';
import 'package:online_shop_app/presentation/widget/item_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        elevation: AppSize.a2,
        title: const Text(
          AppStrings.homePage,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: const [ShopingCartBadge()],
        centerTitle: true,
      ),
      body: Column(
        children: const [
          ItemScreen(),
        ],
      ),
    );
  }
}
