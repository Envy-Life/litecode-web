import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class landingside1 extends StatefulWidget {
  bool signinpressed;
  landingside1(this.signinpressed);
  @override
  _landingside1State createState() => _landingside1State();
}

class _landingside1State extends State<landingside1> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Text(
            'Share Leetcode \npremium accounts.',
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 72),
          ),
          top: MediaQuery.of(context).size.height * 0.3,
          left: 75,
        ),
        Positioned(
          child: Text(
            'Create an account. We match you with a \nroom of similar individuals',
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 32),
          ),
          top: MediaQuery.of(context).size.height * 0.3 + 180,
          left: 75,
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.3 + 320,
            left: 75,
            child: ElevatedButton(
              child: Text(
                'Get started',
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: 48,
                    color: Color(0xFF333333)),
              ),
              onPressed: () {
                widget.signinpressed = !widget.signinpressed;
                setState(() {});
              },
              style: ButtonStyle(
                  fixedSize: MaterialStateProperty.resolveWith(
                      (states) => Size(342, 88)),
                  shape: MaterialStateProperty.resolveWith((states) =>
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(44))),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Color(0xFFD1E4FF))),
            ))
      ],
    );
  }
}
