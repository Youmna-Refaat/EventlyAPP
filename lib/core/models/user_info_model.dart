class UserInformationModel {
  final String name;
  final String email;

  UserInformationModel({
    required this.name,
    required this.email,
  });

  factory UserInformationModel.fromFirestore(Map<String, dynamic> data) {
    return UserInformationModel(
      name: data['name'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
    };
  }
}
