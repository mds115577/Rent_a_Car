import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    final SignUpController signup = Get.put(SignUpController());
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            text: 'CREATE ', style: GoogleFonts.josefinSans()),
                        TextSpan(
                            text: 'ACCOUNT',
                            style: GoogleFonts.josefinSans(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
            ),
            SizedBox(
              height: 81.h,
            ),
            Form(
              key: signup.formKey,
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 27, right: 27, bottom: 24),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    height: 64.h,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Center(
                        child: TextFormField(
                          controller: signup.nameEditiing,
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            hintText: 'Full Name',
                            hintStyle: GoogleFonts.josefinSans(
                              fontSize: 20.sp,
                              color: Color.fromARGB(255, 75, 71, 71),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 27, right: 27, bottom: 24),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    height: 64.h,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Center(
                        child: TextFormField(
                          controller: signup.emailEditiing,
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            hintText: 'E-mail',
                            hintStyle: GoogleFonts.josefinSans(
                              fontSize: 20.sp,
                              color: Color.fromARGB(255, 75, 71, 71),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 27, right: 27, bottom: 24),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    height: 64.h,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Center(
                        child: TextFormField(
                          controller: signup.mobileEditiing,
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            hintText: 'Mobile Num',
                            hintStyle: GoogleFonts.josefinSans(
                              fontSize: 20.sp,
                              color: Color.fromARGB(255, 75, 71, 71),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding:
                //       const EdgeInsets.only(left: 27, right: 27, bottom: 24),
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(20)),
                //     height: 64.h,
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 14.0),
                //       child: Center(
                //         child: TextFormField(
                //           controller: signup.passEditiing,
                //           obscureText: true,
                //           decoration: InputDecoration(
                //             focusColor: Colors.white,
                //             fillColor: Colors.white,
                //             border: InputBorder.none,
                //             hintText: 'Password',
                //             hintStyle: GoogleFonts.josefinSans(
                //               fontSize: 20.sp,
                //               color: Color.fromARGB(255, 75, 71, 71),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 27.w, right: 27.w, bottom: 24.h),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    height: 64.h,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Center(
                        child: TextFormField(
                          controller: signup.conPassEditiing,
                          obscureText: true,
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            hintText: 'Confirm Password',
                            hintStyle: GoogleFonts.josefinSans(
                              fontSize: 20.sp,
                              color: Color.fromARGB(255, 75, 71, 71),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                GetBuilder<SignUpController>(builder: (contest) {
                  return Visibility(
                    visible: signup.statuscode == 200 ? true : false,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 27.w, right: 27.w, bottom: 55.h),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        height: 64.h,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0),
                          child: Center(
                            child: TextFormField(
                              controller: signup.otp,
                              decoration: InputDecoration(
                                focusColor: Colors.white,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                hintText: 'Enter Otp',
                                hintStyle: GoogleFonts.josefinSans(
                                  fontSize: 20.sp,
                                  color: Color.fromARGB(255, 75, 71, 71),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ]),
            ),
            GetBuilder<SignUpController>(builder: (contewxt) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  signup.statuscode == 200
                      ? ElevatedButton(
                          onPressed: () async {
                            if (signup.formKey.currentState!.validate()) {
                              final responses = signup.otpVerifypost(
                                  number: signup.mobileEditiing.text,
                                  email: signup.emailEditiing.text,
                                  otp: signup.otp.text,
                                  name: signup.nameEditiing.text);
                            }
                          },
                          child: Text(
                            'Verify',
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
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            if (signup.formKey.currentState!.validate()) {
                              final response = signup.postData(
                                  name: signup.nameEditiing.text,
                                  number: signup.mobileEditiing.text,
                                  email: signup.emailEditiing.text,
                                  password: signup.conPassEditiing.text);
                            }
                          },
                          child: Text(
                            'Sign-Up',
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
                        )
                ],
              );
            })
          ],
        ));
  }
}
