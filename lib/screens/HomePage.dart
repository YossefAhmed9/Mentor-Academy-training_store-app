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
          body: FutureBuilder(
            future: cubit.getAllproducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return SafeArea(
                    child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'UpdateProduct');
                              },
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        elevation: 5.0,
                                        child: Padding(
                                          padding: const EdgeInsets.all(9.0),
                                          child: Row(
                                            children: [
                                              Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 70,
                                                  ),
                                                  Text(
                                                    Product.fromJson(
                                                                snapshot.data,
                                                                index)
                                                            .name ??
                                                        'name',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Colors.black,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '${Product.fromJson(snapshot.data, index).price ?? '55'} \$',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black),
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
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 50,
                                        bottom: 100,
                                        child: Image.network(
                                          Product.fromJson(snapshot.data, index)
                                                  .image ??
                                              '',
                                          width: 105,
                                          height: 105,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );
      },
    );
  }
}
