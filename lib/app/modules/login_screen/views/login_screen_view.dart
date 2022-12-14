import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  final LoginScreenController _loginScreenController =
      Get.put(LoginScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Login',
            style: GoogleFonts.josefinSans(
                fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 18.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 390.w,
                    height: 289.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/Images/wallpaperflare-cropped.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
              Form(
                key: _loginScreenController.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 64.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          child: Row(
                            children: [
                              Icon(Icons.alternate_email),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller:
                                      _loginScreenController.emailController,
                                  decoration: InputDecoration(
                                    focusColor: Colors.white,
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText: ' Enter Your E-mail',
                                    hintStyle: GoogleFonts.josefinSans(
                                      fontSize: 20.sp,
                                      color: Color.fromARGB(255, 75, 71, 71),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (!RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$')
                                            .hasMatch(value!) ||
                                        value.length < 3) {
                                      return 'please enter valid email';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 43.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 64.h,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Row(
                            children: [
                              Icon(Icons.lock),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _loginScreenController.password,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    focusColor: Colors.white,
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText: ' Password',
                                    hintStyle: GoogleFonts.josefinSans(
                                      fontSize: 20.sp,
                                      color: Color.fromARGB(255, 75, 71, 71),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 66.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_loginScreenController.formKey.currentState!
                          .validate()) {
                        _loginScreenController.loginFunction(
                            email: _loginScreenController.emailController.text,
                            password: _loginScreenController.password.text);
                      }
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.bold, fontSize: 17.sp),
                    ),
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.red,
                        elevation: 50,
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: Size(144.h, 40.w)),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
