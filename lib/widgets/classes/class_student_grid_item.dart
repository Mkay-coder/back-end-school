import 'package:backend_school/screens/student_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassStudentGridItem extends StatelessWidget {
  final String studentId;
  final String studentName;
  final String studentDorm;
  final String imageUrl;
  ClassStudentGridItem(
      this.studentId, this.studentName, this.studentDorm, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 2,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 35,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  studentName,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  "Reg. No: " + studentId,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Dorm: " + studentDorm,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                ),
              ],
            ),
          ),
        ]),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> StudentScreen(studentId)));
        
      },
    );
  }
}
