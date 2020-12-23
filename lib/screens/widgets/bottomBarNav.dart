import 'package:flutter/material.dart';

import 'package:junctionx_algiers/screens/event_schedule.dart';
import 'package:junctionx_algiers/screens/notification.dart';
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
            color: Color(0xFF232323),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 63,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
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
                              color: currentTab == 0 ? Colors.white38 : null,
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.calendar_today,
                            color: currentTab == 0 ? _accentColor : Colors.grey,
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
                          color: currentTab == 0 ? _accentColor : Colors.grey,
                        ),
                      )
                    ],
                  ),

                  // Right Tab bar icons
                  Column(
                    children: [
                      SizedBox(
                        height: currentTab == 4 ? 4 : 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homePage()));
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: currentTab == 4 ? Colors.white38 : null,
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.home,
                            color: currentTab == 4 ? _accentColor : Colors.grey,
                            size: currentTab == 4 ? 25 : 35,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        currentTab == 4 ? 'Home' : '',
                        style: TextStyle(
                          fontSize: currentTab == 4 ? 12 : 0,
                          color: currentTab == 4 ? _accentColor : Colors.grey,
                        ),
                      )
                    ],
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
                              color: currentTab == 2 ? Colors.white38 : null,
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.notifications,
                            color: currentTab == 2 ? _accentColor : Colors.grey,
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
                          color: currentTab == 2 ? _accentColor : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
