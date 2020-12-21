import 'package:flutter/material.dart';
import 'package:junctionx_algiers/screens/chatScreen.dart';
import 'package:junctionx_algiers/screens/event_schedule.dart';
import 'package:junctionx_algiers/screens/notification.dart';
import 'package:junctionx_algiers/screens/profile.dart';
import 'package:junctionx_algiers/screens/home_page.dart';

class BottomNavBar extends StatefulWidget {
  final currentTab;

  BottomNavBar({Key key, @required this.currentTab}) : super(key: key);
  @override
  _BottomNavBarState createState() => _BottomNavBarState(currentTab);
}

class _BottomNavBarState extends State<BottomNavBar> {
  final currentTab;
  _BottomNavBarState(this.currentTab);
  final Color _accentColor = const Color(0xfff9a61b);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomAppBar(
            color:  Color(0xFF232323),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 63,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: currentTab == 0 ? 4 : 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => EventSchedulePage()));
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color:
                                      currentTab == 0 ? Colors.white38 : null,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                Icons.calendar_today,
                                color: currentTab == 0
                                    ? _accentColor
                                    : Colors.grey,
                                size: currentTab == 0 ? 25 : 35,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Schedule',
                            style: TextStyle(
                              fontSize: currentTab == 0 ? 12 : 0,
                              color:
                                  currentTab == 0 ? _accentColor : Colors.grey,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: currentTab == 1 ? 4 : 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ChatScreen()));
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color:
                                      currentTab == 1 ? Colors.white38 : null,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                Icons.chat,
                                color: currentTab == 1
                                    ? _accentColor
                                    : Colors.grey,
                                size: currentTab == 1 ? 25 : 35,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            currentTab == 1 ? 'Hub' : '',
                            style: TextStyle(
                              fontSize: currentTab == 1 ? 12 : 0,
                              color:
                                  currentTab == 1 ? _accentColor : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

                  // Right Tab bar icons

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: currentTab == 2 ? 4 : 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => NotificationPage()));
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color:
                                      currentTab == 2 ? Colors.white38 : null,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                Icons.notifications,
                                color: currentTab == 2
                                    ? _accentColor
                                    : Colors.grey,
                                size: currentTab == 2 ? 22 : 35,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Notifications',
                            style: TextStyle(
                              fontSize: currentTab == 2 ? 12 : 0,
                              color:
                                  currentTab == 2 ? _accentColor : Colors.grey,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: currentTab == 3 ? 4 : 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage()));
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color:
                                      currentTab == 3 ? Colors.white38 : null,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                Icons.person,
                                color: currentTab == 3
                                    ? _accentColor
                                    : Colors.grey,
                                size: currentTab == 3 ? 25 : 35,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            currentTab == 3 ? 'Profile' : '',
                            style: TextStyle(
                              fontSize: currentTab == 3 ? 12 : 0,
                              color:
                                  currentTab == 3 ? _accentColor : Colors.grey,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20.0,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: Column(
              children: [
                FloatingActionButton(
                  elevation: 5,
                  hoverElevation: 5,
                  backgroundColor: currentTab == 4 ? Color(0xFFFAA61C) : Colors.grey,
                  child: Icon(
                    Icons.home,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => homePage()));
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  currentTab == 4 ? 'Home' : '',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: currentTab == 4 ? 14 : 0,
                    color: currentTab == 4 ? _accentColor : Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
