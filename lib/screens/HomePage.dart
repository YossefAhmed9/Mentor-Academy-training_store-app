import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/core/network/local/shared_prefrence.dart';
import 'package:mentor_academy/screens/profile_screen.dart';
import 'package:mentor_academy/screens/favorit_screen.dart';
import 'package:mentor_academy/core/cubits/product/product_cubit.dart';
import 'package:mentor_academy/screens/cart_screen.dart';
import 'package:mentor_academy/screens/resources/components/components.dart';
import '../core/cubits/cart/cart_cubit.dart';
import '../core/cubits/favorites/favorite cubit.dart';
import '../core/cubits/product/Product states.dart';
import '../models/product_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ProductCubit cubit = ProductCubit.get(context);
        FavoriteCubit favCubit=FavoriteCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){
              navigateTo(context, ProfileScreen());
            }, icon: Icon(Icons.person_2_sharp,size: 32,color: Colors.teal,)),
            actions: [
              IconButton(
                  onPressed: () {
                    cubit.getAllproducts();
                    navigateTo(context, CartScreen());
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    size: 32,
                    color: Colors.teal[700],
                  )),
              IconButton(onPressed: (){
                navigateTo(context, FavoriteScreen());
              }, icon: (Icon(Icons.favorite,color: Colors.red,size: 32,))),
            ],
            title: const Text(
              'Home Page',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
              child: cubit.result == null
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    )
                  : GridView.builder(
                      itemCount: cubit.list.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 50,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 32,
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  elevation: 5.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 70,
                                              ),
                                              Text(
                                                ProductModel.fromJson(
                                                            cubit.result, index)
                                                        .name ??
                                                    '',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                maxLines: 1,
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '${ProductModel.fromJson(cubit.result, index).price} \$',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 17,
                                                        color: Colors.black),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        favCubit.addToFavorite(productId: ProductModel.fromJson(cubit.result, index).sId);

                                                      },
                                                      icon: const Icon(
                                                        Icons.favorite,
                                                        color: Colors.red,
                                                      )),
                                                  IconButton(
                                                      onPressed: () {
                                                        CartCubit.get(context).addToCart(
                                                            nationalId: CasheHelper
                                                                .getBoolean(
                                                                    key:
                                                                        'nationalId'),
                                                            productId: ProductModel
                                                                    .fromJson(
                                                                        cubit
                                                                            .result,
                                                                        index)
                                                                .sId);
                                                      },
                                                      icon: Icon(Icons
                                                          .shopping_cart_outlined))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 50,
                                  bottom: 85,
                                  child: Image.network(
                                      ProductModel.fromJson(cubit.result, index).image ?? '',
                                    width: 120,
                                    height: 120,
                                    errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                      return Image.asset('assets/images/error image.png',width: 50,height: 50,);

                                    }
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      })),
        );
      },
    );
  }
}
