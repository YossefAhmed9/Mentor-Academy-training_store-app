import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentor_academy/core/cubits/onBoarding/onBoarding_cubit.dart';
import '../core/network/local/shared_prefrence.dart';
import '../screens/login_screen.dart';
import '../screens/resources/components/components.dart';

class OnBoardingModel {
  final String title;
  final Widget body;
  final String image;

  OnBoardingModel({
    required this.title,
    required this.body,
    required this.image,
  });
}

Widget onBoardBuildingItem(OnBoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage('${model.image}'),
          ),
        ),

        //title
        Text(
          '${model.title}',
          style: TextStyle(fontFamily: 'Kablammo-Regular.ttf', fontSize: 25),
        ),
        //body


        SizedBox(child: model.body),

      ],
    );


final pageViewController = PageController(initialPage: 0);
