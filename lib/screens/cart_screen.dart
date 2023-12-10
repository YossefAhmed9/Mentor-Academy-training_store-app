import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/cart/cart%20states.dart';
import 'package:mentor_academy/cart/cart_cubit.dart';
import 'package:mentor_academy/models/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(
      listener: (context, state) {},
      builder: (context, state) {
        CartCubit cubit = CartCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'Cart',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 27),
              ),
              centerTitle: true,
            ),
            body: cubit.cart == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.teal,
                    ),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.black12),
                          height: 3,
                          width: double.infinity,
                        ),
                      );
                    },
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      '${CartProducts.fromJson(cubit.cart, index).name}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(
                                    '${CartProducts.fromJson(cubit.cart, index).price}\$',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.network(
                                    '${CartProducts.fromJson(cubit.cart, index).image}',
                                    height: 170,
                                    width: 170,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        // width: 80,
                                        height: 40,
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () async {
                                                await cubit.updateQuantity(
                                                  productId:
                                                      CartProducts.fromJson(
                                                              cubit.cart, index)
                                                          .sId,
                                                );
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              '${CartProducts.fromJson(cubit.cart, index).quantity}',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                cubit.decreaseNumber();
                                              },
                                              icon: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }));
      },
    );
  }
}
