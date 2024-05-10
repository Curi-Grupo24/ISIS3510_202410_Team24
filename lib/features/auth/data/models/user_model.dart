class UserModel {
  UserModel({
    required this.email,
    required this.type,
    this.name = '',
    this.phone = '',
    this.carreer = '',
    this.studentCode = '',
    this.profilePicture = '',
    this.myClasses = const <String>[],
    this.myTutorsClasses = const <String>[],
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] as String,
        type: json['type'] as String,
        phone: json['phone'] ?? '',
        email: json['email'] ?? '',
        carreer: json['career'] ?? '',
        studentCode: json['studentCode'] ?? '',
        profilePicture: json['profilePicture']??'https://cdn.pixabay.com/photo/2018/11/13/22/01/instagram-3814082_1280.png',
        myClasses: (json['myClasses']  as List<dynamic>?) 
            ?.cast<String>() 
            ?? const <String>[],
        myTutorsClasses: (json['myTutorClasses']  as List<dynamic>?) 
            ?.cast<String>() 
            ?? const <String>[], 
      );

  final String email;
  final String type;
  final String? name;
  final String? phone;
  final String? carreer;
  final String? studentCode;
  final String? profilePicture;
  final List<String> myClasses;
  final List<String> myTutorsClasses;
}
