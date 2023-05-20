import 'package:contact_app/ContactView/phone.dart';
import 'package:contact_app/GroupView/group.dart';
import 'package:contact_app/RecentView/recen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List listItems = [
    const RecentView(),
    const ContactView(),
    const GroupView(),
  ];
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listItems[_currentIndex],
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 248, 245, 245),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              SalomonBottomBarItem(
                unselectedColor: const Color.fromARGB(255, 69, 68, 68),
                icon: const Icon(
                  Icons.watch_later,
                ),
                title: const Text('Recents'),
              ),
              SalomonBottomBarItem(
                unselectedColor: const Color.fromARGB(255, 69, 68, 68),
                icon: const Icon(Icons.phone),
                title: const Text('Contacts'),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.star),
                unselectedColor: const Color.fromARGB(255, 69, 68, 68),
                title: const Text('Groups'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
