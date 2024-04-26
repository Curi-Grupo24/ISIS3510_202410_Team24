class TutorModel {
  TutorModel({
    required this.name,
    this.rate = '',
    this.uid = '',
    this.email = '',
    this.price = '',
    this.description = '',
    this.tutoringClasses = const <String>[],
    this.reviews = const <String>[],
  });

  factory TutorModel.fromJson(Map<String, dynamic> json) => TutorModel(
        name: json['name'] as String,
        rate: json['rate'] ?? '',
        uid: json['uid'] ?? '',
        email: json['email'] ?? '',
        price: json['price'] ?? '',
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
  final List<String> tutoringClasses;
  final List<String> reviews;
}
