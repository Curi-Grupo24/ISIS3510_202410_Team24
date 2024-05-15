class TutorModel {
  TutorModel({
    required this.name,
    this.rate = '',
    this.uid = '',
    this.email = '',
    this.price = '',
    this.description = '',
    this.profilePicture = '',
    this.tutoringClasses = const <String>[],
    this.reviews = const <String>[],
  });

  factory TutorModel.fromJson(Map<String, dynamic> json) => TutorModel(
        name: json['name'] as String,
        rate: json['rate'] ?? '',
        uid: json['uid'] ?? '',
        email: json['email'] ?? '',
        price: json['price'] ?? '',
        profilePicture: json['profilePicture']??'https://static.vecteezy.com/system/resources/thumbnails/036/280/651/small_2x/default-avatar-profile-icon-social-media-user-image-gray-avatar-icon-blank-profile-silhouette-illustration-vector.jpg',
        description: json['description'] ?? '',
        tutoringClasses:
            (json['tutoringClasses'] as List<dynamic>?)?.cast<String>() ??
                const <String>[],
        reviews: (json['reviews'] as List<dynamic>?)?.cast<String>() ??
            const <String>[],
      );

  final String name;
  final String? rate;
  final String? uid;
  final String? email;
  final String? price;
  final String? description;
  final String? profilePicture;
  final List<String> tutoringClasses;
  final List<String> reviews;
}
