import 'package:backend_school/widgets/classes/add_student.dart';
import 'package:backend_school/widgets/classes/class_student_grid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassScreen extends StatefulWidget {
  @override
  _ClassScreenState createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  List<String> items = [
    'Class One',
    'Class Two',
    'Class Three',
    'Class Four',
    'Class Five'
  ];
  String dropdownValue = 'Class One';

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Section'),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddStudentScreen(dropdownValue);
                    });
                print('Add Student to class: ' + dropdownValue);
              },
              icon: const Icon(Icons.add_circle_outline_rounded, color: Colors.white))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Students class",
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
            ),
            const SizedBox(height: 15),
            Text(
              "This list will show the number of students in each class.",
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
                          ),
            ),
            const SizedBox(height: 5),
            DropdownButtonFormField<String>(
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  child: Text(value,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),),
                  value: value,
                );
              }).toList(),
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              // icon: const Icon(Icons.flutter_dash),
              isExpanded: true,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(width: 2, color: Colors.black54))),
            ),
            const SizedBox(height: 15),
            ClassStudentWidget(dropdownValue),
          ],
        ),
      ),
    );
  }
}
