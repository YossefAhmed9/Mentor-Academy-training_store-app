import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/Login/Login_States.dart';
import 'package:mentor_academy/Login/Login_cubit.dart';

import '../components/components.dart';
import 'Register Screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  String id = 'LoginPage';

  var emailcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var emailKey = GlobalKey<FormState>();
  var passKey = GlobalKey<FormState>();
  var passcontroller = TextEditingController();
  bool showpass = true;
  //bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: const Text('Login form'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 50.0,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      defaultTextFormField(
                        emailKey,
                        TextInputType.emailAddress,
                        emailcontroller,
                        (value) {
                          emailcontroller.text = value!;
                        },
                        (value) {
                          print(value);
                        },
                        () {},
                        'Email',
                        const OutlineInputBorder(),
                        Icon(
                          Icons.email_rounded,
                        ),
                        (value) {
                          if (value!.isEmpty) {
                            return ('Email must be filled');
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passcontroller,
                        keyboardType: TextInputType.visiblePassword,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        obscureText: showpass,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('Password must be filled');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: GestureDetector(
                              onTap: () {},
                              child: const Icon(Icons.remove_red_eye_outlined)),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 55.0,
                        child: MaterialButton(
                          onPressed: () async {},
                          color: Colors.blue,
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              cubit.login(
                                  emailcontroller.text, passcontroller.text);
                              navigateTo(context, Register_Screen());
                            },
                            child: const Text(
                              'Register Now!',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      // defaultButton(double.infinity, 50.0, Colors.red, () {
                      //   print('heeeeelo');
                      // }, 'Register', Colors.white, 18),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
