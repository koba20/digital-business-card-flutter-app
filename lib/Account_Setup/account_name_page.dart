import 'package:custom_check_box/custom_check_box.dart';
import 'package:fire_app/Account_Setup/set_picture_page.dart';
import 'package:fire_app/services/auth.dart';
import 'package:fire_app/widgets/bigsmall_header.dart';
import 'package:fire_app/widgets/signup_button.dart';
import 'package:fire_app/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Account_Name extends StatefulWidget {
  final String email;
  final String password;
  const Account_Name({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  State<Account_Name> createState() => _Account_NameState();
}

class _Account_NameState extends State<Account_Name> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  FocusNode emailFocusNode = FocusNode(canRequestFocus: true);
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode firstNameFocusNode = FocusNode();
  Color _emailcolor = Colors.white;
  Color _passwordcolor = Colors.white;
  Color _emailIconColor = Colors.grey;
  Color _passwordIconColor = Colors.grey;
  bool isChecked = false;
  @override
  void initState() {
    firstNameFocusNode.addListener(() {
      if (firstNameFocusNode.hasFocus) {
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
    lastNameFocusNode.addListener(() {
      if (lastNameFocusNode.hasFocus) {
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
                  bigText: "What’s your name?",
                  smallText: "This will be displayed on your xNode profile"),
              SizedBox(height: 41.h),
              TextFieldInput(
                textEditingController: _firstNameController,
                hintText: "First name",
                textInputType: TextInputType.name,
                focuscolor: _emailcolor,
                textFieldFocus: firstNameFocusNode,
                iconcolor: _emailIconColor,
              ),
              SizedBox(height: 20.h),
              TextFieldInput(
                textEditingController: _lastNameController,
                hintText: "Last name",
                textInputType: TextInputType.name,
                focuscolor: _passwordcolor,
                textFieldFocus: lastNameFocusNode,
                iconcolor: _passwordIconColor,
              ),
              SizedBox(
                height: 19.h,
              ),
              SizedBox(
                height: 53.h,
              ),
              // SignUpButton(
              //     function: (ctx) => () async {
              //           String res = await AuthMethods().signupUser(
              //               email: widget.email,
              //               password: widget.password,
              //               firstname: _firstNameController.text,
              //               lastname: _lastNameController.text);
              //         },
              //     content: 'Continue'),

              SignUpButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SetPicturePage(
                            email: widget.email,
                            password: widget.password,
                            firstname: _firstNameController.text,
                            lastname: _lastNameController.text)),
                  );
                },
                content: "Continue",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
