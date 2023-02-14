import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class Post {
  final String title;
  final String uid;
  final String url;
  final String description;
  final String postId;
  final DateTime datePublished;
  // final String svgurl;

  Post(
      {required this.title,
      required this.url,
      required this.uid,
      required this.description,
      required this.postId,
      required this.datePublished
      // required this.svgurl,
      });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "url": url,
      "uid": uid,
      "description": description,
      "postId": postId,
      "datePosted": datePublished
    };
  }

  static Post fromSnap(QuerySnapshot<Map<String, dynamic>> snap) {
    var snapshot = snap.docs as Map<String, dynamic>;

    return Post(
        title: snapshot['title'],
        url: snapshot['url'],
        uid: snapshot['uid'],
        description: snapshot['description'],
        postId: snapshot['postId'],
        datePublished: snapshot['snapshot']);
  }
}
