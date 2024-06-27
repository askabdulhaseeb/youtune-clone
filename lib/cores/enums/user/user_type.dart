enum UserType {
  admin('admin', 'Admin'),
  user('user', 'User');

  const UserType(this.json, this.display);
  final String json;
  final String display;

  static UserType fromMap(Map<String, dynamic> map) {
    return UserType.values.firstWhere(
      (UserType e) => e.json == map['json'],
    );
  }
}
