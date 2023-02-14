import 'package:fire_app/models/user.dart';
import 'package:fire_app/providers/user_provider.dart';
import 'package:fire_app/services/auth.dart';
import 'package:fire_app/services/firestore_methods.dart';
import 'package:fire_app/utils/utils.dart';
import 'package:fire_app/widgets/add_link_container.dart';
import 'package:fire_app/widgets/link_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AddLinksScreen extends StatefulWidget {
  @override
  State<AddLinksScreen> createState() => _AddLinksScreenState();
}

class _AddLinksScreenState extends State<AddLinksScreen> {
  @override
  Widget build(BuildContext context) {
    XnodeUser user = Provider.of<UserProvider>(context).getUser;
    final items = [
      {
        "name": "Instagram",
        "category": "Recommended",
        "hint": "Instagram username"
      },
      {
        "name": "Twitter",
        "category": "Recommended",
        "hint": "Twitter username"
      },
      {"name": "Number", "category": "Recommended", "hint": "Phone number"},
      {"name": "Email", "category": "Recommended", "hint": "Email address"},
      {
        "name": "LinkedIn",
        "category": "Recommended",
        "hint": "Linkedin profile link"
      },
      {"name": "Contact Card", "category": "Recommended", "hint": ""},
      {"name": "Website", "category": "Recommended", "hint": "Website link"},
      {"name": "Number", "category": "Contact Info", "hint": "Phone number"},
      {"name": "Email", "category": "Contact Info", "hint": "Email address"},
      {"name": "Contact Card", "category": "Contact Info"},
      {
        "name": "Instagram",
        "category": "Social Media",
        "hint": "Instagram username"
      },
      {
        "name": "LinkedIn",
        "category": "Social Media",
        "hint": "Linkedin profile link"
      },
      {
        "name": "Facebook",
        "category": "Social Media",
        "hint": "Facebook profile link"
      },
    ];
    String _selectedItem;
    // final TextEditingController descriptionController = TextEditingController();

    // void postLink(String uid, String title, String url) async {
    //   try {
    //     String res = await FirestoreMethoods().uploadLink(title, url, uid);
    //     if (res == "success") {
    //       showSnackBar("posted", context);
    //     } else {
    //       showSnackBar(res, context);
    //     }
    //   } catch (e) {
    //     showSnackBar(e.toString(), context);
    //   }
    // }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            1.sw <= 380 ? Size.fromHeight(250.h) : Size.fromHeight(230.h),
        child: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xff212121),
                size: 28.sp,
              ),
              //replace with our own icon data.
            ),
            elevation: 0,
            backgroundColor: Colors.grey[50],
            flexibleSpace: Padding(
              padding: EdgeInsets.fromLTRB(25.w, 50.h, 24.w, 0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 42.h,
                            width: 42.w,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(user.photoUrl),
                              radius: 50.r,
                            ),
                          ),
                          SizedBox(
                            height: 11.h,
                          ),
                          Container(
                            height: 17.h,
                            width: 51.w,
                            child: Center(
                                child: Text(
                              "4 links",
                              style: TextStyle(fontSize: 11.32.sp),
                            )),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Link Store",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Search and add links to your xProfile ",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff939393)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 38.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 24.sp,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.r),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Color(0xffeeeeee),
                        filled: true,
                        hintText: "Find all links",
                        hintStyle: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      keyboardType: TextInputType.text,
                    ),
                  )
                ],
              ),
            )),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 25.w, bottom: 31.h, top: 34.h),
            child: Text("Recommended",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700)),
          ),
          ...groupByCategory(items, "Recommended")
              .map((item) => AddLinkContainer(
                    name: item["name"],
                    onTap: () {
                      addlinkpopup(
                          context, item["name"], user.uid, item["hint"]);
                    },
                  )),
          Container(
            padding: EdgeInsets.only(left: 25.w, bottom: 31.h, top: 67.h),
            child: Text("Contact Info",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700)),
          ),
          ...groupByCategory(items, "Contact Info")
              .map((item) => AddLinkContainer(name: item["name"])),
          Container(
            padding: EdgeInsets.only(left: 25.w, bottom: 31.h, top: 67.h),
            child: Text("Social Media",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700)),
          ),
          ...groupByCategory(items, "Social Media")
              .map((item) => AddLinkContainer(name: item["name"])),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> groupByCategory(
    List<Map<String, dynamic>> items,
    String category,
  ) {
    return items
        .where((item) => item["category"] == category)
        .toList(growable: false);
  }
}

Future<void> addlinkpopup(
    BuildContext context, String name, String uid, String hint) {
  return showModalBottomSheet<void>(
      //elevation: 100,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, state) {
          final TextEditingController descriptionController =
              TextEditingController();
          //var descriptionController;
          return Container(
              height: MediaQuery.of(context).size.height * 0.95,
              width: 414.w,
              margin: EdgeInsets.fromLTRB(7.w, 0, 7.w, 7.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r),
                      bottomLeft: Radius.circular(50.r),
                      bottomRight: Radius.circular(50.r))),
              child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 17.h,
                    ),
                    Container(
                      height: 47.17.h,
                      width: 382.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 47.17.h,
                            width: 47.17.w,
                            child: Icon(
                              Icons.arrow_back,
                              color: Color.fromARGB(255, 181, 181, 181),
                              size: 27.sp,
                            ),
                          ),
                          Text(
                            name,
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff212121)),
                          ),
                          // SvgPicture.asset(
                          //   'assets/icons/X.svg',
                          //   height: 45.h,
                          //   width: 45.h,
                          //   color: Color.fromARGB(255, 215, 215, 215),
                          // )
                          GestureDetector(
                            onTap: () {
                              _openUrl(name, descriptionController.text, hint);
                            },
                            child: Text(
                              "preview",
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff212121)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.83.h,
                    ),
                    Center(
                      child: Container(
                        height: 129.h,
                        width: 129.w,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 50.r,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 51.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 21.w),
                      child: Container(
                        height: 50.h,
                        child: TextField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 13.h),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Color(0xfffafafa),
                            filled: true,
                            hintText: name,
                            hintStyle: TextStyle(
                                fontSize: 11.67.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff9e9e9e)),
                          ),
                          style: TextStyle(
                              fontSize: 11.67.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 311.h,
                    ),
                    linkButton(
                      content: "Add Another ${name}",
                      backgroundColor: Color(0xffececec),
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 17.36.h,
                    ),
                    linkButton(
                      content: "Save Link",
                      onTap: () {
                        return postLink(context,
                            uid: uid,
                            title: name,
                            url: getUrl(name, descriptionController.text, hint),
                            description: descriptionController.text);
                      },
                    )
                  ]));
        });
      });
}

void postLink(BuildContext context,
    {required String uid,
    required String title,
    required String url,
    required String description}) async {
  try {
    String res = await FirestoreMethoods().uploadlink(
      title,
      url,
      description,
      uid,
    );
    if (res == "success") {
      //showSnackBar("posted", context);
      print("posted");
    } else {
      //showSnackBar(res, context);
      print(res);
    }
  } catch (e) {
    //showSnackBar(e.toString(), context);
    print(e.toString());
  }
}

void _openUrl(String title, String username, String hintText) async {
  String url = getUrl(title, username, hintText);
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

getUrl(String title, String username, String hintText) {
  String url = '';
  if (hintText.contains("link")) {
    url = username;
  }

  if (hintText.contains("username")) {
    url = "https://www.$title.com/$username";
  }

  if (hintText.contains("address")) {
    final Uri params = Uri(scheme: 'mailto', path: username, queryParameters: {
      'subject': 'Default Subject',
      'body': 'Default body'
    });
    url = params.toString();
  }

  if (hintText.contains("number")) {
    url = "sms:$username?body=m";
  }
  return url;
}
