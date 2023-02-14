import 'package:fire_app/responsive/mobilescreen_layout.dart';
import 'package:fire_app/responsive/responsive_layout.dart';
import 'package:fire_app/responsive/webscreen_layout.dart';
import 'package:fire_app/services/auth.dart';
import 'package:fire_app/utils/utils.dart';
import 'package:fire_app/widgets/bigsmall_header.dart';
import 'package:fire_app/widgets/signup_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class SetPicturePage extends StatefulWidget {
  final String email;
  final String password;
  final String firstname;
  final String lastname;
  SetPicturePage(
      {Key? key,
      required this.email,
      required this.password,
      required this.firstname,
      required this.lastname})
      : super(key: key);

  @override
  State<SetPicturePage> createState() => _SetPicturePageState();
}

class _SetPicturePageState extends State<SetPicturePage> {
  bool _addedImage = false;
  XFile? userImage;
  Uint8List? image;
  bool isloading = false;
  takePictureFromGallery(BuildContext context) async {
    userImage =
        await ImagePicker.platform.getImage(source: ImageSource.gallery);

    if (userImage != null) {
      return await userImage!.readAsBytes();
    }
  }

  void selectImage() async {
    Uint8List im = await takePictureFromGallery(context);
    setState(() {
      image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      isloading = true;
    });
    String res = await AuthMethods().signupUser(
        email: widget.email,
        password: widget.password,
        firstname: widget.firstname,
        lastname: widget.lastname,
        file: image!);
    // Navigator.of(context)
    //     .push(SetPinPage());
    setState(() {
      isloading = false;
    });
    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout());
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Center(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                  // height: 19.25.h,
                                  // width: 15.81.w,
                                  child: Icon(Icons.arrow_back))),
                          Text(
                            'skip',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 46.h),
                      BigSmallHeader(
                          bigText: 'Set a photo of yourself',
                          smallText: 'Photo make your profile more engaging'),
                      SizedBox(height: 55.h),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('dolly');
                    // takePictureFromGallery(context);
                    selectImage();
                  },
                  child: CircleAvatar(
                    radius: 80.r,
                    backgroundColor: Color.fromRGBO(242, 242, 242, 1),
                    backgroundImage: image != null
                        ? MemoryImage(
                            image!,
                          )
                        : null,
                    child: Center(
                      child: image == null
                          ? Icon(
                              Icons.person,
                              size: 69.sp,
                              color: Color.fromRGBO(158, 158, 158, 1),
                            )
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: 36.h),
                GestureDetector(
                  onTap: () => print('object'),
                  child: Text(
                    '${widget.firstname} ${widget.lastname}',
                    style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 211.h),
                SignUpButton(
                  onTap: () async {
                    if (image != null) {
                      signUpUser();
                    } else {
                      // takePictureFromGallery(context);
                      selectImage();
                      print('object');
                    }
                  },
                  content: image != null ? 'Continue' : 'Add a photo',
                  loading: isloading,
                ),

                //SizedBox(height: 39.h),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
