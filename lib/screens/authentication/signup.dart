import 'package:custom_check_box/custom_check_box.dart';
import 'package:fire_app/Account_Setup/account_name_page.dart';
import 'package:fire_app/services/auth.dart';
import 'package:fire_app/widgets/bigsmall_header.dart';
import 'package:fire_app/widgets/signup_button.dart';
import 'package:fire_app/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode(canRequestFocus: true);
  FocusNode passwordFocusNode = FocusNode();
  FocusNode _textFieldFocus = FocusNode();
  Color _emailcolor = Colors.white;
  Color _passwordcolor = Colors.white;
  Color _emailIconColor = Colors.grey;
  Color _passwordIconColor = Colors.grey;
  bool isChecked = false;
  @override
  void initState() {
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _emailcolor = Color(0xffF2FFFD);
          _emailIconColor = Color(0xff00876F);
        });
      } else {
        setState(() {
          _emailcolor = Colors.white;
          _emailIconColor = Colors.grey;
        });
      }
    });
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        setState(() {
          _passwordcolor = Color(0xffF2FFFD);
          _passwordIconColor = Color(0xff00876F);
        });
      } else {
        setState(() {
          _passwordcolor = Colors.white;
          _passwordIconColor = Colors.grey;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              GestureDetector(
                  //onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.arrow_back)),
              SizedBox(
                height: 51.78.h,
              ),
              BigSmallHeader(
                  bigText: "Create your Account",
                  smallText: "Enter your email and password below"),
              SizedBox(height: 28.h),
              TextFieldInput(
                withicons: true,
                preficon: "Message.svg",
                textEditingController: _emailController,
                hintText: "Email",
                textInputType: TextInputType.emailAddress,
                focuscolor: _emailcolor,
                textFieldFocus: _textFieldFocus,
                iconcolor: _emailIconColor,
              ),
              SizedBox(height: 20.h),
              TextFieldInput(
                withicons: true,
                isPass: true,
                preficon: "Lock.svg",
                sufficon: "Hide.svg",
                textEditingController: _passwordController,
                hintText: "password",
                textInputType: TextInputType.emailAddress,
                focuscolor: _passwordcolor,
                textFieldFocus: passwordFocusNode,
                iconcolor: _passwordIconColor,
              ),
              SizedBox(
                height: 19.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 110.w),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCheckBox(
                      value: isChecked,
                      onChanged: ((value) {
                        setState(() {
                          isChecked = value;
                        });
                      }),
                      borderRadius: 8.r,
                      borderWidth: 3.w,
                      shouldShowBorder: true,
                      checkBoxSize: 20.sp,
                      checkedFillColor: Color.fromRGBO(0, 135, 111, 1),
                      checkedIconColor: Colors.white,
                      borderColor: Color.fromRGBO(0, 135, 111, 1),
                    ),
                    Text(
                      'Remember me',
                      style: TextStyle(
                          color: Color(0xff212121),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 28.h,
              ),

              SignUpButton(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Account_Name(
                          email: _emailController.text,
                          password: _passwordController.text);
                    }));
                  },
                  content: 'Continue'),
              // SignUpButton(
              //   onTap: () async {
              //     await AuthMethods().signupUser(
              //       email: _emailController.text,
              //       password: _passwordController.text,
              //       // firstname: _firstNameController.text,
              //       // lastname: _lastNameController.text
              //     );
              //     print("res");
              //   },
              //   content: "Continue",
              // ),
              SizedBox(
                height: 51.h,
              ),
              Center(
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'By tapping Continue, you agree to our',
                        style: TextStyle(
                            color: Color.fromRGBO(150, 150, 150, 1),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                              text: '\nTerms',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.sp),
                              children: [
                                TextSpan(
                                    text: ' &',
                                    style: TextStyle(
                                        color: Color.fromRGBO(150, 150, 150, 1),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                                    children: [
                                      TextSpan(
                                          text: ' privacy policy',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14.sp),
                                          children: [])
                                    ])
                              ])
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
