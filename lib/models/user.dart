import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

AppUser userFromJson(String str) {
  final jsonData = json.decode(str);
  return AppUser.fromJson(jsonData);
}

String userToJson(AppUser data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class AppUser {
  String userId;
  String firstName;
  String lastName;
  String email;
  String teamName;
  String function;
  String favMovie;
  String aboutYou;
  String imgUrl;
  String visitorNumber;

  AppUser({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.teamName,
    this.function,
    this.favMovie,
    this.aboutYou,
    this.imgUrl,
    this.visitorNumber,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) => new AppUser(
        userId: json["userId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        teamName:json["Team"],
        function:json["function"],
        favMovie:json["favMovie"],
        aboutYou:json["aboutYou"],
        imgUrl:json["imgUrl"],
        visitorNumber:json["visitorNumber"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "Team":teamName,
        "function":function,
         "favMovie":favMovie,
         "aboutYou":aboutYou,
         "imgUrl":imgUrl,
          "visitorNumber":visitorNumber,
      };

  factory AppUser.fromDocument(DocumentSnapshot doc) {
    return AppUser.fromJson(doc.data());
  }
}
