import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final bool withicons;
  final String preficon;
  final String sufficon;
  final String hintText;
  final TextInputType textInputType;
  final Color focuscolor;
  final Color iconcolor;
  FocusNode textFieldFocus = FocusNode();

  TextFieldInput({
    Key? key,
    required this.textFieldFocus,
    required this.textEditingController,
    this.isPass = false,
    this.withicons = false,
    this.preficon = "",
    this.sufficon = "",
    required this.focuscolor,
    this.iconcolor = Colors.grey,
    required this.hintText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: Divider.createBorderSide(context),
    );
    final focusInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: Colors.green, width: 2.0),
    );

    return TextField(
      controller: textEditingController,
      focusNode: textFieldFocus,
      decoration: InputDecoration(
        prefixIcon: withicons
            ? Container(
                padding: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 20.h),
                child: SvgPicture.asset(
                  "assets/icons/$preficon",
                  color: iconcolor,
                ),
              )
            : null,
        suffixIcon: isPass
            ? Container(
                padding: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 20.h),
                child: SvgPicture.asset(
                  "assets/icons/$sufficon",
                  color: iconcolor,
                ),
              )
            : null,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        border: inputBorder,
        focusedBorder: focusInputBorder,
        enabledBorder: inputBorder,
        fillColor: focuscolor,
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
      ),
      style: TextStyle(
          fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
