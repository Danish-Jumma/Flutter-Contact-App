// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const GroupView());
}

class GroupView extends StatefulWidget {
  const GroupView({super.key});

  @override
  State<GroupView> createState() => _FavoruiteViewState();
}

class _FavoruiteViewState extends State<GroupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              'Groups',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: 500,
            height: 320,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 15),
              children: [
                groupCard('16 members', Color.fromARGB(255, 172, 248, 205),
                    'Family', Color.fromARGB(255, 54, 130, 58)),
                groupCard('24 members', Color.fromARGB(175, 242, 120, 120),
                    'Friends', Color.fromARGB(255, 192, 67, 100)),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color.fromARGB(255, 191, 219, 241),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5, left: 8),
                        child: Icon(
                          Icons.add_circle,
                          color: Colors.blue,
                          size: 35,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20, left: 10),
                        child: Text(
                          'New group',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Favourites',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 10,
          ),
          listTile(
              'M',
              'MS Dhoni',
              'Office',
              Icon(
                Icons.favorite,
                color: Color.fromARGB(255, 209, 66, 55),
              )),
          listTile(
              'V',
              'Virat Kolhi',
              'Home',
              Icon(
                Icons.favorite,
                color: Color.fromARGB(255, 209, 66, 55),
              )),
          Row(
            children: const [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.add_circle,
                color: Colors.blue,
                size: 35,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'add favourite',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

groupCard(text, clr, [heading, txtClr]) {
  return Container(
    decoration: BoxDecoration(
        color: clr, borderRadius: BorderRadius.all(Radius.circular(20))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 100, bottom: 30),
          child: Icon(
            Icons.settings,
            color: txtClr,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$heading',
              style: TextStyle(
                  fontSize: 24, color: txtClr, fontWeight: FontWeight.bold),
            ),
            Text(
              '$text',
              style: TextStyle(
                fontSize: 16,
                color: txtClr,
              ),
            )
          ],
        ),
      ],
    ),
  );
}

listTile(leading, title, subtitle, icon) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Color.fromARGB(175, 242, 120, 120),
      child: Text(
        '$leading',
        style: TextStyle(
            color: Color.fromARGB(255, 209, 66, 55),
            fontWeight: FontWeight.bold),
      ),
    ),
    title: Text(
      '$title',
      style: TextStyle(fontWeight: FontWeight.w600),
    ),
    subtitle: Text('$subtitle'),
    trailing: icon,
  );
}
