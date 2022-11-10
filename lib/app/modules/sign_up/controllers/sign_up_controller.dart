import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_cars/app/models/opt_model.dart';

import 'package:rental_cars/app/models/signuo_model.dart';
import 'package:http/http.dart' as http;
import 'package:rental_cars/app/modules/dashboard/views/dashboard_view.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController

  final count = 0.obs;

  @override
  void onClose() {}
  void increment() => count.value++;
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameEditiing = TextEditingController();
  final TextEditingController mobileEditiing = TextEditingController();
  final TextEditingController passEditiing = TextEditingController();
  final TextEditingController conPassEditiing = TextEditingController();
  final TextEditingController emailEditiing = TextEditingController();
  final TextEditingController otp = TextEditingController();
  final dio = Dio();
  dynamic statuscode;
  Future<SignUpModel?> postData(
      {required String name,
      required String number,
      required String email,
      required String password}) async {
    try {
      final SignUpModel singup = SignUpModel(
          name: name, email: email, number: number, password: password);
      final request = await http.post(
          Uri.parse('http://192.168.0.164:3000/api/user-signup'),
          body: singup.toJson());
      statuscode = request.statusCode;
      if (request.statusCode == 200) {
        Get.snackbar('Success', 'Otp sent succesfully',
            backgroundColor: Colors.white);
      }
      if (request.statusCode == 409) {
        Get.snackbar('Alert', 'User Already Exists',
            backgroundColor: Colors.white);
      }
      log(request.statusCode.toString());
      update();
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<OtpVerifyModel?> otpVerifypost(
      {required String number,
      required String email,
      required String otp,
      required String name}) async {
    try {
      final OtpVerifyModel otpVerifyModel =
          OtpVerifyModel(email: email, number: '{+91$number}', otp: otp);
      final request = await http.post(
          Uri.parse('http://192.168.0.164:3000/api/otpVerification'),
          body: otpVerifyModel.toJson());

      if (request.statusCode == 200) {
        Get.to(DashboardView(
          user: nameEditiing.text,
        ));
        Get.snackbar('Success', 'Welcome $name');
      }
      log(request.statusCode.toString());
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
