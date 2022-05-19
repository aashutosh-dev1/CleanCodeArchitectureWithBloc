import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop_app/data/models/food_model.dart';
import 'package:online_shop_app/presentation/blocs/add_to_cart/add_to_cart_bloc.dart';
import 'package:online_shop_app/presentation/cubit/add_remove_cubit/increment_cubit.dart';
import 'package:online_shop_app/presentation/resources/app_size.dart';
import 'package:online_shop_app/presentation/resources/color_manager.dart';
import 'package:online_shop_app/presentation/widget/cart_badge.dart';

class ItemDetailScreen extends StatefulWidget {
  final FoodModel? foodModel;
  const ItemDetailScreen({Key? key, this.foodModel}) : super(key: key);

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  late String selectedValue;
  @override
  void initState() {
    super.initState();
    selectedValue = widget.foodModel!.nutrientsValue![0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.foodModel!.name!,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        actions: const [ShopingCartBadge()],
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: ColorManager.primary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.maxFinite,
            child: Image.asset(
              widget.foodModel!.image!,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(AppSize.a16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.foodModel?.name ?? "",
                  style: const TextStyle(
                    fontSize: AppSize.a32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '€${(widget.foodModel!.price! * context.read<IncrementCubit>().state.qty)}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: AppSize.a24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<IncrementCubit>().decrementQuantity();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
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
                            child: const Icon(Icons.remove),
                          ),
                        ),
                        const SizedBox(
                          width: AppSize.a12,
                        ),
                        Text(
                          context.watch<IncrementCubit>().state.qty.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppSize.a24,
                          ),
                        ),
                        const SizedBox(
                          width: AppSize.a12,
                        ),
                        InkWell(
                          onTap: () {
                            context.read<IncrementCubit>().increaseQuantity();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(AppSize.a4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: const Icon(Icons.add),
                          ),
                        ),
                        const SizedBox(
                          width: AppSize.a8,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: AppSize.a16),
            child: Text(
              widget.foodModel?.name ?? "",
              style: const TextStyle(
                fontSize: AppSize.a24,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(
                top: AppSize.a16, left: AppSize.a16, right: AppSize.a16),
            height: 60,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                isExpanded: true,
                underline: const Text(''),
                value: selectedValue,
                iconEnabledColor: Colors.red,
                style: const TextStyle(color: Colors.black),
                items: widget.foodModel!.nutrientsValue!.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (v) {
                  setState(() => selectedValue = v.toString());
                },
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              BlocProvider.of<AddToCartBloc>(context)
                  .add(AddToCartInitialEvent(widget.foodModel!));
            },
            child: Container(
              margin: const EdgeInsets.only(
                  top: AppSize.a16, left: AppSize.a16, right: AppSize.a16),
              height: 60,
              width: double.maxFinite,
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
                      'Add To Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSize.a24,
                      ),
                    )),
              ),
            ),
          ),
        
          const Spacer(),
        ],
      ),
    );
  }
}
