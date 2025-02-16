import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';
import '../models/event_model.dart';
import '../models/user_info_model.dart';

class FirebaseFirestoreServices {
  static CollectionReference<EventDataModel> getUserEventsCollectionReference(
      String userId) {
    FirebaseFirestore collectionRef = FirebaseFirestore.instance;
    return collectionRef
        .collection('users')
        .doc(userId)
        .collection('events')
        .withConverter<EventDataModel>(
          fromFirestore: (snapshot, _) =>
              EventDataModel.fromFirestore(snapshot.data()!),
          toFirestore: (eventDataModel, _) => eventDataModel.toFirestore(),
        );
  }

  static CollectionReference<UserInformationModel>
      getUserInformationCollectionReference(String userId) {
    FirebaseFirestore collectionRef = FirebaseFirestore.instance;
    return collectionRef
        .collection('users')
        .doc(userId)
        .collection('userinformation')
        .withConverter<UserInformationModel>(
          fromFirestore: (snapshot, _) =>
              UserInformationModel.fromFirestore(snapshot.data()!),
          toFirestore: (userInformationModel, _) =>
              userInformationModel.toFirestore(),
        );
  }

  static Future<bool> createNewEvent(
      String userId, EventDataModel eventData) async {
    try {
      final collectionRef = getUserEventsCollectionReference(userId);
      var docRef = collectionRef.doc();
      eventData.eventID = docRef.id;

      await docRef.set(eventData);
      return Future.value(true);
    } catch (error) {
      log("Error creating event: $error");
      return Future.value(false);
    }
  }

  static Future<List<EventDataModel>> getUserEvents(String userId) async {
    var collectionRef = getUserEventsCollectionReference(userId);
    QuerySnapshot<EventDataModel> data =
        await collectionRef.orderBy('eventDate').get();

    List<EventDataModel> eventDataList = data.docs.map((element) {
      log(element.data().toFirestore().toString());
      return element.data();
    }).toList();

    return eventDataList;
  }

  static Stream<QuerySnapshot<EventDataModel>> getStreamFavoriteData(
      String userId) {
    var collectionRef = getUserEventsCollectionReference(userId).where(
      "isFavourite",
      isEqualTo: true,
    );

    return collectionRef.snapshots();
  }

  static Stream<QuerySnapshot<EventDataModel>> getStreamData(
      String userId, String categoryName) {
    var collectionRef = getUserEventsCollectionReference(userId).where(
      "eventCategory",
      isEqualTo: categoryName,
    );

    return collectionRef.snapshots();
  }

  static Future<bool> deleteEvent(String userId, EventDataModel data) async {
    try {
      var collectionRef = getUserEventsCollectionReference(userId);
      var docRef = collectionRef.doc(data.eventID);

      await docRef.delete();

      return Future.value(true);
    } catch (error) {
      log("Error deleting event: $error");
      return Future.value(false);
    }
  }

  static Future<bool> updateEvent(String userId, EventDataModel data) async {
    try {
      var collectionRef = getUserEventsCollectionReference(userId);
      var docRef = collectionRef.doc(data.eventID);

      await docRef.update({
        'eventTitle': data.eventTitle,
        'eventDescription': data.eventDescription,
        'eventDate': data.eventDate,
        'eventCategory': data.eventCategory,
        'eventImage': data.eventImage,
        'latitude': data.latitude,
        'longitude': data.longitude,
        'location': data.location,
      });

      return true;
    } catch (error) {
      log("Error updating event: $error");
      return false;
    }
  }

  static Future<void> updateFavouriteEvent(
      String userId, String documentId, bool isFavourite) async {
    try {
      var collectionRef = getUserEventsCollectionReference(userId);

      await collectionRef.doc(documentId).update({
        'isFavourite': isFavourite,
      });
    } catch (e) {
      print("Error updating event: $e");
    }
  }

  static Future<bool> createUserInformation(
      String userId, UserInformationModel userInfo) async {
    try {
      final collectionRef = getUserInformationCollectionReference(userId);
      var docRef = collectionRef.doc();
      await docRef.set(userInfo);
      return true;
    } catch (error) {
      log("Error creating user information: $error");
      return false;
    }
  }

  static Future<UserInformationModel?> getUserData(String userId) async {
    try {
      final collectionRef = getUserInformationCollectionReference(userId);
      QuerySnapshot<UserInformationModel> querySnapshot =
          await collectionRef.get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.data();
      } else {
        return null;
      }
    } catch (error) {
      log("Error fetching user information: $error");
      return null;
    }
  }
}
