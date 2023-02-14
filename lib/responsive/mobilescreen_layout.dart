import 'package:fire_app/models/user.dart';
import 'package:fire_app/providers/user_provider.dart';
import 'package:fire_app/screens/authentication/login.dart';
import 'package:fire_app/screens/authentication/signup.dart';
import 'package:fire_app/widgets/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  @override
  Widget build(BuildContext context) {
    //XnodeUser user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: RootApp(),
    );
  }
}
