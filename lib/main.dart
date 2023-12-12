import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/Login/Login_cubit.dart';
import 'package:mentor_academy/Register/Register_cubit.dart';
import 'package:mentor_academy/cart/cart_cubit.dart';
import 'package:mentor_academy/core/network/local/shared_prefrence.dart';
import 'package:mentor_academy/core/network/remote/dio_helper.dart';
import 'package:mentor_academy/onBoarding/onBoarding_cubit.dart';
import 'package:mentor_academy/product_cubit.dart';
import 'package:mentor_academy/screens/HomePage.dart';
import 'package:mentor_academy/screens/login_screen.dart';
import 'package:mentor_academy/screens/onBoarding_screen.dart';

import 'onBoarding/onBoarding_states.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CasheHelper.init();
  Bloc.observer;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => onBoardingCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => ProductCubit()..getAllproducts(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => CartCubit()
            ..getCart()
            ..addToCart(nationalId: CasheHelper.getBoolean(key: 'nationalId')),
          lazy: true,
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
            useMaterial3: true,
          ),
          home: BlocConsumer<onBoardingCubit, onBoardingStates>(
              builder: (context, state) {
                onBoardingCubit cubit = onBoardingCubit.get(context);
                // return HomePage();
                if (CasheHelper.getBoolean(key: cubit.onBoardingCasheKey) ==
                        true &&
                    CasheHelper.getBoolean(key: 'nationalId') == null) {
                  return LoginScreen();
                } else if (CasheHelper.getBoolean(key: 'nationalId') != null) {
                  return HomePage();
                } else {
                  return onBoarding();
                }
              },
              listener: (context, state) {})),
    );
  }
}
