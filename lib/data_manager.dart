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

class Category {
  Category({this.id, this.title, this.type});

  String id;
  String title;
  String type;

  @override
  String toString() {
    return "$id - $title - $type";
  }
}

Future<List<Category>> listCategories({String type}) async {
  FirebaseUser _user = await currentUser();
  CollectionReference _categoriesCollection = _firestore.collection('users/${_user.uid}/categories');
  QuerySnapshot querySnapshot;
  if(type != null){
    querySnapshot = await _categoriesCollection.where('type', isEqualTo: type).getDocuments();
  }else{
    querySnapshot = await _categoriesCollection.getDocuments();
  }

  List<Category> categories =
      querySnapshot.documents.map((DocumentSnapshot document) {
    return Category(
        id: document.data['id'],
        title: document.data['title'],
        type: document.data['type']);
  }).toList(growable: false);
  return categories;
}

Future<Null> addCrop(String name, String farmer, String note) async {
  FirebaseUser _user = await currentUser();
  DocumentReference _cropRef =
      _firestore.collection('users/${_user.uid}/crops').document();
  Map<String, dynamic> _data = {
    'id': _cropRef.documentID,
    'name': name,
    'farmer': farmer,
    'note': note,
  };
  await _cropRef.setData(_data);
}

class Crop {
  Crop({this.id, this.name, this.farmer, this.note});

  String id;
  String name;
  String farmer;
  String note;

  @override
  String toString() {
    return "$id - $name - $farmer - $note";
  }
}

Future<List<Crop>> listCrops() async {
  FirebaseUser _user = await currentUser();
  QuerySnapshot querySnapshot =
      await _firestore.collection('users/${_user.uid}/crops').getDocuments();
  List<Crop> crops = querySnapshot.documents.map((DocumentSnapshot document) {
    return Crop(
        id: document.data['id'],
        name: document.data['name'],
        farmer: document.data['farmer'],
        note: document.data['note']);
  }).toList(growable: false);
  return crops;
}

Future<Null> addTransaction(int amount, String type, String category,
    String note, String status, DateTime date) async {
  FirebaseUser _user = await currentUser();
  DocumentReference _txnRef =
      _firestore.collection('users/${_user.uid}/transactions').document();
  Map<String, dynamic> _data = {
    'id': _txnRef.documentID,
    'amount': amount,
    'type': type,
    'category': category,
    'note': note,
    'status': status,
    'date': date
  };
  await _txnRef.setData(_data);
}

class Transaction {
  Transaction({this.id, this.amount, this.type, this.category, this.note, this.status, this.date});

  String id;
  int amount;
  String type;
  String category;
  String note;
  String status;
  DateTime date;

  @override
  String toString() {
    return "$id - $amount $type $category $note $status $date";
  }
}

Future<List<Transaction>> listTransactions() async {
  FirebaseUser _user = await currentUser();
  QuerySnapshot querySnapshot =
      await _firestore.collection('users/${_user.uid}/transactions').getDocuments();
  List<Transaction> txns = querySnapshot.documents.map((DocumentSnapshot document) {
    return Transaction(
        id: document.data['id'],
        amount: document.data['amount'],
        type: document.data['type'],
        category: document.data['category'],
        note: document.data['note'],
        status: document.data['status'],
        date: document.data['date']);
  }).toList(growable: false);
  return txns;
}
