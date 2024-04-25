class TutorModel {
  TutorModel({
    required this.name,
    this.rate = '',
    this.price = '',
    this.description = '',
    this.tutoringClasses = const <String>[],
    this.reviews = const <String>[],
  });

  factory TutorModel.fromJson(Map<String, dynamic> json) => TutorModel(
        name: json['name'] as String,
        rate: json['rate'] ?? '',
        price: json['career'] ?? '',
        description: json['description'] ?? '',
        tutoringClasses:
            (json['tutoringClasses'] as List<dynamic>?)?.cast<String>() ??
                const <String>[],
        reviews: (json['reviews'] as List<dynamic>?)?.cast<String>() ??
            const <String>[],
      );

  final String name;
  final String? rate;
  final String? price;
  final String? description;
  final List<String> tutoringClasses;
  final List<String> reviews;
}
