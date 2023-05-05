class UserDataModel {
  final String userId;
  final String name;
  final String email;
  final String password;
  final String ? image;
  final String phone;
  final DateTime createdTime;

  UserDataModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.image,
    required this.phone,
    required this.createdTime,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        userId: json['userId'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        image: json['image'] ,
        phone: json['phone'],
        createdTime: json['createdTime'].toDate(),
      );

  Map<String, dynamic> toMap() => {
    'userId' : userId ,
    'name' : name ,
    'email' : email ,
    'password' : password ,
    'phone' : phone ,
    'image' : image ,
    'createdTime' : createdTime ,
  };
}
