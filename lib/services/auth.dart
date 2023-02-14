import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/models/link.dart';
import 'package:fire_app/models/user.dart';
import 'package:fire_app/services/storage_method.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<XnodeUser> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    print(snap);
    return XnodeUser.fromSnap(snap);
  }

  Future signupUser(
      {required String email,
      required String password,
      required String firstname,
      required String lastname,
      required Uint8List file}) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          firstname.isNotEmpty ||
          lastname.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);
        String photoUrl = await StorageMethods()
            .uploadImageToStorage("profilePics", file, false);

        XnodeUser user = XnodeUser(
            email: email,
            firstname: firstname,
            lastname: lastname,
            uid: cred.user!.uid,
            bio: "",
            pin: "",
            photoUrl: photoUrl,
            connections: []);
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Future<String> postLink(String title, String url, String uid) async {
  //   String res = "some error occured";
  //   User currentUser = _auth.currentUser!;
  //   DocumentReference _ref =
  //       _firestore.collection('users').doc(currentUser.uid);
  //   try {
  //     doesNameAlreadyExist(title);
  //     Post post = Post(title: title, url: url, uid: uid);
  //     _ref.collection("links").add(post.toJson());
  //     res = "success";
  //   } catch (err) {
  //     res = err.toString();
  //   }
  //   return res;
  // }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> doesNameAlreadyExist(String name) async {
    final QuerySnapshot result = await _firestore
        .collection('links')
        .where('title', isEqualTo: name)
        .limit(1)
        .get();
    print('this is ${result.toString()}');

    //final List<DocumentSnapshot> documents = result.documents;
    //return documents.length == 1;
  }

  // Future<String> updateOrAddValue(
  //     String title, String url, String uid, String description) async {
  //   // Check if the value already exists in the collection
  //   String res = "some error occured";
  //   User currentUser = _auth.currentUser!;
  //   DocumentReference _ref =
  //       _firestore.collection('users').doc(currentUser.uid);
  //   try {
  //     Post post =
  //         Post(title: title, url: url, uid: uid, description: description);
  //     _ref
  //         .collection("links")
  //         .where("title", isEqualTo: title)
  //         .get()
  //         .then((querySnapshot) {
  //       if (querySnapshot.docs.length > 0) {
  //         // Value exists, update it
  //         querySnapshot.docs.first.reference.update(post.toJson());
  //         res = "updated";
  //         print(res);
  //       } else {
  //         // Value doesn't exist, add it to the collection
  //         _ref.collection("links").add(post.toJson());
  //         res = "post";
  //         print(res);
  //       }
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return res;
  // }
}
