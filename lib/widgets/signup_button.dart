import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//modify background color for dark mode
class SignUpButton extends StatelessWidget {
  final Function()? onTap;
  final String content;
  bool preview;
  bool loading;
  Color color;
  Color backgroundColor;
  SignUpButton(
      {this.onTap,
      required this.content,
      this.loading = false,
      this.preview = false,
      this.color = Colors.white,
      this.backgroundColor = const Color.fromRGBO(0, 135, 111, 1),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 67.h,
          width: 388.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: backgroundColor),
          child: loading
              ? Center(
                  child: CircularProgressIndicator(
                    color: color,
                  ),
                )
              : Center(
                  child: Text(
                    content,
                    style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp),
                  ),
                ),
        ));
  }
}
