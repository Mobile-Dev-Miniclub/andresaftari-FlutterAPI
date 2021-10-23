import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:latian_api/model/models.dart';

part 'add/add_page.dart';

part 'home/home_page.dart';

part 'profile/profile_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  static const List<Widget> _pageList = [
    HomePage(),
    AddPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  String _currentTitle(int index) {
    if (index == 0) {
      return "Home";
    } else if (index == 1) {
      return 'Add User';
    } else {
      return 'Profile';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentTitle(_currentIndex),
          style: TextStyle(color: Colors.blueAccent),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _pageList.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            label: 'Add User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _currentIndex,
      ),
    );
  }
}
