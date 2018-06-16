import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

GoogleSignIn _googleSignIn = new GoogleSignIn(
  scopes: ['email'],
);

final FirebaseAuth _auth = FirebaseAuth.instance;
final Firestore _firestore = Firestore.instance;

Future<FirebaseUser> handleSignIn() async {
  GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  FirebaseUser user = await _auth.signInWithGoogle(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  print("signed in " + user.displayName);
  return user;
}

Future<FirebaseUser> annonymusSignIn() async {
  FirebaseUser user = await _auth.signInAnonymously();
  print("signed in " + user.uid);
  return user;
}

Future<FirebaseUser> currentUser() {
  return _auth.currentUser();
}

Future<Null> addCategory(String category, String type) async {
  print("addCategory - Category $category Type $type");
  FirebaseUser _user = await currentUser();
  DocumentReference _categoryRef =
      _firestore.collection('users/${_user.uid}/categories').document();
  Map<String, dynamic> _data = {
    'id': _categoryRef.documentID,
    'title': category,
    'type': type
  };
  await _categoryRef.setData(_data);
}
