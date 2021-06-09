import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthServices {
  Dio dio = new Dio(); //Dio is a package that is used to use http request

  login(name, password) async {
    try {
      return await dio.post('http://localhost:3000/authenticateUser',
          data: {"name": name, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  } //End of auth user

  /**
   * This method will get the current user data using the 
   * returned token from the node server
   */

  getCurrentUserData(token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';

    return await dio.get('http://localhost:3000/getUser');
  }

  addUser(name, password, carType) async {
    try {
      return await dio.post('http://localhost:3000/addUser',
          data: {"name": name, "password": password, "carType": carType},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
} //End of auth service
