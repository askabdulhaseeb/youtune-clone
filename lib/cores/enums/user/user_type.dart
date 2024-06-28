enum UserType {
  admin('admin', 'Admin'),
  user('user', 'User');

  const UserType(this.json, this.display);
  final String json;
  final String display;

  static UserType fromMap(String? value) {
    if (value == null) return UserType.user;
    return UserType.values.firstWhere(
      (UserType e) => e.json == value,
    );
  }
}
