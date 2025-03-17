class UserEditFormModel {
  final String? name;
  final String? email;
  final String? password;
  final String? username;
  final String? ktp;

  UserEditFormModel({
    this.name,
    this.email,
    this.password,
    this.username,
    this.ktp,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'username': username,
      'ktp': ktp,
    };
  }
}
