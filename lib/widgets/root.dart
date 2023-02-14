import 'package:fire_app/screens/xPay/xPay.dart';
import 'package:fire_app/screens/xProfile/xProfile.dart';
import 'package:fire_app/widgets/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RootApp extends StatefulWidget {
  RootApp({Key? key}) : super(key: key);
  static const String pageName = '/RootApp';
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  List barItems = [
    {
      "image": 'assets/icons/XProf.svg',
      "active_image": 'assets/icons/ActiveXprofile.svg',
      "page": xProfile(),
      "title": "Home",
    },
    {
      "image": 'assets/icons/Wallet.svg',
      "active_image": 'assets/icons/ActiveWallet.svg',
      "page": MyListPage(),
      "title": "Pay"
    },
    {
      "image": 'assets/icons/Password.svg',
      "active_image": 'assets/icons/ActivePassword.svg',
      "page": xProfile(),
      "title": "Pass"
    },
  ];

  @override
  Widget build(BuildContext context) {
    // print("your current height is " +
    //MediaQuery.of(context).size.height.toString());
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: getBarPage(),
      // bottomNavigationBar: getBottomBar1()
      floatingActionButton: getBottomBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget getBarPage() {
    return IndexedStack(
        index: activeTab,
        children:
            List.generate(barItems.length, (index) => barItems[index]["page"]));
  }

  Widget getBottomBar() {
    return Container(
      height: 86.h,
      width: 245.w,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                blurRadius: 1.r, spreadRadius: 1.r, offset: Offset(0, 1.h))
          ]),
      child: Padding(
        padding: EdgeInsets.only(top: 15.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
                barItems.length,
                (index) => BottomBarItem(
                      activeTab == index
                          ? barItems[index]["active_image"]
                          : barItems[index]["image"],
                      barItems[index]["title"],
                      isActive: activeTab == index,
                      onTap: () {
                        setState(() {
                          activeTab = index;
                        });
                      },
                    ))),
      ),
    );
  }
}
