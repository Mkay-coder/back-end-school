import 'package:backend_school/helpers/student_tab_controller.dart';
import 'package:backend_school/widgets/classes/attendance/student_attendance_widget.dart';
import 'package:backend_school/widgets/classes/results/student_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentScreen extends StatefulWidget {
  final String studentId;
  StudentScreen(this.studentId);

  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  String _studentName = '';
  String _imageUrl = '';
  String _studentId = '';
  String _studentClass = '';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('students/')
            .where('studentID', isEqualTo: widget.studentId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final studentDocs = snapshot.data.docs;
          final studentData = studentDocs[0].data()!;
          print(studentData['studentName']);
          _studentName = studentData['studentName'];
          _imageUrl = studentData['studentImage'];
          _studentId = studentData['studentID'];
          _studentClass = studentData['studentClass'];

          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text(_studentName),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        CircleAvatar(backgroundImage: NetworkImage(_imageUrl)),
                  )
                ],
                bottom: TabBar(tabs: [
                  Tab(
                    text: 'Profile',
                  ),
                  Tab(
                    text: 'Results',
                  ),
                  Tab(
                    text: 'Attendance',
                  ),
                ]),
              ),
              body: TabBarView(children: [
                Container(
                  child: Text('Profile'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: StudentResult(_studentId),
                    ),
                  ],
                ),
                Container(
                  child: ListView.builder(
                      itemCount: 14,
                      itemBuilder: (ctx, index) {
                        return StudentAttendanceWidget();
                        
                      }),
                ),
              ]),

              // SingleChildScrollView(
              //               child: Padding(
              //     padding: const EdgeInsets.all(10.0),
              //     child: Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.stretch,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
              //             child: Row(children: [
              //               CircleAvatar(
              //                 backgroundImage: NetworkImage(_imageUrl),
              //                 radius: 40,
              //               ),
              //               Padding(
              //                 padding: const EdgeInsets.symmetric(horizontal: 20),
              //                 child: Column(
              //                     mainAxisSize: MainAxisSize.min,
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Text(
              //                         _studentName,
              //                         style: const TextStyle(
              //                             fontSize: 16,
              //                             fontWeight: FontWeight.w500),
              //                       ),
              //                       Text(
              //                         _studentId.toUpperCase(),
              //                         style: const TextStyle(
              //                             fontSize: 14,
              //                             fontWeight: FontWeight.w500),
              //                       ),
              //                       Text(
              //                         _studentClass,
              //                         style: const TextStyle(
              //                             fontSize: 14,
              //                             fontWeight: FontWeight.w500),
              //                       ),
              //                     ]),
              //               )
              //             ]),
              //           ),
              //           StudentTabController(_studentClass, _studentId),
              //         ]),
              //   ),
              // ),
            ),
          );
        });
  }
}
