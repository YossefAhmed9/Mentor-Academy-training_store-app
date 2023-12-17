import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/core/cubits/account/account_cubit.dart';
import 'package:mentor_academy/screens/profile_screen.dart';
import 'package:mentor_academy/core/cubits/update/update_states.dart';
import '../core/components/components.dart';
import '../core/cubits/update/update_cubit.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateCubit, UpdateStates>(
      listener: (context, state) {},
      builder: (context, state) {
        TextEditingController nameController = TextEditingController();
        TextEditingController phoneController = TextEditingController();
        TextEditingController emailController = TextEditingController();
        var updateName = GlobalKey<FormState>();
        var updatePhone = GlobalKey<FormState>();
        var updateEmail = GlobalKey<FormState>();
        var scaffoldKey = GlobalKey<ScaffoldState>();

        UpdateCubit cubit = UpdateCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            key: scaffoldKey,
            title: Text(
              'Update product',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    defaultTextFormField(
                        updateName,
                        TextInputType.text,
                        nameController,
                        //submit
                        (value) {},
                        //change
                        (value) {
                      print(value);
                    },
                        //tap
                        () {},
                        'Enter your name',
                        OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        Icon(Icons.add),
                        (value) => null),
                    defaultTextFormField(
                        updatePhone, TextInputType.phone, phoneController,
                        //submit
                        (value) {
                      print(value);
                    },
                        //change
                        (value) {
                      print(value);
                    },
                        //tap
                        () {},
                        'Enter your phone number',
                        OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        Icon(Icons.add),
                        (value) => null),
                    defaultTextFormField(updateEmail,
                        TextInputType.emailAddress, emailController,
                        //submit
                        (value) {
                      print(value);
                    },
                        //change
                        (value) {
                      print(value);
                    },
                        //tap
                        () {},
                        'Enter your e-mail ',
                        OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        Icon(Icons.add),
                        (value) => null),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.teal),
                      child: defaultButton(200, 70, Colors.transparent, () {
                        AccountCubit.get(context).updateProfile(nameController.text,
                            emailController.text,
                            phoneController.text,
                        ).then((value){

Navigator.pop(context);
                        } );

                      }, 'Update Now!', Colors.white, 20),
                    )
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
