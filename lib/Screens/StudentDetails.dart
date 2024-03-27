import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StudentDetails extends StatefulWidget {
  const StudentDetails({Key? key}) : super(key: key);

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController coreSkillsController = TextEditingController();
  final TextEditingController hobbiesController = TextEditingController();
  final TextEditingController achievementsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: Center(
            child: Text(
          "Student Details",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 29),
        )),
      ),
      body: Center(
        child: Container(
          height: 700,
          width: 360,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors
                            .grey[200], // Background color for TextFormField
                      ),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border:
                              InputBorder.none, // No border for TextFormField
                          hintText: 'NAME',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 19, vertical: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors
                            .grey[200], // Background color for TextFormField
                      ),
                      child: TextFormField(
                        controller: collegeController,
                        decoration: InputDecoration(
                          border:
                              InputBorder.none, // No border for TextFormField
                          hintText: 'COLLEGE',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 19, vertical: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors
                            .grey[200], // Background color for TextFormField
                      ),
                      child: TextFormField(
                        controller: degreeController,
                        decoration: InputDecoration(
                          border:
                              InputBorder.none, // No border for TextFormField
                          hintText: 'DEGREE',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 19, vertical: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors
                            .grey[200], // Background color for TextFormField
                      ),
                      child: TextFormField(
                        controller: coreSkillsController,
                        decoration: InputDecoration(
                          border:
                              InputBorder.none, // No border for TextFormField
                          hintText: 'CORE SKILLS',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 19, vertical: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors
                            .grey[200], // Background color for TextFormField
                      ),
                      child: TextFormField(
                        controller: hobbiesController,
                        decoration: InputDecoration(
                          border:
                              InputBorder.none, // No border for TextFormField
                          hintText: 'HOBBIES',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 19, vertical: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors
                            .grey[200], // Background color for TextFormField
                      ),
                      child: TextFormField(
                        controller: achievementsController,
                        decoration: InputDecoration(
                          border:
                              InputBorder.none, // No border for TextFormField
                          hintText: 'ACHIVEMENTS',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 19, vertical: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    GestureDetector(
                      onTap: () {
                        _saveData('name', nameController.text);
                        _saveData('college', collegeController.text);
                        _saveData('degree', degreeController.text);
                        _saveData('coreSkills', coreSkillsController.text);
                        _saveData('hobbies', hobbiesController.text);
                        _saveData('achievements', achievementsController.text);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => DummyUserList()));
                      },
                      child: Container(
                        height: 70,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black),
                        child: Center(
                            child: Text(
                          "SUBMIT",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}
