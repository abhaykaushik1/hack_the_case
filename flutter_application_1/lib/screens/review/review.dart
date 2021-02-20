import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:covid_app/screens/datatbase/database.dart';

class Review extends StatefulWidget {
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  TextEditingController commentController = new TextEditingController();
  // Pass in Location from Maps
  String location = "";
  String comment = "";
  double rating1 = 0.0;
  double rating2 = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [],
        ),
        body: Column(children: [
          // Textbox for Comments
          Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                  controller: commentController,
                  decoration: InputDecoration(
                      hintText: 'Leave Your Review Here', labelText: 'Review'),
                  onSubmitted: (comment) {
                    setState(() {
                      comment = commentController.text;
                    });
                  })),
          // Stars for Service Ratings
          Container(
              child: SmoothStarRating(
                  allowHalfRating: true,
                  starCount: 5,
                  rating: rating1,
                  size: 40.0,
                  color: Colors.yellow,
                  borderColor: Colors.yellow,
                  onRated: (double value) {
                    setState(() {
                      rating1 = value;
                    });
                  },
                  fullRatedIconData: Icons.blur_off,
                  halfRatedIconData: Icons.blur_on,
                  spacing: 0.0)),
          // Stars for COVID safety
          Container(
              child: SmoothStarRating(
                  allowHalfRating: true,
                  starCount: 5,
                  size: 40.0,
                  rating: rating2,
                  color: Colors.green,
                  borderColor: Colors.green,
                  onRated: (double value) {
                    setState(() {
                      rating2 = value;
                    });
                  },
                  fullRatedIconData: Icons.blur_off,
                  halfRatedIconData: Icons.blur_on,
                  spacing: 0.0)),
          // Submit Button
          Container(
            child: ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  Database().updateData(comment, rating1, rating2);
                }),
          ),
        ]));
  }
}
