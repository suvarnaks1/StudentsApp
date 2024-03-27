

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:techinzoapp/Loginpages/Authpage.dart';
import 'package:techinzoapp/Screens/HomePage.dart';
import 'firebase_options.dart';


import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);



    runApp( 
     MyApp(),
   
  );
}

class MyApp extends StatelessWidget {
  const MyApp();
  // : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      title: 'Flutter X Firebase',
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SplashScreen();
          } else {
            // return AuthScreen();
            return AuthPage();
          }
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late User? _user;
  @override
  void initState() {
    splashFuture();
    super.initState();
    _getUser();
    print('User Details = $_user');

    // Wait for 4 seconds before navigating to the home screen
  }

  Future<void> _getUser() async {
    User? user = FirebaseAuth.instance.currentUser;

    setState(() {
      _user = user;
    });
  }


  splashFuture() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FutureBuilder<String>(
          future: _greetingMessage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Text(
                snapshot.data!,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<String> _greetingMessage() async {
    // Determine the time of the day
    var now = DateTime.now();
    var formatter = DateFormat('H');
    var hour = int.parse(formatter.format(now));

    String greeting;

    if (hour >= 6 && hour < 12) {
      greeting = 'Good Morning!';
    } else if (hour >= 12 && hour < 18) {
      greeting = 'Good Afternoon!';
    } else {
      greeting = 'Good Night!';
    }

    // Simulate some asynchronous task, e.g., fetching data
    await Future.delayed(Duration(seconds: 2));

    return greeting;
  }
}
