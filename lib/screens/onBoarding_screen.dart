import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/core/components/components.dart';
import 'package:mentor_academy/core/cubits/onBoarding/onBoarding_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../core/cubits/onBoarding/onBoarding_states.dart';
import '../core/network/local/shared_prefrence.dart';
import '../models/onBoarding_model.dart';
import 'login_screen.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<onBoardingCubit, onBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        onBoardingCubit cubit = onBoardingCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text(
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
                      physics: BouncingScrollPhysics(),
                      onPageChanged: (int index) {
                        if (onboardingList.length == index + 1) {
                          cubit.pageLast(index);
                        } else {
                          cubit.pageNOTLast(index);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: pageViewController,
                        count: onboardingList.length,
                        effect: ExpandingDotsEffect(
                          // dotColor: defaultColor,
                          activeDotColor: Colors.teal,
                          dotHeight: 20,
                          dotWidth: 20,
                          spacing: 5,
                        ),
                      ),
                      Spacer(),
                      FloatingActionButton.large(
                        onPressed: () {
                          CasheHelper.setBoolean(
                              key: cubit.onBoardingCasheKey, value: true);
                          cubit.noONBoard();
                          navigateAndDelPast(context, LoginScreen());
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}
