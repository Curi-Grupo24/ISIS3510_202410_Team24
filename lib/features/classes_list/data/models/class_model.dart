class ClassModel {
  ClassModel({
    required this.className,
    required this.career,
    required this.uid,
    this.image = '',
    this.type = '',
    this.semester = const <String>[],
    this.availableTutors = const <String>[],
    this.waitingAreaTutors = const <String>[],
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        career: json['career'] ?? '',
        uid: json['uid'],
        className: json['className'] ?? '',
        image: json['image'] ?? '',
        type: json['type'],
        semester: (json['semester'] as List<dynamic>?) 
            ?.cast<String>() 
            ?? const <String>[], 
        waitingAreaTutors: (json['waitingAreaTutors'] as List<dynamic>?) 
            ?.cast<String>() 
            ?? const <String>[], 
        availableTutors: (json['availableTutors'] as List<dynamic>?) 
            ?.cast<String>() 
            ?? const <String>[], 
      );

  final String className;
  final String uid;
  final String career;
  final String? image;
  final String? type;
  final List<String> semester;
  final List<String> waitingAreaTutors;
  final List<String> availableTutors;
}
