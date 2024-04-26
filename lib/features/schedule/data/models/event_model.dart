class EventModel {
  EventModel({
    required this.eventName,
    required this.initialDate,
    required this.endDate,
    this.description,
    this.location,
    this.linkLocationOther = '',
    this.additionalNotes = '',
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        eventName: json['eventName'] ?? '',
        initialDate: json['initialDate']??'',
        endDate: json['endDate']??'',
        description: json['description'],
        location: json['location'] ?? '',
        linkLocationOther: json['linkLocationOther'] ?? '',
        additionalNotes: json['additionalNotes'],
      );

  final String eventName;
  final String? description;
  final String? initialDate;
  final String? endDate;
  final String? location;
  final String? linkLocationOther;
  final String? additionalNotes;
}
