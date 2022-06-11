import 'dart:ui';

import 'package:aircenter/ResponsiveWidget.dart';
import 'package:aircenter/sizing_information.dart';
import 'package:flutter/material.dart';

import 'myDailogBox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _menuItems = [
    "Status",
    "Snooze notifications",
    "",
    "Invitation",
    "Archived",
    "",
    "Settings",
    "Help & Feedback"
  ];
  List<IconData?> _menuIcons = [
    Icons.sentiment_satisfied_alt_outlined,
    Icons.notifications_off_outlined,
    Icons.notifications_off_outlined,
    Icons.drafts_outlined,
    Icons.move_to_inbox,
    Icons.notifications_off_outlined,
    Icons.settings_outlined,
    Icons.question_mark
  ];
  var _userPics = [
    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    "",
    "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
    "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
  ];
  var _userNames = ["John Andrison", "Mahesh", "Natasha", "Fernny", "Larry"];
  _showDailogBox(SizingInformation sizeInfo) {
    showDialog(
        context: context,
        barrierColor: Colors.black.withOpacity(0.6),
        builder: (BuildContext ctx) {
          return MyDailog(menuItems: _menuItems, menuIcons: _menuIcons);
        });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (context, sizingInfo) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 50,
                      width: sizingInfo.screenSize!.width,
                      // color: Colors.amber,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                              offset: Offset(0, 3),
                              color: Colors.grey.shade400)
                        ],
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.search, size: 28),
                          Text(
                            "Flash",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey.shade800),
                          ),
                          InkWell(
                            onTap: () => _showDailogBox(sizingInfo),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: SizedBox(
                        height: sizingInfo.screenSize!.height * 0.8,
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: ListTile(
                              title: Text(
                                _userNames[index],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              leading: _userPics[index] == ""
                                  ? CircleAvatar(
                                      radius: 32,
                                      backgroundColor: Colors.orange,
                                      child: Center(
                                        child: Text(
                                          _userNames[index][0],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: 32,
                                      backgroundImage:
                                          NetworkImage(_userPics[index]),
                                    ),
                            ),
                          ),
                        )),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
