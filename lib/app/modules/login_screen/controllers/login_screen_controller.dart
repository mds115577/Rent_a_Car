import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_cars/app/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:rental_cars/app/modules/dashboard/views/dashboard_view.dart';

class LoginScreenController extends GetxController {
  //TODO: Implement LoginScreenController

  final count = 0.obs;

  @override
  void onClose() {}
  void increment() => count.value++;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<LoginModel?> loginFunction(
      {required String email, required String password}) async {
    try {
      LoginModel loginmodel = LoginModel(email: email, password: password);
      final request = await http.post(
          Uri.parse('http://192.168.0.164:3000/api/user-login'),
          body: loginmodel.toJson());
      if (request.statusCode == 200) {
        Get.to(DashboardView());
        Get.snackbar('Success', 'Login Succesfull',
            backgroundColor: Colors.white);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
