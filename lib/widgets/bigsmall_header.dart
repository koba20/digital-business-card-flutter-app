import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigSmallHeader extends StatelessWidget {
  final String bigText;
  final String smallText;

  BigSmallHeader({
    Key? key,
    required this.bigText,
    required this.smallText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(bigText,
            style: TextStyle(
                fontSize: 42.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff212121))),
        SizedBox(
          height: 14.h,
        ),
        Container(
          height: 41.h,
          child: Text(smallText,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff969696))),
        )
      ],
    );
  }
}
