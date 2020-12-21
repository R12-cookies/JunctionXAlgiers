import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
// To parse this JSON data, do
//
//     final settings = settingsFromJson(jsonString);

Set settingsFromJson(String str) {
  final jsonData = json.decode(str);
  return Set.fromJson(jsonData);
}

String settingsToJson(Set data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Set {
  String settingsId;

  Set({
    this.settingsId,
  });

  factory Set.fromJson(Map<String, dynamic> json) => new Set(
        settingsId: json["settingsId"],
      );

  Map<String, dynamic> toJson() => {
        "settingsId": settingsId,
      };

  factory Set.fromDocument(DocumentSnapshot doc) {
    return Set.fromJson(doc.data());
  }
}
