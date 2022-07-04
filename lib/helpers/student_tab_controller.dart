import 'package:backend_school/widgets/classes/student_profile.dart';
import 'package:backend_school/widgets/classes/results/student_result.dart';
import 'package:flutter/material.dart';

class StudentTabController extends StatefulWidget {
  final String studentClass;
  final String studentID;
  StudentTabController(this.studentClass, this.studentID);
  @override
  _StudentTabControllerState createState() => _StudentTabControllerState();
}

class _StudentTabControllerState extends State<StudentTabController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          child: TabBar(
            labelColor: Colors.black54,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            tabs: [
              Tab(
                text: "Profile",
              ),
              Tab(
                text: "Results",
              ),
              Tab(
                text: "Attendance",
              ),
            ],
          ),
        ),
        Container(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              StudentProfile(widget.studentClass),
              StudentResult(widget.studentID),
              StudentProfile(widget.studentClass),
            ]))
      ]),
    );
  }
}
