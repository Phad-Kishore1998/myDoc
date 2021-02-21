import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_doc/Start.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'chatbotai.dart';
import 'form.dart';

class welcomePage extends StatefulWidget {
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    //Welcome NOTE
    HomePage2(),
    //Form
    HomeScreen2(),
    //AiChatBot
    HomePage(),
    //HomePage(),
    //ProfilePage(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 20.0,
            ),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.addchart,
              size: 20.0,
            ),
            title: new Text('Form'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 20.0,
            ),
            title: new Text('MyDoctor'),
          )
        ],
      ),
    );
  }
}
