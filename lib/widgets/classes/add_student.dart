import 'package:backend_school/widgets/classes/student_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';

class AddStudentScreen extends StatefulWidget {
  final String studentClass;
  AddStudentScreen(this.studentClass);
  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  List<String> items = [
    'Class One',
    'Class Two',
    'Class Three',
    'Class Four',
    'Class Five'
  ];
  String dropdownValue = 'Class One';

  final _formKey = GlobalKey<FormState>();
  var _studentRegNo = '';
  var _studentName = '';
  var _studentDorm = '';
  var _studentClass = '';
  File? _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      //adding new student to firebase
      _addStudent(_studentRegNo.trim(), _studentName.trim(),
          _studentDorm.trim(), dropdownValue.trim(), context, _userImageFile!);
      Navigator.pop(context);
    } else {
      Fluttertoast.showToast(
        msg: "Error adding student",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 5,
      );
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: const Text("An error has occurred"),
      //   backgroundColor: Theme.of(context).errorColor,
      // ));
    }
  }

  //adding new student to firebase
  void _addStudent(
    String studentRegNo,
    String studentName,
    String studentDorm,
    String studentClass,
    BuildContext ctx,
    File image,
  ) async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('studentImage')
        .child(studentRegNo + '.jpg');
    await ref.putFile(image);
    final url = await ref.getDownloadURL();
    FirebaseFirestore.instance.collection('students').add(
      {
        'studentID': studentRegNo,
        'studentDorm': studentDorm,
        'studentClass': studentClass,
        'studentName': studentName,
        'studentImage': url,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text("Add Student"),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              key: const ValueKey('regNo'),
              decoration: const InputDecoration(
                  labelText: 'Student Reg No.',
                  icon: Icon(Icons.key_off_outlined)),
              validator: (value) {
                if (value!.isEmpty || value.length < 3) {
                  return 'Enter a valid registration number';
                }
                return null;
              },
              onSaved: (value) {
                _studentRegNo = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Student Name',
                icon: Icon(Icons.account_box),
              ),
              validator: (value) {
                if (value!.isEmpty || value.length < 3) {
                  return 'Enter a valid student name';
                }
                return null;
              },
              onSaved: (value) {
                _studentName = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Student Dorm',
                icon: Icon(Icons.bed_outlined),
              ),
              validator: (value) {
                if (value!.isEmpty || value.length < 3) {
                  return 'Enter a valid dorm';
                }
                return null;
              },
              onSaved: (value) {
                _studentDorm = value!;
              },
            ),
            DropdownButtonFormField<String>(
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              value: widget.studentClass,
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
                  borderSide: const BorderSide(width: 2, color: Colors.black54),
                ),
              ),
              onSaved: (value) {
                dropdownValue = value!;
              },
            ),
            const SizedBox(height: 10),

            UserImagePicker(_pickedImage),

            // TextFormField(
            //   initialValue: widget.studentClass,
            //   decoration: const InputDecoration(
            //     labelText: 'Class',
            //     icon: Icon(Icons.class_outlined),
            //   ),
            //   validator: (value) {
            //     if (value!.isEmpty || value.length < 3) {
            //       return 'Enter a valid class';
            //     }
            //     return null;
            //   },
            //   onSaved: (value) {
            //     _studentClass = value!;
            //   },
            // ),
          ]),
        ),
      ),
      actions: [
        ElevatedButton(child: const Text("Add Student"), onPressed: _trySubmit)
      ],
    );
  }
}
