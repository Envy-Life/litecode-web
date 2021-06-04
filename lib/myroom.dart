import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:web1/All_rooms.dart';

class myroom extends StatefulWidget {
  const myroom({Key? key}) : super(key: key);

  @override
  _myroomState createState() => _myroomState();
}

class _myroomState extends State<myroom> {
  List roomprofilelist = [
    {
      'name': "God",
      "year": 3,
      "college": "BITS Pilani",
      "ph_number": "+91 whatever",
      "admin": true
    },
    {
      'name': "Parthrick",
      "year": 3,
      "college": "BITS Pilani",
      "ph_number": "+91 whatever",
      "admin": false
    },
    {
      'name': "Parthrick",
      "year": 3,
      "college": "BITS Pilani",
      "ph_number": "+91 whatever",
      "admin": false
    },
    {
      'name': "Parthrick",
      "year": 3,
      "college": "BITS Pilani",
      "ph_number": "+91 whatever",
      "admin": false
    },
  ];
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
                  child: Text(
                    'My Room',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700, fontSize: 36),
                  ),
                ),
                Container(
                  width: 41,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: Allrooms(),
                            type: PageTransitionType.fade,
                            duration: Duration(seconds: 3),
                            reverseDuration: Duration(seconds: 3)));
                  },
                  child: Text(
                    'All Rooms',
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500, fontSize: 36),
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
          Positioned(
              top: 176,
              left: 248,
              child: Text(
                'Members ' + ('(${roomprofilelist.length.toString()})'),
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: 48,
                    color: Color(0xFF333333)),
              )),
          Positioned(
            child: SizedBox(
              width: (609 * 2 + 25),
              height: MediaQuery.of(context).size.height - 248,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 23,
                mainAxisSpacing: 24,
                childAspectRatio: 609 / 181,
                children: [
                  ...roomprofilelist.map((e) => Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23)),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 23, 20, 0),
                          height: 181,
                          width: 609,
                          child: Row(
                            children: [
                              Container(
                                height: 135,
                                width: 135,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: AssetImage(
                                            "assets/icon_placeholder.jpg"))),
                              ),
                              Container(
                                width: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e['name'] +
                                          (e['admin'] ? (' (admin)') : ""),
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 36),
                                    ),
                                    Container(
                                      height: 5,
                                    ),
                                    Text(
                                      subtitletext(e),
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 36),
                                    ),
                                    Container(
                                      height: 5,
                                    ),
                                    Text(
                                      e['ph_number'],
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 36),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFFD1E4FF),
                              borderRadius: BorderRadius.circular(23)),
                        ),
                      ))
                ],
              ),
            ),
            top: 251,
            left: 248,
          )
        ],
      ),
    );
  }

  String subtitletext(e) {
    if (e['year'] == 1) {
      return "1st Year, " + e['college'];
    } else if (e['year'] == 2) {
      return "2nd Year, " + e['college'];
    } else if (e['year'] == 3) {
      return "3rd Year, " + e['college'];
    } else if (e['year'] == 4) {
      return "4th Year, " + e['college'];
    } else if (e['year'] == 5) {
      return "5th Year, " + e['college'];
    }
    return 'error';
  }
}

// Container(
//                         width: 609,
//                         height: 181,
//                         child: ListTile(
//                             contentPadding: EdgeInsets.fromLTRB(0, 23, 0, 0),
//                             tileColor: Color(0xFFD1E4FF),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(23)),
//                             isThreeLine: true,
                            // title: Text(
                            //   e['name'] + (e['admin'] ? (' (admin)') : ""),
                            //   style: GoogleFonts.roboto(
                            //       fontWeight: FontWeight.w700, fontSize: 36),
                            // ),
                            // subtitle: RichText(
                            //   text: TextSpan(children: [
                                // TextSpan(
                                //   text: subtitletext(e) + "\n \n",
                                //   style: GoogleFonts.roboto(
                                //       fontWeight: FontWeight.w400,
                                //       fontSize: 36),
                                // ),
//                                 TextSpan(
//                                     text: e['ph_number'],
//                                     style: GoogleFonts.roboto(
//                                         fontWeight: FontWeight.w700,
//                                         fontSize: 36))
//                               ]),
//                             )),
//                       )
