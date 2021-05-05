import 'dart:ui';

import 'package:covidpk/drawer/adddrawer.dart';
import 'package:covidpk/plasmadonation.dart/blood_form.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

import 'auth_screen.dart';

class PlasmaUi extends StatefulWidget {
  static const String routeName = '/PlasmaUi';
  @override
  _PlasmaUiState createState() => _PlasmaUiState();
}

class _PlasmaUiState extends State<PlasmaUi> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  String task1;

  String task2;
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void launchMap(String address) async {
    String query = Uri.encodeComponent(address);
    String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    }
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterOpenWhatsapp.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textstyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Available Plasma',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.green),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (streamSnapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final documents = streamSnapshot.data.docs;
          return ListView(
            children: documents
                .map((e) => Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                                width: 100,
                                height: 100,
                                child: Text(
                                  '${e.data()['bloodgroup'].toString()}',
                                  style: textstyle,
                                ),
                              ),
                              SizedBox(width: 30),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      '${e.data()['name']}',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      'Gender : ${e.data()['gender']}',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        launchMap(e.data()['address']);
                                      },
                                      child: Text(
                                        'Address : ${e.data()['address']}',
                                        maxLines: 2,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '${e.data()['phoneNumber']}',
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                launch(
                                                    ('tel://${e.data()['phoneNumber']}'));
                                              },
                                              icon: Icon(Icons.call_sharp),
                                              color: Colors.green,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                launch(
                                                    ('sms:${e.data()['phoneNumber']}'));
                                              },
                                              icon: Icon(Icons.sms),
                                              color: Colors.green,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                String data =
                                                    '${e.data()['phoneNumber']}';
                                                print(data);

                                                FlutterOpenWhatsapp.sendSingleMessage(
                                                    "+92${e.data()['phoneNumber']}",
                                                    "Hi Sir, I am looking for plasma. You have posted in plasma donation app as a donour. Kindly Help me Thankyou Sir");
                                              },
                                              icon: Icon(Icons.call_sharp),
                                              color: Colors.green,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          if (FirebaseAuth.instance.currentUser != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BloodForm(),
              ),
            );
          }
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AuthScreen(),
            ),
          );
        },
      ),
    );
  }
}
