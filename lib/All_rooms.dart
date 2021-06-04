import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:web1/myroom.dart';

class Allrooms extends StatefulWidget {
  const Allrooms({Key? key}) : super(key: key);

  @override
  _AllroomsState createState() => _AllroomsState();
}

class _AllroomsState extends State<Allrooms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'lc',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 48,
                ),
              ),
              width: 78,
              height: 78,
              decoration: BoxDecoration(
                color: Color(0xFFD1E4FF),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            top: 37,
            left: 39,
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(
                'litecode',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 48,
                ),
              ),
            ),
            top: 37,
            left: 39 + 25 + 78,
          ),
          Positioned(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: myroom(),
                            type: PageTransitionType.fade,
                            duration: Duration(seconds: 1),
                            reverseDuration: Duration(seconds: 1)));
                  },
                  child: Text(
                    'My Room',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500, fontSize: 36),
                  ),
                ),
                Container(
                  width: 41,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'All Rooms',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700, fontSize: 36),
                  ),
                ),
                Container(
                  width: 41,
                ),
                GestureDetector(
                  child: Text(
                    'Profile',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500, fontSize: 36),
                  ),
                ),
                Container(
                  width: 41,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith((states) =>
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(44))),
                          fixedSize: MaterialStateProperty.resolveWith(
                            (states) => Size(162, 57),
                          ),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Color(0xFFD1E4FF))),
                      onPressed: () {},
                      child: Text('logout',
                          style: GoogleFonts.roboto(
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.w500,
                              fontSize: 36))),
                ),
                Container(
                  width: 46,
                ),
              ],
            ),
            top: 40,
            right: 0,
          ),
        ],
      ),
    );
  }
}
