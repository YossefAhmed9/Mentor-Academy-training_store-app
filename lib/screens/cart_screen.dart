import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/cart/cart%20states.dart';
import 'package:mentor_academy/cart/cart_cubit.dart';
import 'package:mentor_academy/core/network/local/shared_prefrence.dart';
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
            body: cubit.cartList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.teal,
                    ),
                  )
                : ListView.separated(
                separatorBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black54),
                      height: 2,
                      width: double.infinity,
                    ),
                  );
                },

                    itemCount: cubit.cartList.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    cacheExtent: 6,
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
                                      '${CartProducts.fromJson(cubit.cartValue, index).name}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(
                                    '${CartProducts.fromJson(cubit.cartValue, index).totalPrice}\$',
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
                                    '${CartProducts.fromJson(cubit.cartValue, index).image}',
                                    height: 170,
                                    width: 170,
                                    errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                      return Image.asset('assets/images/error image.png');
                                    }
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
                                              onPressed: () {
                                                cubit.addToCart(nationalId: CasheHelper.getBoolean(key: 'nationalId'),
                                                    productId: CartProducts.fromJson(cubit.cartValue, index).sId);
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              '${CartProducts.fromJson(cubit.cartValue, index).quantity}',
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
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            cubit.deleteCart(
                                                CasheHelper.getBoolean(
                                                    key: 'nationalId'),
                                                CartProducts.fromJson(
                                                        cubit.cartValue, index)
                                                    .sId);
                                          },
                                          icon: Icon(
                                            CupertinoIcons.trash,
                                            color: Colors.red,
                                            size: 30,
                                          ))
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
