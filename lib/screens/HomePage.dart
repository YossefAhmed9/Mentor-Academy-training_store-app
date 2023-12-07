import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/product_cubit.dart';

import '../Product states.dart';
import '../models/product_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ProductCubit cubit = ProductCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Home Page',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
              child: GridView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                            Product.fromJson(
                                                        cubit.result, index)
                                                    .name ??
                                                '',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              color: Colors.black,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            maxLines: 1,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '${Product.fromJson(cubit.result, index).price} \$',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20,
                                                    color: Colors.black),
                                              ),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.favorite,
                                                    color: Colors.red,
                                                  )),
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
                                Product.fromJson(cubit.result, index).image ??
                                    '',
                                width: 120,
                                height: 120,
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
