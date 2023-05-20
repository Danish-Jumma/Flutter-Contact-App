import 'package:contact_app/ContactList/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(const RecentView());
}

class RecentView extends StatefulWidget {
  const RecentView({super.key});

  @override
  State<RecentView> createState() => _RecentViewState();
}

class _RecentViewState extends State<RecentView> {
  removeFunc(i) {
    setState(() {
      ContactList.contactList.removeAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 200,
        title: Container(
          margin: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              const Text(
                'All',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                'Missed',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5), fontSize: 17),
              ),
            ],
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              color: Color.fromARGB(255, 129, 127, 127),
              size: 25,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: ContactList.contactList.length,
        itemBuilder: (BuildContext context, index) {
          return Slidable(
            child: contactFunc(index),
            endActionPane: ActionPane(motion: const BehindMotion(), children: [
              SlidableAction(
                onPressed: (i) {
                  removeFunc(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('This contact has been deleted')),
                  );
                },
                label: 'Delete',
                foregroundColor: Colors.blue,
                backgroundColor: const Color.fromARGB(255, 202, 240, 230),
              ),
            ]),
          );
        },
      ),
      floatingActionButton: Container(
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color.fromARGB(255, 38, 217, 148),
          child: const Icon(
            Icons.dialpad_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}

contactFunc(index,
    {icon = Icons.call_received,
    clr = const Color.fromARGB(255, 73, 172, 76)}) {
  var firstString = ContactList.contactList[index]['name'].split('').first;
  return Padding(
    padding: const EdgeInsets.only(left: 23, top: 10),
    child: ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: firstString == '+'
                ? const Color.fromARGB(255, 191, 240, 228)
                : const Color.fromARGB(255, 219, 223, 223),
            borderRadius: BorderRadius.circular(75)),
        child: Center(
          child: Text(
            '$firstString',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              color: firstString == '+'
                  ? Colors.blue
                  : const Color.fromARGB(255, 75, 73, 73),
            ),
          ),
        ),
      ),
      title: Text(
        '${ContactList.contactList[index]['name']}',
        style: const TextStyle(fontSize: 18),
      ),
      trailing: Icon(
        icon,
        color: clr,
      ),
    ),
  );
}
