import 'package:flutter/material.dart';
import './widgets/bottomBarNav.dart';
import 'widgets/FirebaseMessageWrapper.dart';

class EventSchedulePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EventSchedulePage();
}

class _EventSchedulePage extends State<EventSchedulePage> {
  final Color _backgroundColor = const Color(0xff1c1e21);
  final Color _accentColor = const Color(0xfff9a61b);
  final Color _textFieldBackgroundColor = const Color(0xff797979);
  final Color _textColor = const Color(0xfff9fcfe);
  final Color _eventBtnColor = const Color(0xff24262a);
  int daySelected = 1;

  Widget getDay(int i) {
    switch (i) {
      case 1:
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //         Image.asset(
                  //   "assets/img/JUNCTION_X_white.png",
                  //   width: 30,
                  // ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "16:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Hacking starts opening ceremony",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "18:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Meet your coaches",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "20:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Presentations of challenges",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "22:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Q&A with Choaib",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
          ],
        );
      case 2:
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "00:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "How to submit your draft",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "04:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Coaching session:",
                          style: TextStyle(color: _textColor),
                        ),
                        Text(
                          "How to well manage your time.",
                          style: TextStyle(color: _textColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "08:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Draft submission",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "09:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Good morning hackers with Rekaia",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "12:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Fun facts about Algeria with Hajar",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
             
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "15:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Mini games with the gang",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
             
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "16:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Meeting with solo hackers",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "17:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Interview with Dr. Beghdadi",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
           Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "18:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Interview with Dr. Noureddine",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "19:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "TALK with Dr. BOUIDJARA",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10,
                left: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "20:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "CELEC",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "21:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Coaching session:",
                          style: TextStyle(color: _textColor),
                        ),
                        Text(
                          "How to make an effective project",
                          style: TextStyle(color: _textColor),
                        ),
                        Text(
                          "presentation",
                          style: TextStyle(color: _textColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "22:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "TALK why hackathons? with choaib",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10,
                left: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "23:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Wolfy with the gang",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
            ), 
          ],
        );
      case 3:
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "00:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Concentration session",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "04:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Deadline approaching final tips samy",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 10,
                left: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "08:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Final submission",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 1,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "08:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Interviews with participants",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "12:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Winners announcement",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "13:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Closing ceremony",
                      style: TextStyle(color: _textColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
       Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "14:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Sharing your experience",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),      
          ],
        );
      default:
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "14:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Sharing your experience",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "12:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Opening ceremony",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "12:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Presentations of challenges",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "12:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Team building",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "12:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Hacking starts",
                      style: TextStyle(color: _textColor),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 7)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/img/JUNCTION_X_white.png",
                            width: 30,
                          ),
                          Text(
                            "12:00",
                            style: TextStyle(color: _textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Dinner",
                      style: TextStyle(color: _textColor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 7)]),
              height: 1,
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        currentTab: 0,
      ),
      appBar: AppBar(
        title: Image.asset('assets/img/junctionx_algiers_white_oneline.png',
            width: 200),
        backgroundColor: Color(0xFFFAA61C),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: _backgroundColor,
      body: FirebaseMessageWrapper(
        ListView(
          
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "EVENT SCHEDULE",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: _textColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        daySelected = 1;
                      });
                    },
                    textColor: _textColor,
                    color: daySelected == 1 ? _accentColor : _eventBtnColor,
                    child: Text("DAY1"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        daySelected = 2;
                      });
                    },
                    textColor: _textColor,
                    color: daySelected == 2 ? _accentColor : _eventBtnColor,
                    child: Text("DAY2"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        daySelected = 3;
                      });
                    },
                    textColor: _textColor,
                    color: daySelected == 3 ? _accentColor : _eventBtnColor,
                    child: Text("DAY3"),
                  )
                ],
              ),
            ),
            getDay(daySelected),
          ],
        ),
      ),
    );
  }
}
