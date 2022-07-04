import 'package:backend_school/widgets/classes/class_student_grid_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClassStudentWidget extends StatefulWidget {
  final String classId;
  ClassStudentWidget(this.classId);

  @override
  _ClassStudentWidgetState createState() => _ClassStudentWidgetState();
}

class _ClassStudentWidgetState extends State<ClassStudentWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('students/')
            .where('studentClass', isEqualTo: widget.classId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data.docs.length == 0) {
            return const Center(
              child: Text("The class is not available"),
            );
          } else {
            final studentDocs = snapshot.data?.docs;

            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (ctx, index) => ClassStudentGridItem(
                studentDocs[index]['studentID'],
                studentDocs[index]['studentName'],
                studentDocs[index]['studentDorm'],
                studentDocs[index]['studentImage'],
              ),
            );
          }
        },
      ),
    );
  }
}
