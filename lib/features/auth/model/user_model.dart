import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../cores/enums/user/user_type.dart';
import '../entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uid,
    required super.username,
    required super.displayName,
    required super.email,
    required super.photoURL,
    required super.phoneNumber,
    required super.description,
    required super.subscriptions,
    required super.videos,
    required super.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'username': username,
      'displayName': displayName,
      'email': email,
      'photoURL': photoURL,
      'phoneNumber': phoneNumber,
      'description': description,
      'subscriptions': subscriptions,
      'videos': videos,
      'type': type.json,
    };
  }

  Map<String, dynamic> toMapUpdate() {
    return <String, dynamic>{
      'displayName': displayName,
      'photoURL': photoURL,
      'phoneNumber': phoneNumber,
      'description': description,
    };
  }


  // ignore: sort_constructors_first
  factory UserModel.fromMap(DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserModel(
      uid: doc.data()?['uid'] ?? '',
      username: doc.data()?['username'] ?? '',
      displayName: doc.data()?['displayName'] ?? '',
      email: doc.data()?['email'] ?? '',
      photoURL: doc.data()?['photoURL'] ?? '',
      phoneNumber: doc.data()?['phoneNumber'] ?? '',
      description: doc.data()?['description'] ?? '',
      subscriptions: List<String>.from(doc.data()?['subscriptions']),
      videos: doc.data()?['videos'] ?? 0,
      type: UserType.fromMap(doc.data()?['type']),
    );
  }
}
