import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:soc_flutter_workshop/enterName.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('Something has gone wrong!');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'SOC Flutter Workshop',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            home: EnterName(),
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          title: 'IITG Scanner',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          home: Material(
            color: Colors.white,
          ),
        );
      },
    );
  }
}