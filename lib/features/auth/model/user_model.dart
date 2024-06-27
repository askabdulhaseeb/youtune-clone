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

  // ignore: sort_constructors_first
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      displayName: map['displayName'] ?? '',
      email: map['email'] ?? '',
      photoURL: map['photoURL'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      description: map['description'] ?? '',
      subscriptions: List<String>.from(map['subscriptions']),
      videos: map['videos'] ?? 0,
      type: UserType.fromMap(map['type']),
    );
  }
}
