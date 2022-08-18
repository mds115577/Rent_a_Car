import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/view_cars_controller.dart';

class ViewCarsView extends GetView<ViewCarsController> {
  final ViewCarsController _carsController = Get.put(ViewCarsController());
  @override
  Widget build(BuildContext context) {
    List<dynamic> img = [
      'assets/Images/2.jpeg',
      'assets/Images/1.jpeg',
      'assets/Images/3.jpeg',
      'assets/Images/4.jpeg',
      'assets/Images/5.jpeg'
    ];
    List names = [
      'Mercedes Benz-GLC coupe',
      'Mercedes Benz-CLA',
      'Mercedes Benz-G63 AMG'
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: Colors.white,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Available ', style: GoogleFonts.josefinSans()),
                      TextSpan(
                          text: 'Cars',
                          style: GoogleFonts.josefinSans(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                      fontSize: 25.sp,
                      color: Colors.white,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Based On Your ',
                          style: GoogleFonts.josefinSans()),
                      TextSpan(
                          text: 'Location',
                          style: GoogleFonts.josefinSans(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 2,
          ),
          SizedBox(
            height: 30.5.h,
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
                    child: Text(
                      'Mercedes Benz-GLC coupe',
                      style: GoogleFonts.josefinSans(
                          fontSize: 25.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Column(
                  children: [
                    CarouselSlider(
                      items: img
                          .map(
                            (item) => Container(
                              padding: EdgeInsets.only(bottom: 15.h),
                              color: Colors.white,
                              child: Container(
                                margin: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: AssetImage(item),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),

                      //Slider Container properties
                      options: CarouselOptions(
                        onPageChanged: ((index, reason) {
                          _carsController.carouselChange(index);
                        }),
                        initialPage: 0,
                        height: 315.h,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.9,
                      ),
                    ),
                    GetBuilder<ViewCarsController>(builder: (context) {
                      return CarouselIndicator(
                        color: Colors.white,
                        activeColor: Color.fromARGB(255, 205, 63, 53),
                        count: img.length,
                        index: _carsController.pageIndex,
                      );
                    }),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Text(
                          'Description:',
                          style: GoogleFonts.josefinSans(
                              color: Colors.white,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Description(
                      type: 'Fuel',
                      value: 'Diesel',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Description(type: 'Transmission', value: 'Automatic'),
                    SizedBox(
                      height: 10.h,
                    ),
                    Description(type: 'Type', value: 'Suv'),
                    SizedBox(
                      height: 10.h,
                    ),
                    Description(type: 'Cost', value: '20000/day')
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _carsController.checkOut();
                },
                child: Text(
                  'Book Now',
                  style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.bold, fontSize: 17.sp),
                ),
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.red,
                    elevation: 50,
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0.r)),
                    minimumSize: Size(144.h, 40.w)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  String type;
  String value;
  Description({
    required this.type,
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            type,
            style: GoogleFonts.josefinSans(
              color: Colors.red,
              fontSize: 25.sp,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.josefinSans(
              color: Colors.white,
              fontSize: 25.sp,
            ),
          ),
        ],
      ),
    );
  }
}
