import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginLinks extends StatelessWidget {
  final String facebook_image;
  final String google_image;
  final String apple_image;

  LoginLinks({
    Key? key,
    required this.facebook_image,
    required this.google_image,
    required this.apple_image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100.5.w,
              height: 1.h,
              decoration: BoxDecoration(color: Color(0xffEEEEEE)),
            ),
            Text(
              "or continue with",
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Color(0xff616161),
                  fontWeight: FontWeight.w600),
            ),
            Container(
              width: 100.5.w,
              height: 1.h,
              decoration: BoxDecoration(color: Color(0xffEEEEEE)),
            )
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 41.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 18.h, bottom: 18.h),
                height: 60.h,
                width: 88.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.white,
                    border: Border.all(color: Color(0xffEEEEEE))),
                child: SvgPicture.asset(
                  "assets/$facebook_image",
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 18.h, bottom: 18.h),
                height: 60.h,
                width: 88.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.white,
                    border: Border.all(color: Color(0xffEEEEEE))),
                child: SvgPicture.asset("assets/$google_image"),
              ),
              Container(
                padding: EdgeInsets.only(top: 18.h, bottom: 18.h),
                height: 60.h,
                width: 88.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.white,
                    border: Border.all(color: Color(0xffEEEEEE))),
                child: SvgPicture.asset("assets/$apple_image"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
