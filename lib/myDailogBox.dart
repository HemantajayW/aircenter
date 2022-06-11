import 'dart:ui';

import 'package:flutter/material.dart';

import 'ResponsiveWidget.dart';

class MyDailog extends StatelessWidget {
  const MyDailog({
    Key? key,
    required List<String> menuItems,
    required List<IconData?> menuIcons,
  })  : _menuItems = menuItems,
        _menuIcons = menuIcons,
        super(key: key);

  final List<String> _menuItems;
  final List<IconData?> _menuIcons;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (context, sizeInfo) => Center(
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
            // ignore: unnecessary_new
            child: new Container(
              width: sizeInfo.screenSize!.width * 0.85,
              height: sizeInfo.screenSize!.height * 0.65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.black.withOpacity(0.5)),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 15) -
                      EdgeInsets.only(bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black))),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage(
                                "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),
                          ),
                          title: Text(
                            "Lucy Andrison",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          subtitle: Text(
                            "lucyandrison782@gmail.com",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return (index + 1) % 3 == 0
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Divider(
                                      color: Colors.black,
                                    ),
                                  )
                                : ListTile(
                                    title: Text(
                                      _menuItems[index],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    leading: Icon(_menuIcons[index],
                                        size: 24,
                                        color: Colors.white.withOpacity(0.8)));
                          },
                          itemCount: 8,
                        ),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border:
                                Border(top: BorderSide(color: Colors.black))),
                        child: Center(
                          child: Text(
                            "Privacy Policy . Terms Of Service",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
