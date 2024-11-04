class UserModel {
  final int? id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String? password;
  final String? createdAt;
  final String? updatedAt;

  UserModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'email': email,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
