import 'package:custom_check_box/custom_check_box.dart';
import 'package:fire_app/responsive/mobilescreen_layout.dart';
import 'package:fire_app/responsive/responsive_layout.dart';
import 'package:fire_app/responsive/webscreen_layout.dart';
import 'package:fire_app/services/auth.dart';
import 'package:fire_app/utils/utils.dart';
import 'package:fire_app/widgets/bigsmall_header.dart';
import 'package:fire_app/widgets/login_links.dart';
import 'package:fire_app/widgets/signup_button.dart';
import 'package:fire_app/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
  bool _isLoading = false;

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
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    // Navigator.of(context)
    //     .push(SetPinPage());

    if (res != 'success') {
      showSnackBar(res, context);
    }
    if (res == 'success') {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout());
      }));
    }
    setState(() {
      _isLoading = false;
    });
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
                height: 15.h,
              ),
              Container(
                height: 48.h,
                child: GestureDetector(
                    //onTap: () => Navigator.of(context).pop(),
                    child: Icon(Icons.arrow_back)),
              ),
              SizedBox(
                height: 36.h,
              ),
              BigSmallHeader(
                  bigText: "Login to your Account",
                  smallText: "Enter your email and password below"),
              SizedBox(height: 41.h),
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
                  loginUser();
                },
                content: 'Continue',
                loading: _isLoading,
              ),
              SizedBox(
                height: 28.h,
              ),
              Center(
                child: GestureDetector(
                  onTap: () => {},
                  child: Text(
                    'Forgot the password?',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 135, 111, 1),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
              LoginLinks(
                  facebook_image: "facebookLogo.svg",
                  google_image: "googleLogo.svg",
                  apple_image: "appleLogo.svg")
            ],
          ),
        ),
      ),
    );
  }
}
