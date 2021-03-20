import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnterName extends StatefulWidget {
  static String id = 'enter-name';

  @override
  _EnterNameState createState() => _EnterNameState();
}

class _EnterNameState extends State<EnterName> {
  TextEditingController nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Name',
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter your name',
                style: TextStyle(fontSize: 20),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Container(
                width: 250,
                child: CupertinoTextField(
                  padding: EdgeInsets.all(15),
                  placeholder: 'Your Name',
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () {
                  FirebaseFirestore firestoreInstance =
                      FirebaseFirestore.instance;
                  firestoreInstance
                      .collection('Names')
                      .doc(DateTime.now().toString())
                      .set({
                    'name': nameController.text,
                  });
                },
                child: Text('Upload Name'),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
