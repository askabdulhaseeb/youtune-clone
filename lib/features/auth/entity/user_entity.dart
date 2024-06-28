import '../../../cores/enums/user/user_type.dart';

class UserEntity {
  UserEntity({
    required this.uid,
    required this.username,
    required this.displayName,
    required this.email,
    required this.photoURL,
    required this.phoneNumber,
    required this.description,
    required this.subscriptions,
    required this.videos,
    required this.type,
  });

  final String uid;
  final String username;
  final String displayName;
  final String email;
  final String photoURL;
  final String phoneNumber;
  final String description;

  final List<String> subscriptions;
  final int videos;
  final UserType type;

  String get username1 => email.split('@').first;
  bool canAccess() {
    return type == UserType.admin || type == UserType.user;
  }
}
