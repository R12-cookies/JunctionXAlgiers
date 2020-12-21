import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junctionx_algiers/models/state.dart';
import 'package:junctionx_algiers/util/state_widget.dart';
import './widgets/bottomBarNav.dart';
import 'editProfile.dart';
import 'login.dart';
import 'widgets/FirebaseMessageWrapper.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);

  StateModel appState;
  bool _loadingVisible = false;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    if (!appState.isLoading &&
        (appState.firebaseUserAuth == null ||
            appState.user == null ||
            appState.settings == null)) {
      return loginPage();
    } else {
      if (appState.isLoading) {
        _loadingVisible = true;
      } else {
        _loadingVisible = false;
      }
    }
    final email = appState?.firebaseUserAuth?.email ?? '';
    final firstName = appState?.user?.firstName ?? '';
    final lastName = appState?.user?.lastName ?? '';
    final teamName = appState?.user?.teamName ?? '';
    final function = appState?.user?.function ?? '';
    final favMovie = appState?.user?.favMovie ?? '';
    final visitorNumber = appState?.user?.visitorNumber ?? '';
    final aboutYou = appState?.user?.aboutYou ?? '';
    final imgUrl = appState?.user?.imgUrl ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/img/junctionx_algiers_white_oneline.png',
            width: 200),
        backgroundColor: Color(0xFFFAA61C),
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit, size: 30, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfile()),
              );
              //StateWidget.of(context).logOutUser();
            },
          )
        ],
      ),
      backgroundColor: _backgroundColor,
      body: FirebaseMessageWrapper(
        Align(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                ),
                child: Container(
                  width: 200,
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
                          imageBuilder: (context, imageProvider) => Container(
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
                          style: TextStyle(fontSize: 14, color: Colors.white),
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
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: email.length<70?180:favMovie.length.toDouble(),
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
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
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
                          style: TextStyle(fontSize: 16, color: Colors.white),
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
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 22.0, right: 10.0, top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      width: 90,
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
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentTab: 3,
      ),
    );
  }
}
