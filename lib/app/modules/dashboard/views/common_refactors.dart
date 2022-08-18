import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Home_LIsts extends StatelessWidget {
  String text;
  IconData icon;
  Color color;
  Home_LIsts({
    required this.text,
    required this.color,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(196, 251, 251, 251),
          borderRadius: BorderRadius.circular(20.r)),
      width: 284.w,
      height: 70.h,
      child: Center(
        child: ListTile(
          title: AutoSizeText(
            text,
            style: GoogleFonts.josefinSans(fontSize: 20.sp),
          ),
          leading: Icon(
            icon,
            size: 32.h,
            color: color,
          ),
        ),
      ),
    );
  }
}

class drawer_list extends StatelessWidget {
  IconData icons;
  String text;

  drawer_list({
    required this.icons,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icons,
        color: Colors.red,
        size: 40.h,
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(text,
            style:
                GoogleFonts.josefinSans(color: Colors.white, fontSize: 28.sp)),
      ),
    );
  }
}
