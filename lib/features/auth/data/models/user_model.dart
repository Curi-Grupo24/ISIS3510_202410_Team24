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
        profilePicture: json['profilePicture']??'https://static.vecteezy.com/system/resources/thumbnails/036/280/651/small_2x/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg',
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
