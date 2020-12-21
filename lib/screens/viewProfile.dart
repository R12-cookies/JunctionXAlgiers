import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './widgets/bottomBarNav.dart';
import 'widgets/FirebaseMessageWrapper.dart';
import 'package:firebase_core/firebase_core.dart';

class ViewProfile extends StatefulWidget {
  final userId;

  @override
  State<StatefulWidget> createState() => _ViewProfile();

  ViewProfile({
    Key key,
    @required this.userId,
  }) : super(key: key);
}

class _ViewProfile extends State<ViewProfile> {
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);

  String imgUrl = "";
  String firstName = "";
  String lastName = "";
  String function = "";
  String aboutYou = "";
  String email = "";
  String favMovie = "";
  String teamName = "";
  String visitorNumber = "";
  bool isVisitorNumberChanged = false;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void getUser() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .snapshots()
        .listen((data) {
      visitorNumber = data["visitorNumber"];
      setState(() {
        imgUrl = data["imgUrl"];
        lastName = data["lastName"];
        firstName = data["firstName"];
        function = data["function"];
        aboutYou = data["aboutYou"];
        email = data["email"];
        favMovie = data["favMovie"];
        teamName = data["teamName"];
      });
    });
  }

  void updateVisitorNumber() async {
    await Future.delayed(Duration(milliseconds: 100));
    if (!isVisitorNumberChanged) {
      FirebaseFirestore.instance.collection('users').doc(widget.userId).update({
        'visitorNumber': "${int.parse(visitorNumber) + 1}",
      }).catchError((e) {
        print(e);
      });
      print("done");
      isVisitorNumberChanged = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    getUser();
    updateVisitorNumber();
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: Image.asset(
                  'assets/img/junctionx_algiers_white_oneline.png',
                  width: 200),
              backgroundColor: Color(0xFFFAA61C),
              iconTheme: IconThemeData(color: Colors.white),
            ),
            backgroundColor: _backgroundColor,
            body: FirebaseMessageWrapper(
              Align(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,left: 10,right: 10
                    ),
                    child: Container(
                      
                      decoration: new BoxDecoration(
                          color: Color(0xFF232323),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 7)
                          ]),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "$firstName $lastName",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 10),
                            child: CachedNetworkImage(
                              imageUrl: imgUrl,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // border: Border.all(width: 3, color: _accentColor),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  new CircularProgressIndicator(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Text(
                              "$function",
                              style: TextStyle(
                                color: _accentColor,
                                fontSize: 17,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5, left: 22, right: 22, bottom: 20),
                            child: Text(
                              "$aboutYou",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 22.0, right: 22.0, top: 25, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFFFAA61C),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 7)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Text(
                              "Email Address",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          width: email.length<70?150:favMovie.length.toDouble(),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 7)
                              ]),
                          child: Center(
                                                      child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Text(
                                "$email",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 40.0, right: 22.0, top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey,
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 7)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Text(
                              "Fav Movie",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 0,
                        ),
                        Container(
                          width: favMovie.length<70?150:favMovie.length.toDouble(),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[800],
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 7)
                              ]),
                          child: Center(
                                                      child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Text(
                                
                                "$favMovie",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.white),
                                    
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 80.0, right: 22.0, top: 15, bottom: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey[800],
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 7)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Text(
                              "Number of visitors",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFFFAA61C),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 7)
                              ]),
                          child: Center(
                                                      child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Text(
                                "$visitorNumber",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 100.0, right: 22.0, top: 15, bottom: 15),
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 7)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Text(
                              "Team",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: teamName.length<70?100:favMovie.length.toDouble(),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFFFAA61C),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 7)
                              ]),
                          child: Center(
                                                      child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Text(
                                "$teamName",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            bottomNavigationBar: BottomNavBar(
              currentTab: 3,
            ),
          );
        }
        if (snapshot.hasError) {
          return Text('smth');
        }

        return CircularProgressIndicator();
      },
    );
  }
}
