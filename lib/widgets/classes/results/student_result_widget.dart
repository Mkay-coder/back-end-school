import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentResultWidget extends StatelessWidget {
  final String studentID;
  final String mathematics;
  final String english;
  final String kiswahili;
  final String science;
  final String socialStudies;
  final String total;
  final String term;
  final String year;

  const StudentResultWidget(
    this.studentID,
    this.mathematics,
    this.english,
    this.kiswahili,
    this.science,
    this.socialStudies,
    this.total,
    this.term,
    this.year,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Term: " + term,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "Year: " + year,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "Score: " + total,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mathematics',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          mathematics,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Subject Teacher: ',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300),
                          ),
                        ),
                        Text(
                          "Teacher One",
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'English',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          english,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Subject Teacher: ',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300),
                          ),
                        ),
                        Text(
                          "Teacher One",
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Kiswahili',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          kiswahili,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Subject Teacher: ',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300),
                          ),
                        ),
                        Text(
                          "Teacher One",
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Science',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          science,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Subject Teacher: ',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300),
                          ),
                        ),
                        Text(
                          "Teacher One",
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Social Studies/RE',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          socialStudies,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Subject Teacher: ',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300),
                          ),
                        ),
                        Text(
                          "Teacher One",
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
