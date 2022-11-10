import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rental_cars/app/modules/bookings/views/bookings_view.dart';
import 'package:rental_cars/app/modules/dashboard/views/common_refactors.dart';
import 'package:rental_cars/app/modules/help_us/views/help_us_view.dart';
import 'package:rental_cars/app/modules/home/views/home_view.dart';
import 'package:rental_cars/app/modules/view_cars/views/view_cars_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final String? user;
  final DashboardController _dashboardController =
      Get.put(DashboardController());

  DashboardView({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Get.back();
                    },
                    child: drawer_list(icons: Icons.home, text: 'Home')),
                InkWell(
                    onTap: () {
                      Get.to(BookingsView());
                    },
                    child: drawer_list(icons: Icons.key, text: 'My Bookings')),
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
        title: Text('Welcome $user',
            style: GoogleFonts.josefinSans(
                fontSize: 30.sp, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Images/515349.jpg'), fit: BoxFit.cover),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 2.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0),
            ),
            child: ListView(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 146.h,
                  ),
                  InkWell(
                    onTap: () {
                      _dashboardController.selectState();
                    },
                    child: Home_LIsts(
                        color: Color.fromARGB(195, 53, 172, 208),
                        icon: CupertinoIcons.globe,
                        text: 'Pick-up Location'),
                  ),
                  GetBuilder<DashboardController>(
                    builder: (contex2t) {
                      if (_dashboardController.visibility == true) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(196, 251, 251, 251),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  height: 50.h,
                                  child: GetBuilder<DashboardController>(
                                      builder: (contexst) {
                                    return Padding(
                                      padding: EdgeInsets.all(8.0.sm),
                                      child: DropdownButton(
                                          hint: Text('Select District'),
                                          value:
                                              _dashboardController.categoryID,
                                          items: _dashboardController.states
                                              .map((e) {
                                            return DropdownMenuItem<String>(
                                              // onTap: () {
                                              //   _dashboardController.newone(e);
                                              // },
                                              value: e,
                                              child: Text(e),
                                            );
                                          }).toList(),
                                          onTap: () {
                                            _dashboardController
                                              .branch
                                              .clear();
                                          },
                                          onChanged: (selectedValue) async {
                                            await _dashboardController
                                                .changeModel(selectedValue);
                                          }),
                                    );
                                  }),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(196, 251, 251, 251),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  height: 50.h,
                                  child: GetBuilder<DashboardController>(
                                      builder: (contexst) {
                                    return Padding(
                                      padding: EdgeInsets.all(8.sm),
                                      child: DropdownButton(
                                          hint: AutoSizeText('Select Branch'),
                                          value:
                                              _dashboardController.categoryID2,
                                          items: _dashboardController.branch
                                              .map((e) {
                                            return DropdownMenuItem<String>(
                                              // onTap: () {
                                              //   _dashboardController.newone(e);
                                              // },
                                              value: e,
                                              child: Text(e),
                                            );
                                          }).toList(),
                                          onChanged: (selectedValue) async {
                                            await _dashboardController
                                                .changeModel2(selectedValue);
                                          }),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: 10.h,
                        );
                      }
                    },
                  ),
                  InkWell(
                    onTap: () {
                      _dashboardController.selectState2();
                    },
                    child: Home_LIsts(
                      text: 'Drop-off',
                      color: Color.fromARGB(195, 209, 22, 22),
                      icon: CupertinoIcons.dot_square,
                    ),
                  ),
                  GetBuilder<DashboardController>(
                    builder: (contex2t2) {
                      return _dashboardController.visibility2 == true
                          ? Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Flexible(
                                    child: Container(
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              196, 251, 251, 251),
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      child: GetBuilder<DashboardController>(
                                          builder: (contexst) {
                                        return Padding(
                                          padding: EdgeInsets.all(8.sm),
                                          child: DropdownButton(
                                              hint: AutoSizeText(
                                                  'Select District'),
                                              value: _dashboardController
                                                  .categoryID3,
                                              items: _dashboardController.states
                                                  .map((e) {
                                                return DropdownMenuItem<String>(
                                                  // onTap: () {
                                                  //   _dashboardController.newone(e);
                                                  // },
                                                  value: e,
                                                  child: Text(e),
                                                );
                                              }).toList(),
                                              onChanged: (selectedValue) async {
                                                await _dashboardController
                                                    .dropOffchangeModel(
                                                        selectedValue);
                                              }),
                                        );
                                      }),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color:
                                            Color.fromARGB(196, 251, 251, 251),
                                      ),
                                      child: GetBuilder<DashboardController>(
                                          builder: (contexst1) {
                                        return Padding(
                                          padding: EdgeInsets.all(8.sm),
                                          child: DropdownButton(
                                              hint: Text('Select Branch'),
                                              value: _dashboardController
                                                  .categoryID4,
                                              items: _dashboardController
                                                  .branch2
                                                  .map((e) {
                                                return DropdownMenuItem<String>(
                                                  // onTap: () {
                                                  //   _dashboardController.newone(e);
                                                  // },
                                                  value: e,
                                                  child: Text(e),
                                                );
                                              }).toList(),
                                              onChanged: (selectedValue) async {
                                                await _dashboardController
                                                    .dropOffchangeModel2(
                                                        selectedValue);
                                              }),
                                        );
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(
                              height: 10.h,
                            );
                    },
                  ),
                  InkWell(
                    onTap: () {
                      _dashboardController.selectDate(context);
                    },
                    child: GetBuilder<DashboardController>(builder: (scontext) {
                      return Home_LIsts(
                        text: _dashboardController.startDate,
                        color: Color.fromARGB(195, 69, 171, 52),
                        icon: CupertinoIcons.calendar_badge_plus,
                      );
                    }),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () {
                      _dashboardController.selectDate2(context);
                    },
                    child: GetBuilder<DashboardController>(builder: (coxt) {
                      return Home_LIsts(
                          text: _dashboardController.endDate,
                          color: Color.fromARGB(195, 209, 22, 22),
                          icon: CupertinoIcons.calendar_badge_minus);
                    }),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.to(ViewCarsView());
                        },
                        child: Text(
                          'Search',
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
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
