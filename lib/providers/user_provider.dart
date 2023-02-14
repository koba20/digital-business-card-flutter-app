import 'package:fire_app/models/user.dart';
import 'package:fire_app/services/auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  XnodeUser? _user;
  final AuthMethods _authMethods = AuthMethods();

  XnodeUser get getUser => _user!;

  Future<void> refreshUser() async {
    XnodeUser user = await _authMethods.getUserDetails();
    _user = user;

    notifyListeners();
  }
}
