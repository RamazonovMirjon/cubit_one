import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pr/core/init/storage/get_storage_service.dart';

import '../state/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthCubit() : super(AuthInitial());

  Future signIn() async {
    try {
      emit(AuthLoading());
      Response res = await Dio().post(
        "https://reqres.in/api/login",
        data: {
          "email": "eve.holt@reqres.in",
          "password": "cityslicka",
        },
      );
      if (res.statusCode == 200) {
        await StorageService.instance.writes('token', res.data['token']);
        emit(AuthComplete(user: res.data));
      } else {
        emit(AuthError(msg: "Username yoki Password notogri !"));
      }
    } catch (e) {
      emit(AuthError(msg: "Signinda qandaydir xatolik yuz berdi !"));
    }
  }
}