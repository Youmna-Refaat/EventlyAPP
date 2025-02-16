import 'package:cloud_firestore/cloud_firestore.dart';

class EventDataModel {
  static const String collectionName = 'EventData';
  String eventID;
  String eventTitle;
  String eventDescription;
  String eventCategory;
  String eventImage;
  DateTime eventDate;
  bool isFavourite;
  double latitude;
  double longitude;
  String location;
  EventDataModel({
    this.eventID = "",
    required this.eventTitle,
    required this.eventDescription,
    required this.eventCategory,
    required this.eventImage,
    required this.eventDate,
    this.isFavourite = false,
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.location = "",
  });

  Map<String, dynamic> toFirestore() => {
        'eventID': eventID,
        'eventTitle': eventTitle,
        'eventDescription': eventDescription,
        'eventCategory': eventCategory,
        'eventImage': eventImage,
        'eventDate': Timestamp.fromDate(eventDate),
        'isFavourite': isFavourite,
        'latitude': latitude,
        'longitude': longitude,
        'location': location,
      };

  factory EventDataModel.fromFirestore(Map<String, dynamic> json) {
    var eventDate = json['eventDate'];
    DateTime eventDateTime;

    if (eventDate is Timestamp) {
      eventDateTime = eventDate.toDate();
    } else if (eventDate is int) {
      eventDateTime = DateTime.fromMillisecondsSinceEpoch(eventDate);
    } else {
      throw Exception("Invalid data format for eventDate");
    }

    return EventDataModel(
      eventID: json['eventID'],
      eventTitle: json['eventTitle'],
      eventDescription: json['eventDescription'],
      eventCategory: json['eventCategory'],
      eventImage: json['eventImage'],
      eventDate: eventDateTime,
      isFavourite: json['isFavourite'],
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
      location: json['location'] ?? "",
    );
  }
}
