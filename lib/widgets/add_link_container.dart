import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddLinkContainer extends StatelessWidget {
  final Function()? onTap;
  final String name;
  final String socialicon;

  AddLinkContainer(
      {super.key, required this.name, this.socialicon = "Chat", this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(25.w, 0.h, 25.w, 12.h),
        padding: EdgeInsets.only(right: 25.w, left: 26.w),
        height: 62.h,
        width: 379.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Color(0xffebeaea)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/$socialicon.svg"),
                  SizedBox(
                    width: 16.w,
                  ),
                  Text(
                    name,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Container(
              height: 29.h,
              width: 58.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: Color(0xffd9d9d9)),
              child: Center(
                  child: Text("Add",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w700))),
            )
          ],
        ),
      ),
    );
  }
}
