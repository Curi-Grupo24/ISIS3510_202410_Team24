class ClassModel {
  ClassModel({
    required this.className,
    required this.career,
    this.image = '',
    this.type = '',
    this.semester = const <String>[],
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        career: json['career'] ?? '',
        className: json['className'] ?? '',
        image: json['image'] ?? '',
        type: json['type'],
        semester: (json['semester'] as List<dynamic>?) 
            ?.cast<String>() 
            ?? const <String>[], 
      );

  final String className;
  final String career;
  final String? image;
  final String? type;
  final List<String> semester;
}
