import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class StudentAttendanceWidget extends StatefulWidget {
  @override
  _StudentAttendanceWidgetState createState() =>
      _StudentAttendanceWidgetState();
}

class _StudentAttendanceWidgetState extends State<StudentAttendanceWidget> {
  // DateTime date = DateTime.now();
  // DateTime weekDay = date.weekday;
  var values = {'S':true,'M':true,'T':true,'W':true,'T':true,'F':true,'S':true};
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(children: [
                    Text(
                      "Week One: ",
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ]),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (ctx, index) {
                        return Text(
                          'Hello There',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        );
                      }),
                ),
                
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('S',),
                        Text('Select'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('M',),
                        Text('Select'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('T',),
                        Text('Select'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('W',),
                        Text('Select'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('T',),
                        Text('Select'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('F',),
                        Text('Select'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('S',),
                        Text('Select'),
                      ],
                    ),
                  ],
                ))
              ]),
        ),
      ],
    );
  }
}
