import 'package:backend_school/widgets/classes/results/student_result_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentResult extends StatefulWidget {
  final String studentID;
  StudentResult(this.studentID);
  @override
  _StudentResultState createState() => _StudentResultState();
}

class _StudentResultState extends State<StudentResult> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: FirebaseFirestore.instance
            .collection('results/')
            .where('studentID', isEqualTo: widget.studentID)
            .snapshots(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
           if (snapshot.data.docs.length == 0) {
            return Center(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const SizedBox(
                  height: 200,
                  child: Center(
                    child: Text('There are no results available'),
                  ),
                ),
              ),
              // Text("There are no results available"),
            );
          } else {
          final studentResults = snapshot.data?.docs;
          return ListView.builder(
            // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 1, mainAxisSpacing: 1, crossAxisSpacing: 1),
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (ctx, index) => StudentResultWidget(
              widget.studentID,
              studentResults[index]['mathematics'],
              studentResults[index]['english'],
              studentResults[index]['kiswahili'],
              studentResults[index]['science'],
              studentResults[index]['socialStudies'],
              studentResults[index]['total'],
              studentResults[index]['term'],
              studentResults[index]['year'],
            ),
          );
          }
        });
  }
}


