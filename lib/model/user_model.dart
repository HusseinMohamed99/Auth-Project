class UserModel {
  String userName;
  String phone;
  String email;
  String uId;

  UserModel({
    this.uId = '',
    required this.email,
    required this.phone,
    required this.userName,
  });

  UserModel.fromFireStore(Map<String, dynamic> data)
      : this(
          uId: data['uId'],
          email: data['email'],
          userName: data['userName'],
          phone: data['phone'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'uId': uId,
      'email': email,
      'userName': userName,
      'phone': phone,
    };
  }
}
