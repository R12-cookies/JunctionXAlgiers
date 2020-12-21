import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';
import '../models/settings.dart';

class StateModel {
  bool isLoading;
  User firebaseUserAuth;
  AppUser user;
  Set settings;

  StateModel({
    this.isLoading = false,
    this.firebaseUserAuth,
    this.user,
    this.settings,
  });
}
