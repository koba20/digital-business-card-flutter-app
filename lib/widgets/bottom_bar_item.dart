import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarItem extends StatelessWidget {
  BottomBarItem(this.image, /*this.activeImage*/ this.title,
      {this.onTap, this.isActive = false, this.isNotified = false});
  final String image;
  final String title;
  final bool isNotified;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Stack(alignment: Alignment.center, children: <Widget>[
          Container(
            padding: EdgeInsets.all(7.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              color:
                  isActive ? Colors.indigo.withOpacity(.1) : Colors.transparent,
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  image,
                  height: 27.69.h,
                  width: 27.69.w,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
