import 'package:flutter/cupertino.dart';

class OnBoardingModel {
  final String title;
  final String body;
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
        SizedBox(
          height: 50,
        ),

        Text(
          '${model.body}',
          style: TextStyle(fontFamily: 'Kablammo-Regular.ttf', fontSize: 25),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );

List<OnBoardingModel> onboardingList = [
  OnBoardingModel(
      title: 'title 1', body: 'body 1', image: 'assets/images/onboard.png'),
  OnBoardingModel(
      title: 'title 2', body: 'body 2', image: 'assets/images/onboard.png'),
  OnBoardingModel(
      title: 'title 3', body: 'body 3', image: 'assets/images/onboard.png'),
];

final pageViewController = PageController(initialPage: 0);
