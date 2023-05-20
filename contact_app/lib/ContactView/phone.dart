import 'package:contact_app/ContactList/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const ContactView());
}

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  addFunc(context) {
    setState(() {
      Navigator.pop(context);
      ContactList.contactList.add({
        'name': name.text,
        'phone': number.text,
      });
      name.clear();
      number.clear();
    });
  }

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
          title: const Text(
            'Contacts',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: ContactList.contactList.length,
            itemBuilder: ((BuildContext context, index) {
              return Slidable(
                  endActionPane: ActionPane(motion: BehindMotion(), children: [
                    SlidableAction(
                      onPressed: ((i) {
                        removeFunc(index);
                        print(
                            "Delete button is wotking very well bro yes bro what happened");
                        print(index);
                      }),
                      autoClose: false,
                      label: "Delete",
                      icon: Icons.delete,
                      backgroundColor: Colors.red,
                    ),
                    SlidableAction(
                      onPressed: ((i) {
                        launchUrlString(
                            "sms:${ContactList.contactList[index]["phone"]}");
                      }),
                      icon: Icons.message,
                      backgroundColor: Colors.green,
                      label: 'Message',
                    ),
                  ]),
                  child: listTile(index));
            })),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.green[400],
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Add Contact"),
                  content: Container(
                    height: 130,
                    child: Column(
                      children: [
                        TextField(
                          controller: name,
                          obscureText: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            labelText: 'Contact Name',
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: number,
                          obscureText: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            labelText: 'Contact Number (92+)',
                          ),
                        )
                      ],
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextButton(
                        child: const Text(
                          "OK",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          addFunc(context);
                        },
                      ),
                    )
                  ],
                );
              },
            );
          },
        ));
  }
}

listTile(int index) {
  return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(75)),
        child: const Icon(
          Icons.person,
          size: 32,
        ),
      ),
      title: Text("${ContactList.contactList[index]['name']}",
          style: const TextStyle(fontSize: 18)),
      trailing: GestureDetector(
        onTap: () {
          launchUrlString("tel:${ContactList.contactList[index]["phone"]}");
        },
        child: Icon(
          Icons.phone,
          color: Colors.green[300],
          size: 30,
        ),
      ));
}
