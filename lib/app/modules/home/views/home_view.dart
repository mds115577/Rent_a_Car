import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rental_cars/app/modules/login_screen/views/login_screen_view.dart';
import 'package:rental_cars/app/modules/sign_up/views/sign_up_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 90.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: Colors.white,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'A & ',
                          style: GoogleFonts.josefinSans(
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'S',
                          style: GoogleFonts.josefinSans(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rent a Car',
                  style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30.sp),
                )
              ],
            ),
            SizedBox(
              height: 78.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 370.w,
                  height: 176.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/Images/6867608_28803.jpg'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 78.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(LoginScreenView());
                  },
                  child: Container(
                    height: 64.h,
                    width: 269.w,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 245, 245),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'SIGN IN',
                      style: GoogleFonts.josefinSans(fontSize: 20.sp),
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(SignUpView());
                  },
                  child: Container(
                    height: 64.h,
                    width: 269.w,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 245, 245),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'SIGN UP',
                      style: GoogleFonts.josefinSans(fontSize: 20.sp),
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
