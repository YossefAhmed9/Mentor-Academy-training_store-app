import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentor_academy/core/cubits/account/account_cubit.dart';
import 'package:mentor_academy/models/account_model.dart';
import 'package:mentor_academy/core/network/local/shared_prefrence.dart';
import 'package:mentor_academy/screens/resources/components/components.dart';
import 'package:mentor_academy/screens/update_profile.dart';
import '../core/cubits/account/account_states.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AccountCubit cubit = AccountCubit.get(context);
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(onPressed: () { navigateTo(context, UpdateProfile()); }, label: Text('Update your profile',style: TextStyle(fontSize: 17),), ),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ),
          body: cubit.getResult == null
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.teal,
                  ),
                )
              : Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(150)),clipBehavior: Clip.antiAliasWithSaveLayer,

                        child: Image.network(
                            '${AccountData.fromJson(cubit.getResult).profileImage}',width: 170,height: 170,
                            errorBuilder: (BuildContext context,
                                Object exception,
                                StackTrace? stackTrace) {
                              return Image.asset('assets/images/error image.png',width: 50,height: 50,);

                            }
                        ),
                      ),
                      Text('Name: ${AccountData.fromJson(cubit.updateResult).name}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      Text('Email: ${AccountData.fromJson(cubit.updateResult).email}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      Text('National ID: ${CasheHelper.getBoolean(key: 'nationalId')}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      Text('Gender: ${AccountData.fromJson(cubit.updateResult).gender}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      Text('Phone: ${AccountData.fromJson(cubit.updateResult).phone}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),

                    ],
                  ),
              ),
        );
      },
    );
  }
}
