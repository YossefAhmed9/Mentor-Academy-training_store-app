import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/favorites/favorite%20cubit.dart';
import 'package:mentor_academy/favorites/favorite%20states.dart';
import 'package:mentor_academy/models/favorite_model.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteStates>(
      listener: (context, state) {},
      builder: (context, state) {
        FavoriteCubit cubit = FavoriteCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'Favorites',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 27),
              ),
              centerTitle: true,
            ),
            body: cubit.favoriteList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.teal,
                    ),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.black54),
                          height: 2,
                          width: double.infinity,
                        ),
                      );
                    },
                    itemCount: cubit.favoriteList.length,
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
                                      '${FavoriteModel.fromJson(cubit.FavValue, index).name}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(
                                    '${FavoriteModel.fromJson(cubit.FavValue, index).price}\$',
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
                                      '${FavoriteModel.fromJson(cubit.FavValue, index).image}',
                                      height: 170,
                                      width: 170, errorBuilder:
                                          (BuildContext context,
                                              Object exception,
                                              StackTrace? stackTrace) {
                                    return Image.asset(
                                        'assets/images/error image.png');
                                  }),
                                  TextButton(onPressed: (){
                                    cubit.deleteFromFavorites(productId:FavoriteModel.fromJson(cubit.FavValue, index).sId);
                                  }, child: Text('Remove From Favorites',style: TextStyle(
                                    color: Colors.red,fontSize: 12,fontWeight: FontWeight.w800
                                  ),))
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
