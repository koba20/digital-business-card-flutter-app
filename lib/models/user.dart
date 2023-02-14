import 'package:cloud_firestore/cloud_firestore.dart';

class XnodeUser {
  final String email;
  final String firstname;
  final String lastname;
  final String uid;
  final String bio;
  final String pin;
  final String photoUrl;
  final List connections;

  XnodeUser({
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.uid,
    required this.bio,
    required this.pin,
    required this.photoUrl,
    required this.connections,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "firstname": firstname,
      "lastname": lastname,
      "uid": uid,
      "bio": bio,
      "pin": pin,
      "connections": connections,
      "photoUrl": photoUrl
    };
  }

  static XnodeUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return XnodeUser(
        email: snapshot['email'],
        firstname: snapshot['firstname'],
        lastname: snapshot['lastname'],
        uid: snapshot['uid'],
        bio: snapshot['bio'],
        pin: snapshot['pin'],
        photoUrl: snapshot['photoUrl'],
        connections: snapshot['connections']);
  }
}
