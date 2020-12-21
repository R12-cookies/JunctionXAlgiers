import 'dart:async';
//import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';
import '../models/settings.dart' ;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum authProblems { UserNotFound, PasswordNotValid, NetworkError, UnknownError }

class Auth {
  static Future<String> signUp(String email, String password) async {
    auth.UserCredential user = await auth.FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return user.user.uid;
  }

  static void addUserSettingsDB(AppUser user) async {
    checkUserExist(user.userId).then((value) {
      if (!value) {
        //print("user ${user.firstName} ${user.email} added");
        FirebaseFirestore.instance
            .doc("users/${user.userId}")
            .set(user.toJson());
        _addSettings(new Set(
          settingsId: user.userId,
        ));
      } else {
        //print("user ${user.firstName} ${user.email} exists");
      }
    });
  }

  static Future<bool> checkUserExist(String userId) async {
    bool exists = false;
    try {
      await FirebaseFirestore.instance.doc("users/$userId").get().then((doc) {
        if (doc.exists)
          exists = true;
        else
          exists = false;
      });
      return exists;
    } catch (e) {
      return false;
    }
  }

  static void _addSettings(Set settings) async {
    FirebaseFirestore.instance
        .doc("settings/${settings.settingsId}")
        .set(settings.toJson());
  }

  static Future<String> signIn(String email, String password) async {
    //print(email);
    //print(password);
    auth.UserCredential user = await auth.FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return user.user.uid;
  }

  static Future<AppUser> getUserFirestore(String userId) async {
    if (userId != null) {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get()
          .then((documentSnapshot) => AppUser.fromDocument(documentSnapshot));
    } else {
      print('firestore userId can not be null');
      return null;
    }
  }

  static Future<Set> getSettingsFirestore(String settingsId) async {
    if (settingsId != null) {
      return FirebaseFirestore.instance
          .collection('settings')
          .doc(settingsId)
          .get()
          .then((documentSnapshot) => Set.fromDocument(documentSnapshot));
    } else {
      print('no firestore settings available');
      return null;
    }
  }

  static Future<String> storeUserLocal(AppUser user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storeUser = userToJson(user);
    await prefs.setString('user', storeUser);
    return user.userId;
  }

  static Future<String> storeSettingsLocal(Set settings) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storeSettings = settingsToJson(settings);
    await prefs.setString('settings', storeSettings);
    return settings.settingsId;
  }

  static Future<auth.User> getCurrentFirebaseUser() async {
    auth.User currentUser =  auth.FirebaseAuth.instance.currentUser;
    return currentUser;
  }

  static Future<AppUser> getUserLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user') != null) {
      AppUser user = userFromJson(prefs.getString('user'));
      //print('USER: $user');
      return user;
    } else {
      return null;
    }
  }

  static Future<Set> getSettingsLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('settings') != null) {
      Set settings = settingsFromJson(prefs.getString('settings'));
      //print('SETTINGS: $settings');
      return settings;
    } else {
      return null;
    }
  }

  static Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    auth.FirebaseAuth.instance.signOut();
  }

  static Future<void> forgotPasswordEmail(String email) async {
    await auth.FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  static String getExceptionText(Exception e) {
    if (e is PlatformException) {
      switch (e.message) {
        case 'There is no user record corresponding to this identifier. The user may have been deleted.':
          return 'User with this email address not found.';
          break;
        case 'The password is invalid or the user does not have a password.':
          return 'Invalid password.';
          break;
        case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
          return 'No internet connection.';
          break;
        case 'The email address is already in use by another account.':
          return 'This email address already has an account.';
          break;
        default:
          return 'Unknown error occured.';
      }
    } else {
      return 'Unknown error occured.';
    }
  }

  /*static Stream<User> getUserFirestore(String userId) {
    print("...getUserFirestore...");
    if (userId != null) {
      //try firestore
      return Firestore.instance
          .collection("users")
          .where("userId", isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot snapshot) {
        return snapshot.documents.map((doc) {
          return User.fromDocument(doc);
        }).first;
      });
    } else {
      print('firestore user not found');
      return null;
    }
  }*/

  /*static Stream<Settings> getSettingsFirestore(String settingsId) {
    print("...getSettingsFirestore...");
    if (settingsId != null) {
      //try firestore
      return Firestore.instance
          .collection("settings")
          .where("settingsId", isEqualTo: settingsId)
          .snapshots()
          .map((QuerySnapshot snapshot) {
        return snapshot.documents.map((doc) {
          return Settings.fromDocument(doc);
        }).first;
      });
    } else {
      print('no firestore settings available');
      return null;
    }
  }*/
}
