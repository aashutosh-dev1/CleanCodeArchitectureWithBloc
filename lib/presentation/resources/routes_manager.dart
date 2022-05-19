import 'package:flutter/material.dart';
import 'package:online_shop_app/data/models/food_model.dart';
import 'package:online_shop_app/presentation/resources/app_strings.dart';
import 'package:online_shop_app/presentation/screens/cart_screen.dart';
import 'package:online_shop_app/presentation/screens/home_screen.dart';
import 'package:online_shop_app/presentation/screens/item_detail_screen.dart';
import 'package:online_shop_app/presentation/screens/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String homePage = "/homePage";
  static const String detailPage = "/detailPage";
  static const String cartPage = "/cartPage";
}

class RouteGenerator {
  static Route<dynamic> getRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.detailPage:
        final args = routeSettings.arguments as FoodModel;
        return MaterialPageRoute(
          builder: (_) => ItemDetailScreen(
            foodModel: args,
          ),
        );
      case Routes.cartPage:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
