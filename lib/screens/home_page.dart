import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/bottomBarNav.dart';
import 'package:flutter/services.dart';

import 'package:junctionx_algiers/util/validator.dart';
import 'package:junctionx_algiers/screens/notification.dart';
import 'event_schedule.dart';

class homePage extends StatefulWidget {
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _textColor = const Color(0xfff9fcfe);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);
  final Color _cardColor = const Color(0xff1cf200);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final Color _accentColor = const Color(0xfff9a61b);
  static const duration = const Duration(seconds: 1);
  int secondsPassed = 0;
  bool isActive = true;
  Timer timer;
  int currentTab = 0; // to
  int hours = 0, minutes = 0, second = 0;

  bool _loadingVisible = false;
  Timer _timer;
  int seconds;
  final databaseReference = FirebaseFirestore.instance;
  ScrollController _controller = ScrollController();

  @override
  void initState() {
// Get the current time
    var twoHours;
    var now = DateTime.now();
    var eventTime = DateTime.parse("2020-12-24 16:00:00+01");
    // Get a 2-minute interval
    if (eventTime.isBefore(now))
      twoHours = eventTime.add(Duration(hours: 40)).difference(now);
    else
      twoHours = now.add(Duration(seconds: 1)).difference(now);
    print(twoHours);
    // Get the total number of seconds, 2 minutes for 120 seconds
    seconds = twoHours.inSeconds;
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (mounted) {
        timer.cancel();
      } else {
        timer.cancel();
      }
    });
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    cancelTimer();
  }

  void startTimer() {
    // Set 1 second callback
    const period = const Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      // Update interface
      setState(() {
        // minus one second because it calls back once a second
        seconds--;
      });
      if (seconds == 0) {
        // Countdown seconds 0, cancel timer
        cancelTimer();
      }
    });
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  Widget createCard(String notificationMsg, Timestamp notificationTime) {
    return Row(
      children: <Widget>[
        SizedBox(width: 13),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => NotificationPage()));
          },
          child: Container(
            width: 220,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Color(0xFF232323),
              child: Padding(
                padding: const EdgeInsets.all(17.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image.asset(
                          "assets/img/junction.png",
                          width: 40,
                        ),
                        Text(
                          "JunctionX",
                          style: TextStyle(
                              color: widget._textFieldBackgroundColor,
                              fontSize: 10),
                        ),
                        Spacer(),
                        notificationTime != null
                            ? Text(
                                Validator.readTimestamp(
                                    notificationTime.seconds),
                                style: TextStyle(
                                    color: widget._textFieldBackgroundColor,
                                    fontSize: 10),
                              )
                            : Container(),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: notificationMsg != "" && notificationMsg != null
                            ? Text(
                                "$notificationMsg",
                                style: TextStyle(
                                  color: widget._textColor,
                                  fontSize: 14,
                                ),
                              )
                            : Container(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    int hours = seconds ~/ 3600;
    int minutes = seconds % 3600 ~/ 60;
    int second = seconds % 60;
    int day;
    if ((hours <= 40) & (hours > 32)) {
      day = 1;
    } else {
      if ((hours <= 32) & (hours > 8)) {
        day = 2;
      } else {
        if (hours == 0) {
          day = 1;
        } else {
          day = 3;
        }
      }
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Center(
            child: Image.asset('assets/img/junctionx_algiers_white_oneline.png',
                width: 200),
          ),
          backgroundColor: Color(0xFFFAA61C),
          automaticallyImplyLeading: false,

          //iconTheme: IconThemeData(color: widgetot._accentColor),
        ),
        backgroundColor: widget._backgroundColor,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 13.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "TIME LEFT FOR SUBMISSION",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: widget._accentColor),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 22, right: 22),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          LabelText(
                            label: 'HRS',
                            value: "$hours",
                          ),
                          Text(
                            ":",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          ),
                          LabelText(label: 'MIN', value: "$minutes"),
                          Text(
                            ":",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          ),
                          LabelText(label: 'SEC', value: "$second"),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "NOTIFICATIONS",
                    style: TextStyle(
                        color: widget._textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 13,
                  ),
                  child: Container(
                    height: 130,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('notification')
                                .orderBy('time', descending: true)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data.docs.length,
                                    itemBuilder: (context, i) {
                                      return createCard(
                                          snapshot.data.docs[i]
                                              .data()['message'],
                                          snapshot.data.docs[i].data()['time']);
                                    });
                              } else {
                                return new Center(
                                  child: snapshot.error != null
                                      ? Text(
                                          snapshot.error,
                                          style: TextStyle(
                                              color: widget._textColor),
                                        )
                                      : Container(),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "SCHEDULE",
                    style: TextStyle(
                        color: widget._textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => EventSchedulePage()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Color(0xFF232323),
                      child: Container(
                          height: 250,
                          //color: Colors.grey[850],
                          child: ListView(
                            children: [getDay(day)],
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(currentTab: 4),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit the App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => SystemNavigator.pop(),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
}

class LabelText extends StatelessWidget {
  LabelText({this.label, this.value});

  final String label;
  final String value;
  final Color _accentColor = const Color(0xfff9a61b);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 5),
      //padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: _accentColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Text('$label',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String title,
      tableId,
      userId,
      firstName,
      lastName,
      buttonText,
      imgProfil;
  final IconData icon;
  final databaseReference = Firestore.instance;

  Future<void> onSendMessage(String content, int type, String groupChatId,
      String firstName, String lastName, String imgPro) async {
    // type: 0 = text, 1 = image, 2 = sticker
    if (content.trim() != '') {
      DocumentReference ref =
          await databaseReference.collection("messages").add({
        'id_user': groupChatId,
        'msg': content,
        'datetime': DateTime.now(),
        'nom': firstName + ' ' + lastName,
        'imgProfil': imgPro,
        'help': 1
      });
      //   listScrollController.animateTo(0.0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      // Fluttertoast.showToast(msg: 'Nothing to send');
    }
  }

  CustomDialog({
    @required this.title,
    @required this.tableId,
    @required this.userId,
    @required this.firstName,
    @required this.lastName,
    @required this.buttonText,
    @required this.imgProfil,
    this.icon,
  });

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.0)),
                        ),
                        color: Colors.grey,
                        onPressed: () {
                          Navigator.of(context).pop(); // To close the dialog
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(16.0)),
                        ),
                        color: Color(0xfff9a61b),
                        onPressed: () {
                          Navigator.of(context).pop(); // To close the dialog
                          onSendMessage("Table $tableId need help", 0, userId,
                              firstName, lastName, imgProfil);
                        },
                        child: Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: CircleAvatar(
            radius: Consts.avatarRadius,
            backgroundColor: Color(0xfff9a61b),
            child: Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 30.0;
}
