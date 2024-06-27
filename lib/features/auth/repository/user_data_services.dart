import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';

final Provider<UserDataServices> userDataServiceProvider =
    Provider<UserDataServices>(
  (ProviderRef<Object?> ref) => UserDataServices(
    auth: FirebaseAuth.instance,
    db: FirebaseFirestore.instance,
  ),
);

class UserDataServices {
  const UserDataServices({required this.auth, required this.db});

  final FirebaseAuth auth;
  final FirebaseFirestore db;

  Future<bool> createUser(UserModel model) async {
    try {
      await db
          .collection('users')
          .doc(auth.currentUser!.uid)
          .set(model.toMap());
    } catch (e) {
      debugPrint('Error in createUser: $e');
      return false;
    }
    return true;
  }
}
