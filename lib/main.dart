import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/app/di.dart';
import 'package:online_shop_app/presentation/blocs/add_to_cart/add_to_cart_bloc.dart';
import 'package:online_shop_app/presentation/resources/color_manager.dart';
import 'package:online_shop_app/presentation/resources/routes_manager.dart';

import 'presentation/cubit/add_remove_cubit/increment_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late IncrementCubit incrementCubit;
  late AddToCartBloc addToCartBloc;
  @override
  void initState() {
    super.initState();
    incrementCubit = instance<IncrementCubit>();
    addToCartBloc = instance<AddToCartBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: incrementCubit),
        BlocProvider.value(value: addToCartBloc),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BakerSoft',
        theme: ThemeData(
          scaffoldBackgroundColor: ColorManager.primary,
        ),
        initialRoute: Routes.splashRoute,
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}
