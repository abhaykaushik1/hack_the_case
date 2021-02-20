import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final CollectionReference reviews =
      FirebaseFirestore.instance.collection('reviews');

  // get location whenever a review is submitted
  // for any location on google maps
  final String location;
  Database({this.location});

  Future updateData(
      String comment, double servicestar, double covidstar) async {
    // Here, let the database connect the info to a location
    return await reviews.add({
      'comment': comment,
      'servicestar': servicestar,
      'covidstar': covidstar
    });
  }
}
