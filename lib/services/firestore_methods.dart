import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_app/models/link.dart';
import 'package:fire_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contact/contacts.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethoods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Future<String> uploadLink(
  //     String title, String url, String uid, String description) async {
  //   String res = "some error occured";
  //   try {
  //     Post post =
  //         Post(title: title, url: url, uid: uid, description: description);
  //     _firestore.collection("links").doc(uid).set(post.toJson());
  //     res = "success";
  //   } catch (err) {
  //     res = err.toString();
  //   }
  //   return res;
  // }

  Future<Post> getPostDetails() async {
    User currentUser = _auth.currentUser!;

    var snap = await _firestore
        .collection('links')
        .where('uid', isEqualTo: currentUser.uid)
        .get();
    print(snap);
    return Post.fromSnap(snap);
  }

  Future<String> uploadlink(
      String title, String url, String description, String uid) async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String postId = const Uuid().v1(); // creates unique id based on time
      Post post = Post(
        description: description,
        uid: uid,
        postId: postId,
        datePublished: DateTime.now(),
        title: title,
        url: url,
      );
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> connectUser(String uid, String connectId) async {
    try {
      DocumentSnapshot snap =
          await _firestore.collection('users').doc(uid).get();
      List Connections = (snap.data()! as dynamic)['connections'];

      if (Connections.contains(connectId)) {
        await _firestore.collection('users').doc(connectId).update({
          'followers': FieldValue.arrayRemove([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayRemove([connectId])
        });
      } else {
        await _firestore.collection('users').doc(connectId).update({
          'followers': FieldValue.arrayUnion([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayUnion([connectId])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
