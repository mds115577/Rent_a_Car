import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rental_cars/app/modules/bookings/views/bookings_view.dart';
import 'package:rental_cars/app/modules/dashboard/views/dashboard_view.dart';

import '../../dashboard/views/common_refactors.dart';
import '../../home/views/home_view.dart';
import '../controllers/help_us_controller.dart';

class HelpUsView extends GetView<HelpUsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: ListView(
            children: [
              Container(
                height: 300.h,
                width: MediaQuery.of(context).size.width,
                child: DrawerHeader(
                  curve: Curves.ease,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 228, 228, 228),
                  ),
                  child: (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundImage: AssetImage(
                            'assets/Images/istockphoto-1300845620-612x612.jpg'),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('User',
                            style: GoogleFonts.josefinSans(fontSize: 28.sp)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8),
                        child: Text('983249223',
                            style: GoogleFonts.josefinSans(fontSize: 28.sp)),
                      )
                    ],
                  )),
                ),
              ),
              SizedBox(height: 11.h),
              Column(
                children: [
                  InkWell(
                      onTap: () {
                        Get.to(DashboardView());
                      },
                      child: drawer_list(icons: Icons.home, text: 'Home')),
                  InkWell(
                      onTap: () {
                        Get.to(BookingsView());
                      },
                      child:
                          drawer_list(icons: Icons.key, text: 'My Bookings')),
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: drawer_list(icons: Icons.feed, text: 'Help Us')),
                  SizedBox(height: 40.h),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAll(HomeView());
                    },
                    child: Text(
                      'Sign-Out',
                      style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.bold, fontSize: 17.sp),
                    ),
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.red,
                        elevation: 50,
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: Size(120.w, 40.h)),
                  ),
                ],
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 19.w, bottom: 50.h),
              child: Text(
                'Feel Free to Connect',
                style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30.sp),
              ),
            ),
            Center(
              child: Container(
                height: 171.h,
                width: 337.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/Images/help.jpg'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 27.w, right: 27.w, bottom: 24.h),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                height: 64.h,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Enter your Name',
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
              padding: EdgeInsets.only(left: 27.w, right: 27.w, bottom: 24.h),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                height: 64.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.0.w),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Contact Number',
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
              padding: EdgeInsets.only(left: 27.w, right: 27.w, bottom: 24.h),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Center(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Message',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Charge..',
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
        ));
  }
}
