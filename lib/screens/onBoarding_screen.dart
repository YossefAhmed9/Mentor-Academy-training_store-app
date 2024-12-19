import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/core/cubits/onBoarding/onBoarding_cubit.dart';
import 'package:mentor_academy/screens/resources/components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../core/cubits/onBoarding/onBoarding_states.dart';
import '../core/network/local/shared_prefrence.dart';
import '../models/onBoarding_model.dart';
import '../styles.dart';
import 'login_screen.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> onboardingList = [
      OnBoardingModel(
          title: 'title 1',
          body: Text(
            'body 1',
            style: Styles.title1.copyWith(fontWeight: FontWeight.w300),
          ),
          image: 'assets/images/onboard.png'),
      OnBoardingModel(
          title: 'title 2',
          body: Text(
            'body 2',
            style: Styles.title1.copyWith(fontWeight: FontWeight.w300),
          ),
          image: 'assets/images/onboard.png'),
      OnBoardingModel(
          title: 'Now you know everything',
          body: Row(
            children: [
              Flexible(
                  child: Text(
                ' let\'s get you started',
                style: Styles.title1
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 22,),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )),
              TextButton(
                  onPressed: () {
                    CasheHelper.setBoolean(
                        key: onBoardingCubit.get(context).onBoardingCasheKey,
                        value: true);
                    onBoardingCubit.get(context).noONBoard();
                    navigateAndDelPast(context, LoginScreen());
                  },
                  child: Text(
                    'Login',
                    style: Styles.bookTitle
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 22,color: Colors.teal),
                  ))
            ],
          ),
          image: 'assets/images/onboard.png'),
    ];
    return BlocConsumer<onBoardingCubit, onBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        onBoardingCubit cubit = onBoardingCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Shop App',
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(45.0),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: pageViewController,
                      itemBuilder: (context, index) =>
                          onBoardBuildingItem(onboardingList[index]),
                      itemCount: onboardingList.length,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (int index) {
                        if (onboardingList.length == index + 1) {
                          cubit.pageLast(index);
                        } else {
                          cubit.pageNOTLast(index);
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: pageViewController,
                        count: onboardingList.length,
                        effect: const ExpandingDotsEffect(
                          // dotColor: defaultColor,
                          activeDotColor: Colors.teal,
                          dotHeight: 20,
                          dotWidth: 20,
                          spacing: 5,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}
