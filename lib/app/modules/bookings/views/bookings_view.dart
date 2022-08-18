import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rental_cars/app/modules/help_us/views/help_us_view.dart';

import '../../dashboard/views/common_refactors.dart';
import '../../dashboard/views/dashboard_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/bookings_controller.dart';

class BookingsView extends GetView<BookingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
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
                        Get.back();
                      },
                      child:
                          drawer_list(icons: Icons.key, text: 'My Bookings')),
                  InkWell(
                      onTap: () {
                        Get.to(HelpUsView());
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
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Bookings',
              style: GoogleFonts.josefinSans(
                  fontSize: 30.sp, fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 19.w, bottom: 26.h),
              child: Text(
                'Keep Motoring with us....',
                style: GoogleFonts.josefinSans(
                    color: Colors.white, fontSize: 25.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(7.sm),
                          child: Container(
                            height: 167.h,
                            width: 161.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/Images/2.jpeg'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            overflow: TextOverflow.visible,
                            'Mercedes-Benz-Glc',
                            maxLines: 2,
                            style: GoogleFonts.josefinSans(
                                fontSize: 20.sp,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4.h),
                          AutoSizeText(
                            overflow: TextOverflow.visible,
                            '4 Days',
                            maxLines: 2,
                            style: GoogleFonts.josefinSans(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          AutoSizeText(
                            overflow: TextOverflow.visible,
                            'From Kochi',
                            maxLines: 2,
                            style: GoogleFonts.josefinSans(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          AutoSizeText(
                            overflow: TextOverflow.visible,
                            'To Calicut',
                            maxLines: 2,
                            style: GoogleFonts.josefinSans(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          AutoSizeText(
                            overflow: TextOverflow.visible,
                            'Date:',
                            maxLines: 2,
                            style: GoogleFonts.josefinSans(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          AutoSizeText(
                            overflow: TextOverflow.visible,
                            '22/02/22 - 12/03/22',
                            maxLines: 2,
                            style: GoogleFonts.josefinSans(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          AutoSizeText(
                            overflow: TextOverflow.visible,
                            'Total:',
                            maxLines: 2,
                            style: GoogleFonts.josefinSans(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          AutoSizeText(
                            overflow: TextOverflow.visible,
                            '80000/-',
                            maxLines: 2,
                            style: GoogleFonts.josefinSans(
                                fontSize: 20.sp,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(DashboardView());
                  },
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.bold, fontSize: 17.sp),
                  ),
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.red,
                      elevation: 50,
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize: Size(184.w, 40.h)),
                ),
              ],
            ),
          ],
        ));
  }
}
