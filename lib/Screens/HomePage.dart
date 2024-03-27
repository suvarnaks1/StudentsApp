import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:techinzoapp/Screens/StudentDetails.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentDetails()));
            },
            child: Container(
              height: 70,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.black),
              child: Center(
                  child: Text(
                "STUDENT",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          SizedBox(height: 90,),
           GestureDetector(
            onTap: () {
              
            },
            child: Container(
              height: 70,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.black),
              child: Center(
                  child: Text(
                "TEACHER/FACULTY",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
           SizedBox(height: 90,),
           GestureDetector(
            onTap: () {
              
            },
            child: Container(
              height: 70,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.black),
              child: Center(
                  child: Text(
                "ORGANIZATION",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      )),
    );
  }
}
