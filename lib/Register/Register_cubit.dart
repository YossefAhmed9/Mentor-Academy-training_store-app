import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../core/network/remote/dio_helper.dart';
import '../models/userModel.dart';
import 'Register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(registerInitState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;

  void register(String name, email, phone, nationalID, gender, profileImage) {
    emit(registerLoadingState());
    DioHelper.getData(
        url: 'https://elwekala.onrender.com/user/register',
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "nationalID": nationalID,
          "gender": gender,
          "profileImage": userImage
        }).then((value) {
      userModel = UserModel.fromJson(value.data);
      print(value.data);
      print('User Model is $userModel');
      emit(registerDoneState());
    }).catchError((error) {
      print('Error: $error');
      print('Response: ${error.response}');
      print(error.toString());
      print(error.runtimeType);
      emit(registerErrorState(error));
    });
  }

  ImagePicker picker = ImagePicker();
  File? image;
  Uint8List? bytes;
  String? userImage;

  Future<void> addImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      image = File(pickedFile.path);
      bytes = File(image!.path).readAsBytesSync();
      userImage = base64Encode(bytes!);
      print('images = $userImage');
      print('platform is = ${ImagePicker.platform}');
      emit(registerImageChoose());
    } else {
      print('no image');
    }
  }

  bool showPass = true;
  void convertPass() {
    showPass = false;
    emit(ShowPassState());
  }
}
