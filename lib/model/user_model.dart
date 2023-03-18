class UserModel {
  String userName;
  String phone;
  String email;
  String uId;
  String? image;

  UserModel({
    this.uId = '',
    required this.email,
    required this.phone,
    required this.userName,
    this.image,
  });

  UserModel.fromFireStore(Map<String, dynamic> data)
      : this(
    uId: data['uId'],
          email: data['email'],
          userName: data['userName'],
          phone: data['phone'],
          image: data['image'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'uId': uId,
      'email': email,
      'userName': userName,
      'phone': phone,
      'image': image,
    };
  }
}
