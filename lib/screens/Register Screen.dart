import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/Register/Register_cubit.dart';

import '../Register/Register_states.dart';
import '../core/components/components.dart';

class Register_Screen extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var passcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var nationalIDcontroller = TextEditingController();
  var confirmpasscontroller = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var nameKey = GlobalKey<FormState>();
  var emailKey = GlobalKey<FormState>();
  var passKey = GlobalKey<FormState>();
  var phoneKey = GlobalKey<FormState>();
  var nationalIDKey = GlobalKey<FormState>();
  var confirmpass = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        RegisterCubit cubit = RegisterCubit();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Register form'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 50.0,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //name
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: defaultTextFormField(
                        nameKey,
                        TextInputType.text,
                        namecontroller,
                        (value) {
                          print(value);
                        },
                        (value) {
                          print(value);
                        },
                        () {},
                        'Enter your name',
                        const OutlineInputBorder(),
                        const Icon(
                          Icons.email_rounded,
                        ),
                        (value) {
                          if (value!.isEmpty) {
                            return ('name must be filled');
                          }
                          return null;
                        },
                      ),
                    ),
                    //email
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: defaultTextFormField(
                        emailKey,
                        TextInputType.emailAddress,
                        emailcontroller,
                        (value) {
                          print(value);
                        },
                        (value) {
                          print(value);
                        },
                        () {},
                        'Email',
                        const OutlineInputBorder(),
                        const Icon(
                          Icons.email_rounded,
                        ),
                        (value) {
                          if (value!.isEmpty) {
                            return ('Email must be filled');
                          }
                          return null;
                        },
                      ),
                    ),
                    //phone
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: defaultTextFormField(
                        phoneKey,
                        TextInputType.numberWithOptions(),
                        phonecontroller,
                        (value) {
                          print(value);
                        },
                        (value) {
                          print(value);
                        },
                        () {},
                        'Enter your phone number',
                        const OutlineInputBorder(),
                        const Icon(
                          Icons.email_rounded,
                        ),
                        (value) {
                          if (value!.isEmpty) {
                            return ('name must be filled');
                          }
                          return null;
                        },
                      ),
                    ),
                    //national ID
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: defaultTextFormField(
                        nationalIDKey,
                        TextInputType.text,
                        nationalIDcontroller,
                        (value) {
                          print(value);
                        },
                        (value) {
                          print(value);
                        },
                        () {},
                        'Enter your national ID',
                        const OutlineInputBorder(),
                        const Icon(
                          Icons.person,
                        ),
                        (value) {
                          if (value!.isEmpty) {
                            return ('national ID must be filled');
                          }
                          return null;
                        },
                      ),
                    ),

                    //pass
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: TextFormField(
                        key: passKey,
                        controller: passcontroller,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        obscureText: cubit.showPass,
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
                            suffixIcon: IconButton(
                                onPressed: () {
                                  cubit.convertPass();
                                },
                                icon: Icon(Icons.remove_red_eye_outlined))),
                      ),
                    ),
                    //confirm pass
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: TextFormField(
                        key: confirmpass,
                        controller: confirmpasscontroller,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        obscureText: cubit.showPass,
                        validator: (value) {
                          if (passcontroller.text !=
                              confirmpasscontroller.text) {
                            return ('passwords aren\'t the same');
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                              onPressed: () {
                                cubit.convertPass();
                              },
                              icon: const Icon(Icons.remove_red_eye_outlined)),
                        ),
                      ),
                    ),

                    Center(
                      child: TextButton(
                          onPressed: () {
                            cubit.addImage();
                          },
                          child: Text('Pick an image')),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 55.0,
                      child: MaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            try {
                              cubit.register(
                                name: namecontroller.text,
                                email: emailcontroller.text,
                                gender: 'Male',
                                nationalID: nationalIDcontroller.text,
                                password: passcontroller.text,
                                phone: phonecontroller.text,
                                profileImage: cubit.image,
                              );
                              print(cubit.image);
                            } catch (error) {
                              print(error.toString());
                              print(error.runtimeType);
                            }
                          }
                        },
                        color: Colors.blue,
                        child: Text(
                          'Register',
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
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Login Now!',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
