import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class IconAndText extends StatelessWidget {
  final String imageUrl;
  final String secondImage;
  final String bigText;
  final String smallText;
  final Color bigtextColor;
  final Color smalltextColor;
  bool percent;
  double size;
  IconAndText(
      {Key? key,
      required this.imageUrl,
      required this.bigText,
      required this.smallText,
      required this.secondImage,
      this.percent = false,
      this.bigtextColor = Colors.black,
      this.smalltextColor = Colors.grey,
      this.size = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: SvgPicture.asset(
            imageUrl,
            height: 24.h,
            width: 24.w,
          ),
        ),
        SizedBox(width: 13.98.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  bigText,
                  style: TextStyle(
                      color: bigtextColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 7.w,
                ),
                percent == false
                    ? SvgPicture.asset(
                        secondImage,
                      )
                    : SvgPicture.asset(
                        secondImage,
                        height: 12.h,
                        width: 12.w,
                      )
              ],
            ),
            Text(
              smallText,
              style: TextStyle(
                  color: smalltextColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            )
          ],
        )
      ],
    );
  }
}
