import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Link_Container extends StatelessWidget {
  final String image;
  final String bigText;
  final String url;
  final Color bigtextColor;
  final Color urlColor;
  bool scanty;
  double size;
  Link_Container(
      {Key? key,
      required this.image,
      required this.bigText,
      required this.url,
      this.scanty = false,
      this.bigtextColor = Colors.black,
      this.urlColor = const Color(0xff969696),
      this.size = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scanty != true
        ? Container(
            width: 327.w,
            height: 62.h,
            margin: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Color(0xffE0E0E0),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(14.w, 0, 0, 0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 4.45.h,
                        width: 4.45.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: Color(0xffB5B5B5),
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Container(
                        height: 4.45.h,
                        width: 4.45.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: Color(0xffB5B5B5),
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Container(
                        height: 4.45.h,
                        width: 4.45.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: Color(0xffB5B5B5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 24.55.w,
                  ),
                  //Padding(
                  //padding: const EdgeInsets.only(bottom: 8.0),
                  /*child:*/ SvgPicture.asset(
                    image,
                    height: 24.h,
                    width: 24.w,
                  ),
                  //),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bigText,
                        style: TextStyle(
                            color: bigtextColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5.33.h,
                      ),
                      Text(
                        url,
                        style: TextStyle(
                            color: urlColor,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        : Container(
            //width: 27.w,
            height: 62.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Color(0xffE0E0E0),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    image,
                    height: 24.h,
                    width: 24.w,
                  ),
                  SizedBox(width: 24.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bigText,
                        style: TextStyle(
                            color: bigtextColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
