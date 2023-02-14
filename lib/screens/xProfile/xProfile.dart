import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:fire_app/models/user.dart';
import 'package:fire_app/providers/user_provider.dart';
import 'package:fire_app/screens/xProfile/add_links_page.dart';
import 'package:fire_app/screens/xProfile/add_links_screen.dart';
import 'package:fire_app/services/auth.dart';
import 'package:fire_app/widgets/icon_and_text.dart';
import 'package:fire_app/widgets/link_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class xProfile extends StatefulWidget {
  const xProfile({super.key});

  @override
  State<xProfile> createState() => _xProfileState();
}

class _xProfileState extends State<xProfile> {
  @override
  void initState() {
    super.initState();
    //AuthMethods().signOut();
    //getDetails();
  }

  void getDetails() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    print(snap.data());
  }

  @override
  Widget build(BuildContext context) {
    XnodeUser user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
      child: Center(
          child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddLinksScreen()));
              },
              child: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 57.69.h,
                        width: 57.69.w,
                        child: CircleAvatar(
                            radius: 181.407.r,
                            backgroundImage: NetworkImage(user.photoUrl)),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12.64.w, 0, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${user.firstname} ${user.lastname}",
                                  //"",
                                  style: TextStyle(
                                      fontSize: 16.25.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                SvgPicture.asset(
                                  'assets/icons/sharelink.svg',
                                  height: 12.94.h,
                                  width: 12.94.w,
                                )
                              ],
                            ),
                            Text(
                              "Tap to Scan & Share",
                              style: TextStyle(
                                  color: Color(0xff969696),
                                  fontSize: 9.75.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddLinksScreen()));
                    },
                    child: SvgPicture.asset(
                      'assets/icons/Setting.svg',
                      height: 19.22.h,
                      width: 17.79.w,
                    ),
                  ),
                  SizedBox(
                    width: 26.93.w,
                  ),
                  SvgPicture.asset(
                    'assets/icons/Line 1.svg',
                    height: 19.22.h,
                    width: 17.79.w,
                  ),
                  SizedBox(
                    width: 23.67.w,
                  ),
                  SvgPicture.asset(
                    'assets/icons/Notification.svg',
                    height: 26.67.h,
                    width: 22.67.w,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 37.14.h,
        ),
        Container(
          height: 262.h,
          width: 389.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
            color: Color(0xffF5F5F5),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.w, 0.h, 32.w, 0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 35.w, 0, 0),
                    child: Text(
                      "Your Analytics",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 27.h),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 34.h,
                        width: 75.w,
                        child: Center(
                          child: Text(
                            "View more",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 9.75.sp,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Color(0xff00876F)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 36.25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconAndText(
                        bigText: "128",
                        smallText: "Nation Ranking",
                        imageUrl: "assets/icons/Bookmark.svg",
                        secondImage: "assets/icons/Arrow-Up.svg",
                      ),
                      SizedBox(
                        height: 41.h,
                      ),
                      IconAndText(
                        bigText: "64",
                        smallText: "New Connections",
                        imageUrl: "assets/icons/3 User.svg",
                        secondImage: "assets/icons/Arrow-Down.svg",
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconAndText(
                        bigText: "69",
                        smallText: "Top Streak",
                        imageUrl: "assets/icons/Star.svg",
                        secondImage: "assets/icons/Arrow-Up.svg",
                      ),
                      SizedBox(
                        height: 41.h,
                      ),
                      IconAndText(
                        bigText: "4.24",
                        smallText: "Top Through Rate",
                        imageUrl: "assets/icons/Chart.svg",
                        secondImage: "assets/icons/percentage.svg",
                        // percent: true,
                      ),
                    ],
                  )
                ],
              ),
            ]),
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        Container(
          height: 428.h,
          width: 389.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: Color(0xffF5F5F5),
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffF5F5F5), Colors.white],
                  stops: [0.0, 1])),
          child: Column(children: [
            SizedBox(
              height: 12.h,
            ),
            Container(
              height: 4.h,
              width: 64.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: Color(0xffD7D8DA)),
            ),
            SizedBox(
              height: 29.h,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.w, 0, 0, 0),
              child: Row(
                children: [
                  Text(
                    "My links",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 118.w),
                  SvgPicture.asset("assets/icons/Info Square.svg"),
                  SizedBox(width: 5.72.w),
                  Text(
                    "Direct Capture",
                    style: TextStyle(
                        fontSize: 11.92.sp, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 33.h,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('posts')
                  .where('uid', isEqualTo: user.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final posts = snapshot.data!.docs;
                return Expanded(
                  child: ListView.builder(
                    itemCount: posts.length + 1,
                    itemBuilder: (context, index) {
                      if (index == posts.length) {
                        return Container(
                          padding: EdgeInsets.only(
                              left: 72.w, right: 72.w, top: 14.h, bottom: 0.h),
                          child: GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 100.h),
                              height: 42.13.h,
                              //width: 244.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    62.89.r,
                                  ),
                                  color: Color.fromRGBO(0, 135, 111, 1)),
                              child: Center(
                                child: Text(
                                  "Add Links & Contact info  +",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 11.32.sp,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AddLinksScreen(),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        final post = posts[index];
                        String url = post['url'];
                        if (post['title'].toString().contains("Number")) {
                          url = post['description'];
                        }
                        if (post['title'].toString().contains("Email")) {
                          url = post['description'];
                        }
                        return Link_Container(
                            image: "assets/icons/Chat.svg",
                            bigText: "My ${post['title']}",
                            url: url);
                      }
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 26.h,
            ),
          ]),
        ),
      ])),
    )));
  }
}
