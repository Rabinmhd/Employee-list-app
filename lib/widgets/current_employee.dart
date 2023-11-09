import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ListTileEmployeeCurr extends StatelessWidget {
  String name;
  String role;
  String fromDate;

  ListTileEmployeeCurr({
    super.key,
    required this.name,
    required this.role,
    required this.fromDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Text(
            name,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF949C9E),
            ),
          ),
          Text(
            "From $fromDate",
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF949C9E),
            ),
          )
        ],
      ),
    );
  }
}
